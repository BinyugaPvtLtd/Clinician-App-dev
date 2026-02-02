import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'package:clinician_app/core/constant/app_colors.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../controller/chat_controller.dart';
import '../../../core/ui/common_appbar.dart';
import '../../../core/ui/common_divider.dart';
import '../../../model/chatScreen/group_info_model.dart';


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

  bool _looksLikeImageUrl(String url) {
    final lower = url.toLowerCase();
    return lower.endsWith('.png') ||
        lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.webp') ||
        lower.endsWith('.gif');
  }

  Widget _netImageOrIcon({
    required String url,
    required double width,
    required double height,
    BoxFit fit = BoxFit.cover,
    double iconSize = 30,
  }) {
    final ok = _isValidHttpUrl(url) && _looksLikeImageUrl(url);

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

  void _openPreviewPopup(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (context) {
        final isPdf = url.toLowerCase().endsWith(".pdf");

        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                  top: isPdf ? 40 : 10,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: isPdf ? _buildPdfViewer(url) : _buildImageViewer(url),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 28, color: Colors.black),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageViewer(String url) {
    return Center(
      child: _netImageOrIcon(
        url: url,
        width: 800,
        height: 800,
        fit: BoxFit.contain,
        iconSize: 80,
      ),
    );
  }


  Widget _buildPdfViewer(String url) {
    // On mobile platforms we download the PDF to a temporary file and open
    // it with the native PDF viewer using `open_file`.
    // On web (or unsupported platforms) we fall back to a simple message.

    // if (kIsWeb) {
    //   // Web: can't use native open; show a simple link that opens in a new tab.
    //   return Center(
    //     child: ElevatedButton.icon(
    //       icon: const Icon(Icons.open_in_new),
    //       label: const Text('Open PDF'),
    //       onPressed: () async {
    //         // Use a JS/HTML link to open in new tab - easiest fallback.
    //         // We use window.open from dart:html only on web; this file avoids
    //         // importing dart:html directly to remain mobile-friendly. If you
    //         // need the web behavior improved, we can add a web-only import.
    //         // For now, open the url using OpenFile (may not work on web).
    //         await _openPdfUrlWeb(url);
    //       },
    //     ),
    //   );
    // }

    // Mobile / desktop: return a widget with a button that downloads and opens the PDF.
    return Center(
      child: ElevatedButton.icon(
        icon: const Icon(Icons.picture_as_pdf),
        label: const Text('Open PDF'),
        onPressed: () async {
          try {
            final path = await _downloadToTempFile(url);
            if (path != null) await OpenFile.open(path);
          } catch (e) {
            // ignore errors; show a snackbar if context available
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to open PDF: $e')),
              );
            }
          }
        },
      ),
    );
  }

  // Download a remote URL to a temporary file and return its path.
  Future<String?> _downloadToTempFile(String url) async {
    try {
      final uri = Uri.parse(url);
      final resp = await http.get(uri);
      if (resp.statusCode != 200) throw Exception('HTTP ${resp.statusCode}');

      final bytes = resp.bodyBytes;
      final dir = await getTemporaryDirectory();
      final fileName = 'pdf_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final file = File('${dir.path}/$fileName');
      await file.writeAsBytes(bytes);
      return file.path;
    } catch (e) {
      debugPrint('PDF download failed: $e');
      return null;
    }
  }

  // Minimal web opener: attempts to open the url in a new tab.
  // We avoid importing 'dart:html' at top-level to keep file mobile-safe.
  Future<void> _openPdfUrlWeb(String url) async {
    // Try to use OpenFile as best-effort; on web you may want to add a
    // small web-only helper using `dart:html`.
    try {
      await OpenFile.open(url);
    } catch (_) {
      // No-op: web will fallback to letting the browser handle the URL.
    }
  }

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
                              final isPdf = url.toLowerCase().contains(".pdf");

                              return InkWell(
                                onTap: () => _openPreviewPopup(context, url),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: isPdf
                                      ? Icon(Icons.description, size: 40, color: AppColors.primaryAppColor)
                                      : _netImageOrIcon(
                                    url: url,
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                    iconSize: 20,
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
