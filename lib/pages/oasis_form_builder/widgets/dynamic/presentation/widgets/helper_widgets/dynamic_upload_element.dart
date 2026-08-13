import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

import 'package:clinician_app/pages/oasis_form_builder/ui_components/buttons/primary_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/model/option_data_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/signature_upload_popup.dart';

import '../../../../../provider/question_wapper_provider.dart';
import '../../../../../ui_components/overlays/local_notification_manager.dart';
import '../../../../static/presentation/widgets/image_preview_dialog_ui.dart';

class DynamicUploadElement extends StatelessWidget {
  const DynamicUploadElement(
      {super.key, required this.option, required this.questionWrapper});

  final OptionDataModel option;
  final QuestionWrapper questionWrapper;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _getUploadButton(context, questionWrapper, option),
        customWidth(20.w),
        Flexible(child: _getFileStatusButton(context, questionWrapper, option)),
      ],
    );
  }

  Widget _getFileStatusButton(BuildContext context,
      QuestionWrapper questionWrapper, OptionDataModel option) {
    return InkWell(
      onTap: () {
        if (option.image == null && option.value.isEmpty) {
          print('No Image Found!');
          return;
        }
        showDialog(
          context: context,
          builder: (context) {
            return ImagePreviewDialogUi(
              image: option.image,
              imageUrl: option.value,
              isButtonShow: false,
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        constraints: BoxConstraints(maxWidth: 250.w, maxHeight: 100.h),
        // alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.grey)),
        child: Row(
          spacing: 20,
          children: [
            Expanded(
              child: Text(
                option.value.isEmpty ? 'No file Chosen' : option.value,
                style: FormBuilderTextStyle.normal10style
                    .copyWith(color: AppColors.grey),
              ),
            ),
            if (option.value.isNotEmpty)
              GestureDetector(
                onTap: () {
                  questionWrapper.updateUploadImageValue(
                      option.index, null, "");
                },
                child: Icon(Icons.close),
              ),
          ],
        ),
      ),
    );
  }

  Widget _getUploadButton(BuildContext context, QuestionWrapper questionWrapper,
      OptionDataModel option) {
    return PrimaryButton(
        width: 137.w,
        icon: SvgPicture.asset(
          AppAsset.uploadSvgIcon,
        ),
        onTap: () async {
          showDialog(
            context: context,
            builder: (context) => SignatureUploadPopup(
              onTakePhotoTap: () => onTakePhotoButtonAction(
                  context: context,
                  index: option.index,
                  questionWrapper: questionWrapper),
              onUploadFileTap: () => onFileUploadTapButtonAction(
                  context: context,
                  index: option.index,
                  questionWrapper: questionWrapper),
              onsignSaveAction: (image) => onSignUploadTapButtonAction(
                  context: context,
                  index: option.index,
                  image: image,
                  questionWrapper: questionWrapper),
            ),
          );
          // }
        },
        label: option.label);
  }

  Future<void> onSignUploadTapButtonAction(
      {required BuildContext context,
      required QuestionWrapper questionWrapper,
      required int index,
      required Uint8List image}) async {
    try {
      if (image.isNotEmpty) {
        questionWrapper.updateUploadImageValue(index, XFile.fromData(image),
            "signature${DateTime.now().millisecondsSinceEpoch}.png");

        // Close both dialogs
        Navigator.pop(context); // close preview
        Navigator.pop(context);
      }
    } catch (e) {}
  }

  Future<void> onFileUploadTapButtonAction(
      {required BuildContext context,
      required int index,
      required QuestionWrapper questionWrapper}) async {
    try {
      var file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
        withData: true,
      );

      if ((file?.files ?? []).isNotEmpty) {
        final path = file?.files[0].path ?? "";
        final imageBytes = file?.files[0].bytes;

        if (path.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context) {
              return ImagePreviewDialogUi(
                image: XFile(path),
                imageUrl: path,
                onCancelOnTapAction: () {
                  Navigator.pop(context);
                },
                onSaveTapAction: () {
                  questionWrapper.updateUploadImageValue(
                      index, XFile.fromData(imageBytes!), path);
                  // Close both dialogs
                  Navigator.pop(context); // close preview
                  Navigator.pop(context); // close SignatureUploadPopup
                },
              );
            },
          );
        }
      }
    } catch (e) {}
  }

  Future<void> onTakePhotoButtonAction(
      {required BuildContext context,
      required int index,
      required QuestionWrapper questionWrapper}) async {
    try {
      bool isCameraSupport =
          ImagePicker().supportsImageSource(ImageSource.camera);
      if (!isCameraSupport) {
        LocalNotificationManager.showErrorNotification(context, 'Error!',
            subtitle: 'Camera is not supported on this device');
      } else {
        var file = await ImagePicker()
            .pickImage(source: ImageSource.camera, requestFullMetadata: true);
        if (file == null) {
          return;
        }
        final path = file.path ?? "";
        final imageBytes = await file.readAsBytes();

        if (path.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context) {
              return ImagePreviewDialogUi(
                image: XFile(path),
                imageUrl: path,
                onCancelOnTapAction: () {
                  Navigator.pop(context);
                },
                onSaveTapAction: () {
                  questionWrapper.updateUploadImageValue(
                      index, XFile.fromData(imageBytes!), path);
                  // Close both dialogs
                  Navigator.pop(context); // close preview
                  Navigator.pop(context); // close SignatureUploadPopup
                },
              );
            },
          );
        }
      }
    } catch (e) {
      LocalNotificationManager.showErrorNotification(context, 'Error!',
          subtitle: 'Camera is not supported on this device');
    }
  }
}
