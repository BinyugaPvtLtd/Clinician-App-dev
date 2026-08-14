import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../constants/responsive.dart';
import '../../../../constants/static_decoration.dart';
import '../../../../ui_components/buttons/primary_button.dart';
import '../../../../ui_components/buttons/primary_outlined_button.dart';

class ImagePreviewDialogUi extends StatefulWidget {
  final void Function()? onCancelOnTapAction;
  final void Function()? onSaveTapAction;
  final XFile? image;
  final bool? isButtonShow;

  final String? imageUrl;

  const ImagePreviewDialogUi({
    super.key,
    this.onCancelOnTapAction,
    this.onSaveTapAction,
    this.isButtonShow = true,
    this.image,
    this.imageUrl,
  });

  @override
  State<ImagePreviewDialogUi> createState() => _ImagePreviewDialogUiState();
}

class _ImagePreviewDialogUiState extends State<ImagePreviewDialogUi> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      if (widget.image != null) {
        imageBytes = await widget.image!.readAsBytes();
      }
      setState(() {
        isLoaded = true;
      });
    });
    super.initState();
  }

  bool isLoaded = false;
  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: Responsive.isMobile(context)
              ? EdgeInsets.symmetric(horizontal: 30)
              : null,
          constraints: BoxConstraints(
              // maxHeight: 807.h,
              maxWidth: 550),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration:
                    const BoxDecoration(color: AppColors.primaryAppLightColor),
                child: Row(
                  children: [
                    Text(
                      'Image Preview',
                      style: FormBuilderTextStyle.normal12style.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              customHeight(20),
              Flexible(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: SizedBox(
                        // width: 400.w,
                        child: widget.image != null
                            ? isLoaded
                                ? Image.memory(imageBytes!, fit: BoxFit.contain)
                                : const Center(
                                    child: CircularProgressIndicator(),
                                  ) // Web & mobile
                            : (widget.imageUrl != null &&
                                    widget.imageUrl!.trim().isNotEmpty)
                                ? CachedNetworkImage(
                                    imageUrl: widget.imageUrl!,
                                  )
                                : const Text('No image available'),
                      ),
                    ),
                    customHeight(36),
                    (widget.isButtonShow ?? false)
                        ? Row(
                            spacing: 20,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryOutlinedButton(
                                  text: 'Cancel',
                                  radius: 10,
                                  width:
                                     100,
                                  height: 40,
                                  textStyle: FormBuilderTextStyle.normal10style
                                      .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  onPressed: widget.onCancelOnTapAction),
                              PrimaryButton(
                                onTap: widget.onSaveTapAction,
                                label: 'Save',
                                borderRadius: 10,
                                height: 40,
                                width: Responsive.isMobile(context) ? 100 : 160,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 11),
                                labelStyle: FormBuilderTextStyle.normal10style
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
