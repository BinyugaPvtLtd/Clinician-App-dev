import 'dart:io';
import 'dart:typed_data';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/pages/home/chat_screen.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';

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
  String _formatTime(DateTime dt) => DateFormat('h:mm a').format(dt.toLocal());

  bool _isImage(String url) {
    final lower = url.toLowerCase();
    return lower.endsWith('.jpg') || lower.endsWith('.jpeg') || lower.endsWith('.png');
  }

  bool _isPdf(String url) => url.toLowerCase().endsWith('.pdf');

  String _fileName(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.pathSegments.isNotEmpty ? uri.pathSegments.last : 'file';
    } catch (_) {
      return 'file';
    }
  }

  // ===========================
  // ✅ DOWNLOAD + OPEN PDF
  // ===========================
  Future<void> _downloadAndOpenPdf(String url) async {
    try {
      Get.snackbar("Downloading", "PDF downloading...",backgroundColor: Colors.white);

      final dir = await getTemporaryDirectory();
      final fileName = _fileName(url);
      final savePath = "${dir.path}/$fileName";

      await Dio().download(url, savePath);

      // ✅ open after download
      await OpenFile.open(savePath);
    } catch (e) {
      Get.snackbar("Failed", "PDF open failed: $e");
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
        final p1 = await Permission.photos.request(); // iOS
        final p2 = await Permission.storage.request(); // older android
        final p3 = await Permission.photos.request(); // android 13+ fallback
        // we won't strictly block; but check some permission granted
      }

      Get.snackbar("Downloading", "Saving image to gallery...");

      final resp = await Dio().get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      final bytes = Uint8List.fromList(resp.data ?? []);
      final result = await ImageGallerySaverPlus.saveImage(
        bytes,
        quality: 90,
        name: "chat_${DateTime.now().millisecondsSinceEpoch}",
      );

      if (result['isSuccess'] == true) {
        Get.snackbar("Saved", "Image saved to Gallery ✅");
      } else {
        Get.snackbar("Failed", "Image save failed");
      }
    } catch (e) {
      Get.snackbar("Failed", "Image download failed: $e");
    }
  }

  // ===========================
  // ✅ Full screen preview (no download inside)
  // ===========================
  void _openImages(List<String> images, int initialIndex) {
    Get.to(() => ImagePreviewScreen(imageUrls: images, initialIndex: initialIndex));
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
                          if (imageUrls.isNotEmpty)
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
                                children: List.generate(imageUrls.length, (i) {
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
                              ),
                            ),

                          // ✅ PDF (ONLY icon + filename row)
                          if (pdfUrls.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                              child: Column(
                                crossAxisAlignment: widget.chat.isSender
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: pdfUrls.map((url) {
                                  return InkWell(
                                    onTap: () => _downloadAndOpenPdf(url),
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 6.h),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.picture_as_pdf,
                                            size: 26,
                                            color: widget.chat.isSender
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                          SizedBox(width: 8.w),
                                          Flexible(
                                            child: Text(
                                              _fileName(url),
                                              style: AppTextStyle.normal10style.copyWith(
                                                color: widget.chat.isSender
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
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
  });

  final List<String> imageUrls;
  final int initialIndex;

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
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

  Future<void> _downloadCurrentImage() async {
    if (_isDownloading) return;
    setState(() => _isDownloading = true);

    try {
      final ok = await _requestGalleryPermission();
      if (!ok) {
        // Get.snackbar("Permission denied", "Gallery permission is required to save image.");
        return;
      }

      final url = widget.imageUrls[_currentIndex];

      Get.snackbar("Downloading", "Saving image to gallery...",backgroundColor: Colors.white);

      final resp = await Dio().get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      final bytes = Uint8List.fromList(resp.data ?? []);

      final result = await ImageGallerySaverPlus.saveImage(
        bytes,
        quality: 90,
        name: "chat_${DateTime.now().millisecondsSinceEpoch}",
      );

      final success = result['isSuccess'] == true;
      if (success) {
        Get.snackbar("Saved", "Image saved to Gallery ✅",backgroundColor: Colors.white);
      } else {
        Get.snackbar("Failed", "Image save failed");
      }
    } catch (e) {
      Get.snackbar("Failed", "Download failed: $e");
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
