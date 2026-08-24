import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'package:clinician_app/core/constant/app_colors.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../controller/chat_controller.dart';
import '../../../controller/repository/chat_repo.dart';
import '../../../core/ui/common_appbar.dart';
import '../../../core/ui/common_divider.dart';
import '../../../model/chatScreen/group_info_model.dart';
import 'chat_element_widget.dart';


class GroupInfoScreen extends StatefulWidget {
  final int groupId;
  final VoidCallback onClose;

  const GroupInfoScreen({
    super.key,
    required this.groupId,
    required this.onClose,
  });

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> with SingleTickerProviderStateMixin {
  final StreamController<PatientsGroupInfoData> groupInfoController =
  StreamController<PatientsGroupInfoData>();
  final ChatDataController chatController = Get.put(ChatDataController());

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadPatientsGroupInfo();
  }

  Future<void> _loadPatientsGroupInfo() async {
    try {
      final data = await chatController.getAllPatientsGroupInfo(widget.groupId);
      groupInfoController.add(data!);
    } catch (e) {
      groupInfoController.addError(e);
    }
  }

  // -------------------- ✅ SAFE IMAGE HELPERS --------------------
  bool _isValidHttpUrl(String url) {
    if (url.isEmpty || url == 'imgurl' || url == 'string') return false;
    final u = Uri.tryParse(url);
    return u != null && (u.scheme == 'http' || u.scheme == 'https');
  }

  // Attachment URLs are often signed (e.g. "...photo.jpg?token=..."), so the
  // extension has to be read off the URI's path — checking the raw string
  // with endsWith() silently fails on the query string and the image never
  // renders (falls back to the placeholder icon).
  String _urlPath(String url) => (Uri.tryParse(url)?.path ?? url).toLowerCase();

  bool _looksLikePdfUrl(String url) => _urlPath(url).endsWith('.pdf');

  // The backend already tags each item with a mediaType (e.g. "image",
  // "pdf"); trust that over guessing from the URL, which is often signed and
  // carries no recognizable extension. Fall back to the extension only when
  // mediaType is missing/ambiguous.
  bool _isPdfItem(MediaLinksData item) {
    final type = item.mediaType.toLowerCase();
    if (type.contains('pdf') || type.contains('doc')) return true;
    if (type.contains('image') || type.contains('photo') || type.contains('img')) return false;
    return _looksLikePdfUrl(item.mediaUrl);
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Same secure download used in the chat bubbles: fetches the file through
  // the authenticated API (not a plain http.get on the raw URL) before
  // opening it, so this behaves identically to tapping a PDF in the chat.
  Future<void> _downloadAndOpenPdf(String url) async {
    try {
      _showMessage("PDF downloading...");

      final fileData = await chatController.getEmployeeDocumentByFileName(
        fileUrl: url,
        apiPath: ChatRepository.getChatImagesBasePath(isGroup: true),
      );

      if (fileData == null) {
        _showMessage("PDF download failed");
        return;
      }

      final dir = await getTemporaryDirectory();
      final savePath = "${dir.path}/${fileData.fileName}";
      await File(savePath).writeAsBytes(fileData.bytes, flush: true);

      await OpenFile.open(savePath);
    } catch (e) {
      _showMessage("PDF open failed: $e");
    }
  }

  void _openImages(List<String> images, int initialIndex) {
    Get.to(() => ImagePreviewScreen(
      imageUrls: images,
      initialIndex: initialIndex,
      isGroup: true,
    ));
  }

  Widget _netImageOrIcon({
    required String url,
    required double width,
    required double height,
    BoxFit fit = BoxFit.cover,
    double iconSize = 30,
  }) {
    // Media URLs are signed and often carry no recognizable file extension
    // (e.g. a token-only path), so gating on the extension kept real images
    // stuck on the placeholder icon. Any valid http(s) URL is attempted —
    // Image.network's errorBuilder below still catches genuine failures.
    final ok = _isValidHttpUrl(url);

    if (!ok) {
      return Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        alignment: Alignment.center,
        child: Icon(Icons.person, color: Colors.grey[400], size: iconSize),
      );
    }

    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        alignment: Alignment.center,
        child: Icon(Icons.person, color: Colors.grey[400], size: iconSize),
      ),
    );
  }

  // -------------------------------------------------------------

  @override
  void dispose() {
    _tabController.dispose();
    groupInfoController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            CommonAppbar(label: 'Group Info'),
            CommonDivider(color: const Color(0xffDADADA)),
            const SizedBox(height: 10),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.h),
                child: StreamBuilder<PatientsGroupInfoData>(
                  stream: groupInfoController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(color: AppColors.primaryAppColor),
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "Failed to load group info",
                          style: AllNoDataAvailable.customTextStyle(context),
                        ),
                      );
                    }

                    if (!snapshot.hasData) {
                      return Center(
                        child: Text(
                          "No group info available",
                          style: AllNoDataAvailable.customTextStyle(context),
                        ),
                      );
                    }

                    final groupInfo = snapshot.data!;

                    return ListView(
                      children: [
                        // ✅ Group avatar (safe)
                        Center(
                          child: ClipOval(
                            child: _netImageOrIcon(
                              url: groupInfo.groupProfileUrl,
                              width: 90,
                              height: 90,
                              iconSize: 50,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Center(
                          child: Text(
                            groupInfo.groupName,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),

                        Text(
                          "About",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          groupInfo.groupDescription,
                          style: const TextStyle(color: Colors.black87, fontSize: 12),
                        ),
                        const SizedBox(height: 12),
                        const Divider(thickness: 2, height: 1),
                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Media, links and doc",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColors.blackfaint,
                              ),
                            ),
                            Icon(Icons.chevron_right, color: AppColors.greyShade400, size:18),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // ✅ Media thumbnails (safe)
                        SizedBox(
                          height: 60,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: groupInfo.mediaLinksAndDocs.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 6),
                            itemBuilder: (context, index) {
                              final item = groupInfo.mediaLinksAndDocs[index];
                              final url = item.mediaUrl;
                              final isPdf = _isPdfItem(item);

                              // Same behaviour as the chat bubbles: tapping a
                              // PDF downloads+opens it, tapping an image opens
                              // the shared fullscreen preview (with its own
                              // save-to-gallery action). Everything that
                              // isn't a PDF here is an image, so treat it as
                              // one rather than re-checking the extension.
                              final imageUrls = groupInfo.mediaLinksAndDocs
                                  .where((m) => !_isPdfItem(m))
                                  .map((m) => m.mediaUrl)
                                  .toList();

                              return InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  if (isPdf) {
                                    _downloadAndOpenPdf(url);
                                  } else {
                                    _openImages(imageUrls, imageUrls.indexOf(url));
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: isPdf
                                      ? Icon(Icons.description, size: 40, color: AppColors.primaryAppColor)
                                      : SecureNetworkImage(
                                    url: url,
                                    isGroup: true,
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                    placeholderIconSize: 20,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 12),
                        const Divider(thickness: 2, height: 1),
                        const SizedBox(height: 12),

                        Text(
                          "All Participants",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.blackfaint,
                          ),
                        ),
                        const SizedBox(height: 8),

                        ...groupInfo.allParticipants.map(
                              (p) => _participantTile(p.fullName, p.imgUrl),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _participantTile(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          // ✅ Participant avatar (safe)
          ClipOval(
            child: _netImageOrIcon(
              url: imagePath,
              width: 36,
              height: 36,
              fit: BoxFit.cover,
              iconSize: 22,
            ),
          ),

          const SizedBox(width: 6),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.blackfaint,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}









///
class AllNoDataAvailable {
  static TextStyle customTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: AppColors.mediumgrey,
      decoration: TextDecoration.none,
    );
  }
}
