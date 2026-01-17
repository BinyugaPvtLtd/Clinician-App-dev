import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../services/token_manager/token_manager_service.dart';

const String appId = "a7cde21575824bd5aa83fc2d54750430";

/// ✅ Goal:
/// Map your backend `receiverUserId` (string/int like 73,47) to the *actual Agora remote uid*
/// reliably.
///
/// ✅ Correct way (recommended):
/// Use Agora "userAccount" = your backend userId string on BOTH sides, then Agora gives:
/// - remoteAgoraUid (int) in onUserJoined
/// - remoteUserAccount (string) in onUserInfoUpdated
///
/// That lets you map:
/// receiverUserId <-> remoteAgoraUid
///
/// IMPORTANT: Every client MUST join using joinChannelWithUserAccount with their own backend userId.
class VideoCallAgoraScreen extends StatefulWidget {
  final bool isVideoOn;
  final bool isAudioOn;
  final String? userName;
  final String channelName;
  final String token;

  final int? callId;
  final String? status;
  final String? userImage;
  final bool? isBusyCall;

  final String? groupName;
  final String? groupImage;

  final String? receiverName;
  final String? receiverImage;

  final List<String>? receiverNames;
  final List<String>? receiverImages;

  /// backend ids (dynamic in your old code) -> we normalize to String
  final List<dynamic>? receiverIds;

  const VideoCallAgoraScreen({
    Key? key,
    this.groupImage,
    this.groupName,
    this.userImage,
    this.isBusyCall = false,
    required this.isVideoOn,
    required this.isAudioOn,
    required this.channelName,
    required this.token,
    this.callId,
    this.status,
    this.userName,
    this.receiverIds,
    this.receiverImage,
    this.receiverName,
    this.receiverNames,
    this.receiverImages,
  }) : super(key: key);

  @override
  State<VideoCallAgoraScreen> createState() => _VideoCallAgoraScreenState();
}

class _VideoCallAgoraScreenState extends State<VideoCallAgoraScreen> {
  // Remote Agora UIDs (ints) stored as strings for UI lists
  final List<String> _remoteUids = [];
  late final RtcEngine _engine;

  bool _engineInitialized = false;
  bool _localJoined = false;

  bool _muted = false;
  bool _isLocalVideoOff = true;

  final Map<String, bool> remoteVideoOff = {};
  final Map<String, bool> remoteAudioMuted = {};
  final Map<String, bool> remoteSpeaking = {};

  bool _localSpeaking = false;

  /// ✅ NEW: AgoraUid -> backendUserId (receiverUserId / userId)
  /// Example: { "123456": "73" }
  final Map<String, String> agoraUidToBackendId = {};

  /// ✅ NEW: backendUserId -> AgoraUid
  /// Example: { "73": "123456" }
  final Map<String, String> backendIdToAgoraUid = {};

  /// Display identity maps keyed by AgoraUid string
  final Map<String, String> uidToName = {};
  final Map<String, String> uidToImage = {};

  Timer? _waitingTimer;
  int _waitingSeconds = 0;
  final int maxWaitSeconds = 120;

  Timer? _callTimer;
  int _callSeconds = 0;
  bool _callStarted = false;

  Offset _pipOffset = const Offset(16, 120);

  // -------------------- helpers: normalize incoming receiver lists --------------------
  List<String> get _receiverIdsAsString =>
      (widget.receiverIds ?? []).map((e) => e.toString()).toList();

  List<String> _getRemoteNames() {
    if (widget.receiverNames != null && widget.receiverNames!.isNotEmpty) {
      return widget.receiverNames!;
    }
    return [widget.receiverName ?? "Participant"];
  }

  List<String> _getRemoteImages() {
    if (widget.receiverNames != null && widget.receiverNames!.isNotEmpty) {
      return widget.receiverImages ??
          List.generate(widget.receiverNames!.length, (_) => "");
    }
    return [widget.receiverImage ?? ""];
  }

  /// ✅ Resolve identity (name/image) by backendUserId (preferred),
  /// otherwise fallback to "User <agoraUid>"
  void _resolveIdentityForAgoraUid({
    required String agoraUid,
    String? backendUserId,
  }) {
    final ids = _receiverIdsAsString;
    final names = _getRemoteNames();
    final images = _getRemoteImages();

    // If we know backendUserId and it exists in receiverIds, use the matching index.
    if (backendUserId != null && ids.isNotEmpty) {
      final idx = ids.indexOf(backendUserId);
      if (idx >= 0) {
        uidToName[agoraUid] = (idx < names.length) ? names[idx] : "User $backendUserId";
        uidToImage[agoraUid] = (idx < images.length) ? images[idx] : "";
        return;
      }
    }

    // Fallback: if only 1 participant expected, show that receiverName/image.
    if (names.length == 1) {
      uidToName[agoraUid] = names.first;
      uidToImage[agoraUid] = images.first;
      return;
    }

    // Otherwise fallback to generic label
    uidToName[agoraUid] = backendUserId != null ? "User $backendUserId" : "User $agoraUid";
    uidToImage[agoraUid] = "";
  }

  @override
  void initState() {
    super.initState();
    _muted = !widget.isAudioOn;
    _isLocalVideoOff = !widget.isVideoOn;

    _initAgoraMobile();
    _startWaitTimer();
  }

  // -------------------- Permissions --------------------
  Future<bool> _ensurePermissions() async {
    if (widget.isVideoOn) {
      final cam = await Permission.camera.request();
      if (!cam.isGranted) return false;
    }
    if (widget.isAudioOn) {
      final mic = await Permission.microphone.request();
      if (!mic.isGranted) return false;
    }
    return true;
  }

  // -------------------- Timers --------------------
  void _startWaitTimer() {
    _waitingTimer?.cancel();
    _waitingTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_remoteUids.isNotEmpty) {
        timer.cancel();
        return;
      }
      if (!mounted) return;
      setState(() => _waitingSeconds++);

      if (_waitingSeconds >= maxWaitSeconds) {
        timer.cancel();
        if (mounted) Navigator.pop(context);
      }
    });
  }

  void _startCallTimer() {
    if (_callStarted) return;
    _callStarted = true;
    _callTimer?.cancel();
    _callTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _callSeconds++);
    });
  }

  void _stopCallTimer() {
    _callTimer?.cancel();
    _callTimer = null;
  }

  String get _formattedCallDuration {
    final h = _callSeconds ~/ 3600;
    final m = (_callSeconds % 3600) ~/ 60;
    final s = _callSeconds % 60;

    if (h > 0) {
      return '${h.toString().padLeft(2, '0')}:'
          '${m.toString().padLeft(2, '0')}:'
          '${s.toString().padLeft(2, '0')}';
    }
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  // -------------------- Agora init (Mobile) --------------------
  Future<void> _initAgoraMobile() async {
    try {
      final ok = await _ensurePermissions();
      if (!ok) {
        if (!mounted) return;
        _showPermissionDialog();
        return;
      }

      _engine = createAgoraRtcEngine();
      await _engine.initialize(
        const RtcEngineContext(
          appId: appId,
          channelProfile: ChannelProfileType.channelProfileCommunication,
        ),
      );

      _engine.registerEventHandler(
        RtcEngineEventHandler(
          onJoinChannelSuccess: (_, __) {
            if (!mounted) return;
            setState(() => _localJoined = true);
          },

          /// ✅ Remote joined (we get Agora uid only)
          onUserJoined: (connection, uid, elapsed) async {
            final agoraUid = uid.toString();
            if (!_remoteUids.contains(agoraUid)) _remoteUids.add(agoraUid);

            _resolveIdentityForAgoraUid(agoraUid: agoraUid); // placeholder first
            setState(() {});

            // ✅ Try to pull userAccount immediately
            final info = await _engine.getUserInfoByUid(uid);
            final backendId = (info.userAccount ?? '').toString();
            if (backendId.isNotEmpty) {
              agoraUidToBackendId[agoraUid] = backendId;
              backendIdToAgoraUid[backendId] = agoraUid;
              _resolveIdentityForAgoraUid(agoraUid: agoraUid, backendUserId: backendId);
              if (mounted) setState(() {});
            }
          },


          /// ✅ This is the key: Agora tells us the remote user's userAccount.
          /// We set userAccount = backend userId (string) on join.
          onUserInfoUpdated: (int uid, UserInfo info) {
            if (!mounted) return;

            final agoraUid = uid.toString();
            final backendId = (info.userAccount ?? '').toString();

            if (backendId.isNotEmpty) {
              agoraUidToBackendId[agoraUid] = backendId;
              backendIdToAgoraUid[backendId] = agoraUid;

              _resolveIdentityForAgoraUid(
                agoraUid: agoraUid,
                backendUserId: backendId,
              );
            }

            setState(() {});
          },


          onUserOffline: (_, uid, __) {
            if (!mounted) return;
            final agoraUid = uid.toString();

            // cleanup mapping
            final backendId = agoraUidToBackendId.remove(agoraUid);
            if (backendId != null) {
              backendIdToAgoraUid.remove(backendId);
            }

            setState(() {
              _remoteUids.remove(agoraUid);
              remoteVideoOff.remove(agoraUid);
              remoteAudioMuted.remove(agoraUid);
              remoteSpeaking.remove(agoraUid);
              uidToName.remove(agoraUid);
              uidToImage.remove(agoraUid);
            });
          },

          onUserMuteVideo: (_, uid, muted) {
            if (!mounted) return;
            setState(() => remoteVideoOff[uid.toString()] = muted);
          },

          onUserMuteAudio: (_, uid, muted) {
            if (!mounted) return;
            setState(() => remoteAudioMuted[uid.toString()] = muted);
          },

          onAudioVolumeIndication: (_, speakers, __, ___) {
            if (!mounted) return;

            setState(() {
              _localSpeaking = false;
              for (final uid in _remoteUids) {
                remoteSpeaking[uid] = false;
              }

              for (final s in speakers) {
                final sUid = s.uid;
                final vol = s.volume ?? 0;
                if (sUid == null) continue;

                if (sUid == 0) {
                  _localSpeaking = vol > 30;
                } else {
                  final agoraUid = sUid.toString();
                  if (_remoteUids.contains(agoraUid)) {
                    remoteSpeaking[agoraUid] = vol > 30;
                  }
                }
              }
            });
          },
        ),
      );

      await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);

      await _engine.enableAudio();
      if (widget.isVideoOn) {
        await _engine.enableVideo();
      } else {
        await _engine.disableVideo();
      }

      if (_muted) {
        await _engine.muteLocalAudioStream(true);
      }
      if (_isLocalVideoOff) {
        await _engine.muteLocalVideoStream(true);
      }

      await _engine.enableAudioVolumeIndication(
        interval: 200,
        smooth: 3,
        reportVad: true,
      );

      /// ✅ Use backend userId as userAccount
      var localAccount = await TokenManager.getUserId();
      print('Remote user ${widget.receiverIds}');
      /// ✅ IMPORTANT: use widget.token (you were passing "" before)
      await _engine.joinChannel(
        token: "",
        channelId: widget.channelName,
        uid: localAccount,
        options:  ChannelMediaOptions(),
      );

      if (widget.isVideoOn && !_isLocalVideoOff) {
        await _engine.startPreview();
      }

      if (!mounted) return;
      setState(() => _engineInitialized = true);
    } catch (e) {
      debugPrint("Agora Init Error (mobile): $e");
      if (!mounted) return;
      _showErrorDialog(e.toString());
    }
  }

  @override
  void dispose() {
    _waitingTimer?.cancel();
    _stopCallTimer();
    if (_engineInitialized) {
      _engine.leaveChannel();
      _engine.release();
    }
    super.dispose();
  }

  // -------------------- UI --------------------
  @override
  Widget build(BuildContext context) {
    if (!_engineInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      );
    }

    final bool videoMode = widget.isVideoOn;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: videoMode ? _remoteVideoStage() : _audioStage(),
            ),
            Positioned(
              top: 8,
              left: 8,
              right: 8,
              child: _topBar(),
            ),
            if (videoMode) _localPip(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: _bottomControls(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    final title = (widget.groupName?.isNotEmpty ?? false)
        ? widget.groupName!
        : (widget.receiverName ?? "Call");

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                _callStarted ? _formattedCallDuration : _statusText(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: _openParticipantsSheet,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0x33FFFFFF),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.group, color: Colors.white, size: 18),
                const SizedBox(width: 6),
                Text(
                  '${_remoteUids.length + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _statusText() {
    if (widget.isBusyCall == true) return "User is on another call...";
    if (_remoteUids.isEmpty) return "Dialing… ${maxWaitSeconds - _waitingSeconds}s";
    if (!_callStarted) return "Connecting…";
    return "In call";
  }

  // -------- Remote video stage
  Widget _remoteVideoStage() {
    if (_remoteUids.isEmpty) {
      return Center(
        child: Text(
          widget.isBusyCall == true ? "This user is on another call..." : "Dialing...",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    if (_remoteUids.length == 1) {
      final String agoraUid = _remoteUids.first;
      final bool isRemoteVideoOff = remoteVideoOff[agoraUid] ?? false;

      if (isRemoteVideoOff) {
        return _centerAvatar(
          image: uidToImage[agoraUid],
          name: uidToName[agoraUid] ?? "Participant",
          speaking: remoteSpeaking[agoraUid] ?? false,
          muted: remoteAudioMuted[agoraUid] ?? false,
          big: true,
        );
      }

      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: int.tryParse(agoraUid) ?? 0),
          connection: RtcConnection(channelId: widget.channelName),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
        return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 1,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
          ),
          itemCount: _remoteUids.length,
          itemBuilder: (_, idx) {
            final agoraUid = _remoteUids[idx];
            final isOff = remoteVideoOff[agoraUid] ?? false;
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: const Color(0xFF111111),
                child: Stack(
                  children: [
                    if (isOff)
                      Center(
                        child: _centerAvatar(
                          image: uidToImage[agoraUid],
                          name: uidToName[agoraUid] ?? "Participant",
                          speaking: remoteSpeaking[agoraUid] ?? false,
                          muted: remoteAudioMuted[agoraUid] ?? false,
                          big: false,
                        ),
                      )
                    else
                      AgoraVideoView(
                        controller: VideoViewController.remote(
                          rtcEngine: _engine,
                          canvas: VideoCanvas(uid: int.tryParse(agoraUid) ?? 0),
                          connection: RtcConnection(channelId: widget.channelName),
                        ),
                      ),
                    Positioned(
                      left: 8,
                      bottom: 8,
                      right: 8,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              uidToName[agoraUid] ?? "Participant",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (remoteAudioMuted[agoraUid] ?? false)
                            const Padding(
                              padding: EdgeInsets.only(left: 6.0),
                              child: Icon(Icons.mic_off, size: 14, color: Colors.redAccent),
                            )
                          else if (remoteSpeaking[agoraUid] ?? false)
                            const Padding(
                              padding: EdgeInsets.only(left: 6.0),
                              child: Icon(Icons.graphic_eq, size: 14, color: Colors.greenAccent),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // -------- Audio stage
  Widget _audioStage() {
    final tiles = <Widget>[
      _audioTile(
        image: widget.userImage,
        name: widget.userName ?? "You",
        isMe: true,
        speaking: _localSpeaking,
        muted: _muted,
      ),
      ..._remoteUids.map((agoraUid) {
        return _audioTile(
          image: uidToImage[agoraUid],
          name: uidToName[agoraUid] ?? "User $agoraUid",
          isMe: false,
          speaking: remoteSpeaking[agoraUid] ?? false,
          muted: remoteAudioMuted[agoraUid] ?? false,
        );
      }),
    ];

    if (_remoteUids.isEmpty) {
      return Center(
        child: Text(
          widget.isBusyCall == true ? "This user is on another call..." : "Dialing...",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 18,
          runSpacing: 18,
          children: tiles,
        ),
      ),
    );
  }

  // -------- Local PIP
  Widget _localPip() {
    final size = MediaQuery.of(context).size;
    final pipW = size.width * 0.32;
    final pipH = size.height * 0.22;

    final dx = _pipOffset.dx.clamp(8.0, (size.width - pipW - 8).toDouble());
    final dy = _pipOffset.dy.clamp(60.0, (size.height - pipH - 140).toDouble());

    final pip = ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: pipW,
        height: pipH,
        decoration: BoxDecoration(
          color: const Color(0xFF222222),
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: _isLocalVideoOff
                  ? _centerAvatar(
                image: widget.userImage,
                name: widget.userName ?? "You",
                speaking: _localSpeaking,
                muted: _muted,
                big: false,
              )
                  : AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: _engine,
                  canvas: const VideoCanvas(uid: 0),
                ),
              ),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_muted) const Icon(Icons.mic_off, size: 14, color: Colors.redAccent),
                    if (!_muted && _localSpeaking)
                      const Icon(Icons.graphic_eq, size: 14, color: Colors.greenAccent),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Positioned(
      left: dx,
      top: dy,
      child: GestureDetector(
        onPanUpdate: (d) => setState(() => _pipOffset += d.delta),
        child: pip,
      ),
    );
  }

  // -------- Bottom controls
  Widget _bottomControls() {
    final bool videoMode = widget.isVideoOn;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 4,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _circleButton(
                icon: _muted ? Icons.mic_off : Icons.mic,
                bg: const Color(0x33FFFFFF),
                iconColor: _muted ? Colors.redAccent : Colors.white,
                onTap: () async {
                  setState(() => _muted = !_muted);
                  await _engine.muteLocalAudioStream(_muted);
                },
              ),
              if (videoMode)
                _circleButton(
                  icon: _isLocalVideoOff ? Icons.videocam_off : Icons.videocam,
                  bg: const Color(0x33FFFFFF),
                  iconColor: _isLocalVideoOff ? Colors.redAccent : Colors.white,
                  onTap: () async {
                    setState(() => _isLocalVideoOff = !_isLocalVideoOff);
                    await _engine.muteLocalVideoStream(_isLocalVideoOff);
                    if (!_isLocalVideoOff) {
                      await _engine.startPreview();
                    }
                  },
                ),
              _circleButton(
                icon: Icons.call_end,
                bg: Colors.red,
                iconColor: Colors.white,
                onTap: () async {
                  await _engine.leaveChannel();
                  if (mounted) Navigator.pop(context);
                },
              ),
              if (videoMode)
                _circleButton(
                  icon: Icons.cameraswitch,
                  bg: const Color(0x33FFFFFF),
                  iconColor: Colors.white,
                  onTap: () async => _engine.switchCamera(),
                ),
              _circleButton(
                icon: Icons.group,
                bg: const Color(0x33FFFFFF),
                iconColor: Colors.white,
                onTap: _openParticipantsSheet,
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required Color bg,
    required Color iconColor,
    required FutureOr<void> Function() onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: () async => onTap(),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: bg,
        child: Icon(icon, color: iconColor),
      ),
    );
  }

  // -------- Participants bottom sheet
  void _openParticipantsSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF121212),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (_) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text(
                      "Participants",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "${_remoteUids.length + 1}",
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _participantRow(
                  name: "${widget.userName ?? "You"} (You)",
                  image: widget.userImage,
                  muted: _muted,
                  speaking: _localSpeaking,
                ),
                const Divider(color: Colors.white12),
                if (_remoteUids.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text("No one joined yet", style: TextStyle(color: Colors.white70)),
                  )
                else
                  Flexible(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: _remoteUids.length,
                      separatorBuilder: (_, __) => const Divider(color: Colors.white12),
                      itemBuilder: (_, i) {
                        final agoraUid = _remoteUids[i];
                        final backendId = agoraUidToBackendId[agoraUid];

                        // 👇 This is the mapping you asked for:
                        // receiverUserId/backendId -> actual remote agoraUid
                        final display = backendId != null
                            ? "${uidToName[agoraUid] ?? "User $backendId"}  (id:$backendId / agora:$agoraUid)"
                            : "${uidToName[agoraUid] ?? "User $agoraUid"} (agora:$agoraUid)";

                        return _participantRow(
                          name: display,
                          image: uidToImage[agoraUid],
                          muted: remoteAudioMuted[agoraUid] ?? false,
                          speaking: (remoteSpeaking[agoraUid] ?? false) && !(remoteAudioMuted[agoraUid] ?? false),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _participantRow({
    required String name,
    required String? image,
    required bool muted,
    required bool speaking,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: const Color(0xFF2A2A2A),
          backgroundImage: (image != null && image.isNotEmpty) ? NetworkImage(image) : null,
          child: (image == null || image.isEmpty)
              ? const Icon(Icons.person, color: Colors.white70, size: 18)
              : null,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (muted)
          const Icon(Icons.mic_off, size: 18, color: Colors.redAccent)
        else if (speaking)
          const Icon(Icons.graphic_eq, size: 18, color: Colors.greenAccent),
      ],
    );
  }

  // -------- Avatar helpers
  Widget _audioTile({
    required String? image,
    required String name,
    required bool isMe,
    required bool speaking,
    required bool muted,
  }) {
    return SizedBox(
      width: 140,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (speaking && !muted)
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.greenAccent, width: 3),
                  ),
                ),
              CircleAvatar(
                radius: 38,
                backgroundColor: const Color(0xFF2A2A2A),
                backgroundImage: (image != null && image.isNotEmpty) ? NetworkImage(image) : null,
                child: (image == null || image.isEmpty)
                    ? Icon(isMe ? Icons.person : Icons.person_outline, color: Colors.white, size: 36)
                    : null,
              ),
              if (muted)
                const Positioned(
                  bottom: 4,
                  right: 4,
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.mic_off, size: 14, color: Colors.white),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          if (isMe)
            const Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text("(You)", style: TextStyle(color: Colors.white70, fontSize: 12)),
            ),
        ],
      ),
    );
  }

  Widget _centerAvatar({
    required String? image,
    required String name,
    required bool speaking,
    required bool muted,
    required bool big,
  }) {
    final double r = big ? 56 : 38;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (speaking && !muted)
                Container(
                  width: (r * 2) + 10,
                  height: (r * 2) + 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.greenAccent, width: 3),
                  ),
                ),
              CircleAvatar(
                radius: r,
                backgroundColor: const Color(0xFF2A2A2A),
                backgroundImage: (image != null && image.isNotEmpty) ? NetworkImage(image) : null,
                child: (image == null || image.isEmpty)
                    ? Icon(Icons.person, color: Colors.white, size: big ? 56 : 40)
                    : null,
              ),
              if (muted)
                const Positioned(
                  bottom: 6,
                  right: 6,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.mic_off, size: 16, color: Colors.white),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: big ? 18 : 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // -------------------- dialogs --------------------
  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Permissions required"),
        content: const Text("Camera/Microphone permission is required to start the call."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
          TextButton(
            onPressed: () => openAppSettings(),
            child: const Text("Open Settings"),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Call error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
