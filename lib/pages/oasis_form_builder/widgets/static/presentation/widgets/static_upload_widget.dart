// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/signature_upload_popup.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/static_question_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/image_preview_dialog_ui.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/buttons/primary_button.dart';
import 'package:provider/provider.dart';

import '../../../../ui_components/overlays/local_notification_manager.dart';
import '../../../popup/popup_handler.dart';
import '../../data/static_option_model.dart';

class StaticUploadWidget extends StatelessWidget {
  const StaticUploadWidget({
    super.key,
    required this.subQuestionWrapper,
  });

  final SubQuestionWrapper subQuestionWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
          builder: (BuildContext context, subQuestionWrapper, Widget? child) {
        final subQuestion = subQuestionWrapper.subQuestion;
        return subQuestion.scrollAxisAlignment == OptionsAlignment.horizontal
            ? Row(
                children: [
                  Expanded(
                    child: getTitleWidget(context, subQuestion),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        if (subQuestion.optionsAlignment ==
                            OptionsAlignment.horizontal)
                          Wrap(
                            spacing: 20,
                            children: [
                              ...getWidget(context, subQuestionWrapper),
                            ],
                          )
                        else
                          ...getWidget(context, subQuestionWrapper),
                      ],
                    ),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTitleWidget(context, subQuestion),
                  if (subQuestion.optionsAlignment ==
                      OptionsAlignment.horizontal)
                    Wrap(
                      spacing: 20,
                      children: [
                        ...getWidget(context, subQuestionWrapper),
                      ],
                    )
                  else
                    ...getWidget(context, subQuestionWrapper),
                ],
              );
      }),
    );

    // return subQuestion.optionsAlignment == OptionsAlignment.horizontal
    //     ? Wrap(
    //         runSpacing: 14.w,
    //         spacing: 10.h,
    //         children: subQuestion.options
    //             .map(
    //               (e) => getWidget(context, static: e),
    //             )
    //             .toList(),
    //       )
    //     : Column(
    //         children: subQuestion.options
    //             .map(
    //               (e) => getWidget(context, static: e),
    //             )
    //             .toList(),
    //       );
  }

  Widget getTitleWidget(BuildContext context, StaticQuestionModel subQuestion) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (subQuestion.code != null && subQuestion.code!.isNotEmpty)
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      PopupHandler.showQuestionCodePopup(
                          context, subQuestion.code!);
                    },
                    child: Text(
                      "(${subQuestion.code})",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xffFF0000),
                          fontWeight: FontWeight.bold),
                    )),
              )
            : const SizedBox(
                width: 1,
              ),
        Expanded(
          child: Html(
            data: subQuestion.title,
            style: FormBuilderTextStyle.htmlTextStyle(false),
          ),
        ),
      ],
    );
  }

  List<Widget> getWidget(
      BuildContext context, SubQuestionWrapper subQuestionWrapper) {
    final subQuestion = subQuestionWrapper.subQuestion;
    return subQuestion.options
        .map(
          (option) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _getUploadButton(context, subQuestionWrapper, option),
              customWidth(20.w),
              Flexible(
                  child: _getFileStatusButton(
                      context, subQuestionWrapper, option)),
            ],
          ),
        )
        .toList();
  }

  Widget _getFileStatusButton(BuildContext context,
      SubQuestionWrapper subQuestionWrapper, StaticOptionModel option) {
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
        constraints: BoxConstraints(maxWidth: 200.w, maxHeight: 100.h),
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
                    subQuestionWrapper.updateUploadImageValue(
                        option.index, null, "");
                  },
                  child: Icon(Icons.close))
          ],
        ),
      ),
    );
  }

  Widget _getUploadButton(BuildContext context,
      SubQuestionWrapper subQuestionWrapper, StaticOptionModel option) {
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
                  subQuestionWrapper: subQuestionWrapper),
              onUploadFileTap: () => onFileUploadTapButtonAction(
                  context: context,
                  index: option.index,
                  subQuestionWrapper: subQuestionWrapper),
              onsignSaveAction: (image) => onSignUploadTapButtonAction(
                  subQuestionWrapper: subQuestionWrapper,
                  context: context,
                  index: option.index,
                  image: image),
            ),
          );
          // }
        },
        label: option.label);
  }

  Future<void> onSignUploadTapButtonAction(
      {required BuildContext context,
      required SubQuestionWrapper subQuestionWrapper,
      required int index,
      required Uint8List image}) async {
    try {
      if (image.isNotEmpty) {
        subQuestionWrapper.updateUploadImageValue(index, XFile.fromData(image),
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
      required SubQuestionWrapper subQuestionWrapper}) async {
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
                  subQuestionWrapper.updateUploadImageValue(
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
      required SubQuestionWrapper subQuestionWrapper}) async {
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
                  subQuestionWrapper.updateUploadImageValue(
                      index, XFile.fromData(imageBytes), path);
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
