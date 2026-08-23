import 'dart:io';
import 'dart:typed_data';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/pages/home/chat_screen.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../controller/chat_controller.dart';
import '../../../controller/repository/chat_repo.dart';

class ChatElementWidget extends StatefulWidget {
  const ChatElementWidget({
    super.key,
    required this.isGroup,
    required this.chat,
  });

  final bool isGroup;
  final ChatModel chat;

  @override
  State<ChatElementWidget> createState() => _ChatElementWidgetState();
}

class _ChatElementWidgetState extends State<ChatElementWidget> {
  final ChatDataController controller = Get.find<ChatDataController>();

  String _formatTime(DateTime dt) => DateFormat('h:mm a').format(dt.toLocal());

  // Attachment URLs are often signed (e.g. "...photo.jpg?token=..."), so the
  // extension has to be read off the URI's path — checking the raw string
  // with endsWith() silently fails on the query string and the attachment
  // renders as nothing at all (no image, no PDF row, no error).
  String _urlPath(String url) => (Uri.tryParse(url)?.path ?? url).toLowerCase();

  bool _isImage(String url) {
    final path = _urlPath(url);
    return path.endsWith('.jpg') || path.endsWith('.jpeg') || path.endsWith('.png');
  }

  bool _isPdf(String url) => _urlPath(url).endsWith('.pdf');

  bool _isImageName(String name) {
    final lower = name.toLowerCase();
    return lower.endsWith('.jpg') || lower.endsWith('.jpeg') || lower.endsWith('.png');
  }

  bool _isPdfName(String name) => name.toLowerCase().endsWith('.pdf');

  Widget _pdfRow(String name, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 6.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.picture_as_pdf,
              size: 26,
              color: widget.chat.isSender ? Colors.white : Colors.black,
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                name,
                style: AppTextStyle.normal10style.copyWith(
                  color: widget.chat.isSender ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _fileName(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.pathSegments.isNotEmpty ? uri.pathSegments.last : 'file';
    } catch (_) {
      return 'file';
    }
  }

  // GetX's Get.snackbar resolves its overlay via a private Overlay-context
  // hack that can throw "No Overlay widget found" (and can leave a broken
  // SnackbarController registered, later crashing Get.back() with a
  // LateInitializationError). ScaffoldMessenger.of(context) uses the
  // ScaffoldMessenger that GetMaterialApp/MaterialApp always provides, so it
  // doesn't share either failure mode.
  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // ===========================
  // ✅ DOWNLOAD + OPEN PDF
  // ===========================
  Future<void> _downloadAndOpenPdf(String url) async {
    try {
      _showMessage("PDF downloading...");

      final fileData = await controller.getEmployeeDocumentByFileName(
        fileUrl: url,
        apiPath: ChatRepository.getChatImagesBasePath(isGroup: widget.isGroup),
      );

      if (fileData == null) {
        _showMessage("PDF download failed");
        return;
      }

      final dir = await getTemporaryDirectory();
      final savePath = "${dir.path}/${fileData.fileName}";
      await File(savePath).writeAsBytes(fileData.bytes, flush: true);

      // ✅ open after download
      await OpenFile.open(savePath);
    } catch (e) {
      _showMessage("PDF open failed: $e");
    }
  }

  // ===========================
  // ✅ DOWNLOAD IMAGE TO GALLERY
  // ===========================
  Future<void> _downloadImageToGallery(String url) async {
    try {
      // permissions
      if (Platform.isAndroid) {
        // Android 13+ uses READ_MEDIA_IMAGES
        await Permission.photos.request(); // iOS
        await Permission.storage.request(); // older android
        await Permission.photos.request(); // android 13+ fallback
        // we won't strictly block; but check some permission granted
      }

      _showMessage("Saving image to gallery...");

      final fileData = await controller.getEmployeeDocumentByFileName(
        fileUrl: url,
        apiPath: ChatRepository.getChatImagesBasePath(isGroup: widget.isGroup),
      );

      if (fileData == null) {
        _showMessage("Image save failed");
        return;
      }

      final result = await ImageGallerySaverPlus.saveImage(
        Uint8List.fromList(fileData.bytes),
        quality: 90,
        name: "chat_${DateTime.now().millisecondsSinceEpoch}",
      );

      if (result['isSuccess'] == true) {
        _showMessage("Image saved to Gallery ✅");
      } else {
        _showMessage("Image save failed");
      }
    } catch (e) {
      _showMessage("Image download failed: $e");
    }
  }

  // ===========================
  // ✅ Full screen preview (no download inside)
  // ===========================
  void _openImages(List<String> images, int initialIndex) {
    Get.to(() => ImagePreviewScreen(
      imageUrls: images,
      initialIndex: initialIndex,
      isGroup: widget.isGroup,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.chat.isSender
        ? AppColors.chatPrimaryBlueColor
        : (!widget.isGroup
        ? const Color(0xffE8ECEF)
        : AppColors.chatRedColor.withValues(alpha: 0.15));

    final txtColor = CommonMethods.getTextColorForBackground(bgColor);

    final imageUrls = widget.chat.attachments.where(_isImage).toList();
    final pdfUrls = widget.chat.attachments.where(_isPdf).toList();

    // Attachments still uploading locally (no URL yet) — shown immediately
    // so a just-sent image/PDF isn't invisible until the next chat poll.
    final localImages = <Uint8List>[];
    final localPdfNames = <String>[];
    for (var i = 0; i < widget.chat.localAttachmentNames.length; i++) {
      final name = widget.chat.localAttachmentNames[i];
      if (_isImageName(name)) {
        localImages.add(widget.chat.localAttachmentBytes[i]);
      } else if (_isPdfName(name)) {
        localPdfNames.add(name);
      }
    }

    return Container(
      alignment: widget.chat.isSender ? Alignment.centerRight : Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment:
        widget.chat.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ avatar only for group received
              if (!widget.chat.isSender && widget.isGroup) ...[
                Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  clipBehavior: Clip.hardEdge,
                  child: (widget.chat.senderAvatarUrl != null &&
                      widget.chat.senderAvatarUrl!.trim().isNotEmpty)
                      ? Image.network(
                    widget.chat.senderAvatarUrl!,
                    fit: BoxFit.cover,
                    // The message list rebuilds every 3s (chat polling);
                    // without this the avatar drops to a blank frame each
                    // time this item's Element is reused, reading as a blink.
                    gaplessPlayback: true,
                    errorBuilder: (_, __, ___) =>
                        Image.asset(AppAsset.profilePicImg, fit: BoxFit.cover),
                  )
                      : Image.asset(AppAsset.profilePicImg, fit: BoxFit.cover),
                ),
                customWidth(12.w),
              ],

              Flexible(
                child: Column(
                  crossAxisAlignment:
                  widget.chat.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    // ✅ sender name for group received
                    if (!widget.chat.isSender &&
                        widget.isGroup &&
                        (widget.chat.senderName ?? '').trim().isNotEmpty) ...[
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Text(
                          widget.chat.senderName!,
                          style: AppTextStyle.normal10style.copyWith(
                            fontSize: 8.sp,
                            color: AppColors.defaultTxtGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],

                    // ===========================
                    // ✅ Bubble
                    // ===========================
                    Container(
                      constraints: BoxConstraints(maxWidth: 262.w),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: widget.chat.isSender ? Radius.circular(6.r) : Radius.zero,
                          topRight:
                          widget.chat.isSender ? Radius.zero : Radius.circular(6.r),
                          bottomLeft: Radius.circular(6.r),
                          bottomRight: Radius.circular(6.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: widget.chat.isSender
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          // ✅ IMAGES (WhatsApp style preview)
                          if (imageUrls.isNotEmpty || localImages.isNotEmpty)
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: widget.chat.isSender
                                    ? Radius.circular(6.r)
                                    : Radius.zero,
                                topRight: widget.chat.isSender
                                    ? Radius.zero
                                    : Radius.circular(6.r),
                              ),
                              child: Column(
                                children: [
                                  // still-uploading local previews (no tap — nothing to open yet)
                                  ...List.generate(localImages.length, (i) {
                                    return Container(
                                      width: double.infinity,
                                      height: 180.h,
                                      color: Colors.white,
                                      child: Image.memory(
                                        localImages[i],
                                        fit: BoxFit.cover,
                                        gaplessPlayback: true,
                                      ),
                                    );
                                  }),
                                  ...List.generate(imageUrls.length, (i) {
                                    final url = imageUrls[i];
                                    return InkWell(
                                      onTap: () => _openImages(imageUrls, i),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 180.h,
                                            color: Colors.white,
                                            child: Image.network(
                                              url,
                                              fit: BoxFit.cover,
                                              gaplessPlayback: true,
                                              errorBuilder: (_, __, ___) => const Center(
                                                child: Icon(Icons.broken_image, size: 40),
                                              ),
                                            ),
                                          ),
                                          // Positioned(
                                          //   right: 8,
                                          //   top: 8,
                                          //   child: Container(
                                          //     padding: const EdgeInsets.all(6),
                                          //     decoration: BoxDecoration(
                                          //       color: Colors.black.withValues(alpha: 0.4),
                                          //       shape: BoxShape.circle,
                                          //     ),
                                          //     child: const Icon(
                                          //       Icons.download,
                                          //       color: Colors.white,
                                          //       size: 18,
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),

                          // ✅ PDF (ONLY icon + filename row)
                          if (pdfUrls.isNotEmpty || localPdfNames.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                              child: Column(
                                crossAxisAlignment: widget.chat.isSender
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  // still-uploading local PDFs — nothing to open yet
                                  ...localPdfNames.map((name) => _pdfRow(name, null)),
                                  ...pdfUrls.map(
                                    (url) => _pdfRow(_fileName(url), () => _downloadAndOpenPdf(url)),
                                  ),
                                ],
                              ),
                            ),

                          // ✅ TEXT (normal)
                          if (widget.chat.msg.trim().isNotEmpty)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Flexible(
                                    child: Text(
                                      widget.chat.msg,
                                      style: AppTextStyle.normal10style.copyWith(
                                        color: txtColor,
                                      ),
                                    ),
                                  ),
                                  if (widget.chat.isSender)
                                    Padding(
                                      padding: EdgeInsets.only(left: 6.w),
                                      child: SvgPicture.asset(
                                        AppAsset.readDoubleTickSvgIcon,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),

                    // ✅ time below bubble
                    Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: Text(
                        _formatTime(widget.chat.time),
                        style: AppTextStyle.normal10style.copyWith(
                          fontSize: 8.sp,
                          color: AppColors.defaultTxtGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ===========================
// Fullscreen image preview + zoom (tap only)
// ===========================
class ImagePreviewScreen extends StatefulWidget {
  const ImagePreviewScreen({
    super.key,
    required this.imageUrls,
    this.initialIndex = 0,
    required this.isGroup,
  });

  final List<String> imageUrls;
  final int initialIndex;
  final bool isGroup;

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  final ChatDataController controller = Get.find<ChatDataController>();
  late final PageController _page;
  int _currentIndex = 0;
  bool _isDownloading = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _page = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _page.dispose();
    super.dispose();
  }

  Future<bool> _requestGalleryPermission() async {
    if (!Platform.isAndroid && !Platform.isIOS) return true;

    // iOS
    if (Platform.isIOS) {
      final status = await Permission.photos.request();
      return status.isGranted || status.isLimited;
    }

    // Android
    // Android 13+ uses photos/media permissions, older uses storage
    final photos = await Permission.photos.request(); // Android 13+ works as well
    if (photos.isGranted || photos.isLimited) return true;

    final storage = await Permission.storage.request();
    return storage.isGranted;
  }

  // See _ChatElementWidgetState._showMessage: avoids GetX's Get.snackbar
  // overlay-resolution bug (throws right after navigation, and can leave a
  // broken SnackbarController that later crashes Get.back()).
  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _downloadCurrentImage() async {
    if (_isDownloading) return;
    setState(() => _isDownloading = true);

    try {
      final ok = await _requestGalleryPermission();
      if (!ok) {
        _showMessage("Gallery permission is required to save image.");
        return;
      }

      final url = widget.imageUrls[_currentIndex];

      _showMessage("Saving image to gallery...");

      final fileData = await controller.getEmployeeDocumentByFileName(
        fileUrl: url,
        apiPath: ChatRepository.getChatImagesBasePath(isGroup: widget.isGroup),
      );

      if (fileData == null) {
        _showMessage("Image save failed");
        return;
      }

      final result = await ImageGallerySaverPlus.saveImage(
        Uint8List.fromList(fileData.bytes),
        quality: 90,
        name: "chat_${DateTime.now().millisecondsSinceEpoch}",
      );

      final success = result['isSuccess'] == true;
      if (success) {
        _showMessage("Image saved to Gallery ✅");
      } else {
        _showMessage("Image save failed");
      }
    } catch (e) {
      _showMessage("Download failed: $e");
    } finally {
      setState(() => _isDownloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Preview (${_currentIndex + 1}/${widget.imageUrls.length})",
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: _isDownloading ? null : _downloadCurrentImage,
            icon: _isDownloading
                ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            )
                : const Icon(Icons.download, color: Colors.white),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _page,
        itemCount: widget.imageUrls.length,
        onPageChanged: (i) => setState(() => _currentIndex = i),
        itemBuilder: (context, index) {
          final url = widget.imageUrls[index];
          return Center(
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 5,
              child: Image.network(
                url,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.broken_image,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
