
import 'dart:typed_data';
import 'dart:ui';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_asset.dart';
import '../../../../constants/app_colors.dart';
import '../../../../provider/sub_question_wrapper_provider.dart';
import '../../../../ui_components/buttons/primary_button.dart';
import '../../../../ui_components/overlays/local_notification_manager.dart';
import '../../../../widgets/popup/signature_upload_popup.dart';
import '../../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../../../widgets/static/data/static_question_model.dart';
import '../../../../widgets/static/presentation/widgets/image_preview_dialog_ui.dart';
import '../../../../widgets/static/presentation/widgets/static_datefield_widget.dart';
import '../../../../widgets/static/presentation/widgets/static_textfield_widget.dart';
import '../../../generate_options.dart';

class Question741137004 extends StatefulWidget {
  final QuestionWrapper questionWrapper;

  const Question741137004({super.key, required this.questionWrapper});

  @override
  State<Question741137004> createState() => _Question741137004State();
}

class _Question741137004State extends State<Question741137004> {
  TextEditingController numberController = TextEditingController();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, QuestionWrapper questionWrapper,
            Widget? child) {
          return ScrollConfiguration(
            behavior: WebDragScrollBehavior(),
            child: Scrollbar(
              thumbVisibility: true,
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _getTitleRow(questionWrapper),
                    Divider(
                      height: 40.h,
                    ),
                    ...questionWrapper.subQuestionWrappers.map(
                          (subQuestionWrapper) =>
                          _getDataRow(subQuestionWrapper, questionWrapper),
                    ),
                    Row(
                      spacing: 10.w,
                      children: [
                        Text(
                          'Add',
                          style: FormBuilderTextStyle.normal10style
                              .copyWith(color: Colors.red.shade700),
                        ),
                        SizedBox(
                          width: 90.w,
                          child: _getRawTextField(numberController),
                        ),
                        Text(
                          'Medication(s)',
                          style: FormBuilderTextStyle.normal10style
                              .copyWith(color: Colors.red.shade700),
                        ),
                        SizedBox(
                          width: 70.w,
                          child: PrimaryButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.w),
                            borderRadius: 12.r,
                            label: 'Add',
                            onTap: () {
                              int rowsToAdd =
                                  int.tryParse(numberController.text.trim()) ??
                                      1;
                              numberController.clear();
                              for (int i = 0; i < rowsToAdd; i++) {
                                questionWrapper.subQuestionWrappers.add(
                                  SubQuestionWrapper(
                                    subQuestion: StaticQuestionModel.fromJson(
                                      {
                                        "question_id": questionWrapper
                                            .subQuestionWrappers.length,
                                        "type": "MIX",
                                        "options": generateOptions([
                                          "",
                                          "",
                                          "",
                                          "",
                                          "",
                                          "",
                                          "",
                                          "",
                                          "",
                                          "",
                                          ""
                                        ])
                                      },
                                    ),
                                  ),
                                );
                              }
                              questionWrapper.forceNotify();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getDataRow(SubQuestionWrapper subQuestionWrapper,
      QuestionWrapper questionWrapper) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, SubQuestionWrapper subQuestionWrapper,
            Widget? child) {
          return Column(
            children: [
              Row(
                spacing: 10.w,
                children: [
                  _wrapInExpanded(_getDateField(subQuestionWrapper, 0),
                      flex: 3),
                  _wrapInExpanded(
                    _getRawDropdown(subQuestionWrapper, 1),
                  ),
                  _wrapInExpanded(
                    _getTextField(subQuestionWrapper, 2),
                  ),
                  _getCheckBox(subQuestionWrapper, 3),
                  _wrapInExpanded(
                    _getTextField(subQuestionWrapper, 4),
                  ),
                  _wrapInExpanded(
                    _getTextField(subQuestionWrapper, 5),
                  ),
                  _wrapInExpanded(
                    _getTextField(subQuestionWrapper, 6),
                  ),
                  _wrapInExpanded(
                    _getTextField(subQuestionWrapper, 7),
                  ),
                  _wrapInExpanded(
                      _getDateField(
                        subQuestionWrapper,
                        8,
                      ),
                      flex: 3),
                  _wrapInExpanded(_getDateField(subQuestionWrapper, 9),
                      flex: 3),
                  _wrapInExpanded(
                    _getUploadButton(subQuestionWrapper, 10),
                  ),
                  _wrapInExpanded(
                    _getClearButton(
                        questionWrapper,
                        questionWrapper.subQuestionWrappers
                            .indexOf(subQuestionWrapper)),
                  ),
                ],
              ),
              Divider(
                height: 40.h,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getTitleRow(QuestionWrapper questionWrapper) {
    return Row(
      spacing: 10.w,
      children: [
        _getText("Start Date", flex: 3),
        _getText("Code"),
        _wrapInExpanded(
          Column(
            children: [
              RichText(
                text: TextSpan(
                  text: 'Medications\n[ ',
                  style: FormBuilderTextStyle.bold10Style,
                  children: [
                    TextSpan(
                      text: "Info",
                      style: FormBuilderTextStyle.bold10Style
                          .copyWith(color: Colors.red.shade800),
                    ),
                    TextSpan(
                      text: " | ",
                    ),
                    TextSpan(
                      text: "Interactions",
                      style: FormBuilderTextStyle.bold10Style
                          .copyWith(color: Colors.red.shade800),
                    ),
                    TextSpan(
                      text: " ]",
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Checkbox(
          value: questionWrapper.subQuestionWrappers
              .where((subWrapper) => subWrapper.subQuestion.options[3].selected)
              .isNotEmpty,
          activeColor: AppColors.checkBoxBlueColor,
          focusColor: AppColors.checkBoxBlueColor,
          side: BorderSide(color: AppColors.checkBoxBlueColor, width: 1.5.w),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          onChanged: (value) {
            for (final subQuestionWrapper
            in questionWrapper.subQuestionWrappers) {
              subQuestionWrapper.subQuestion.options[3].selected =
                  value ?? false;
              subQuestionWrapper.forceNotify();
              questionWrapper.forceNotify();
            }
          },
        ),
        _getText("Route"),
        _getText("Dose"),
        _getText("Frequency"),
        _getText("Indication"),
        _getText("Date Teaching Performed", flex: 3),
        _getText("D/C Date", flex: 3),
        _getText("Clinical Signature/Date"),
        _getText("Clear Row"),
      ],
    );
  }

  Widget _wrapInExpanded(Widget child, {int flex = 2}) {
    return SizedBox(
      width: 200,
      // flex: flex,
      child: child,
    );
  }

  Widget _getText(String text, {int flex = 2}) {
    return SizedBox(
      width: 200,
      // flex: flex,
      child: Text(
        text,
        style: FormBuilderTextStyle.bold10Style,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _getTextField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    return ChangeNotifierProvider.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder:
            (BuildContext context, SubQuestionWrapper value, Widget? child) {
          final option = subQuestionWrapper.subQuestion.options[optionIndex];
          return StaticTextFieldElement(
            option: option,
            subQuestion: subQuestionWrapper.subQuestion,
            onUpdate: (optionIndex, value) {
              subQuestionWrapper.updateTextFieldValue(optionIndex, value);
            },
          );
        },
      ),
    );
  }

  Widget _getDateField(SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    return StaticDateFieldElement(
      onDateChange: (DateTime newDateTime) {
        subQuestionWrapper.updateTextFieldValue(
            optionIndex, newDateTime.toIso8601String());
      },
      initialDate: DateTime.tryParse(
          subQuestionWrapper.subQuestion.options[optionIndex].value),
    );
  }

  Widget _getRawTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide:
            BorderSide(color: AppColors.textFieldBorderColor, width: 1.w)),
        // floatingLabelStyle: floatingLabelStyle,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide:
            BorderSide(color: AppColors.textFieldBorderColor, width: 1.w)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide:
            BorderSide(color: AppColors.textFieldBorderColor, width: 1.w)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(
              color: AppColors.redColor,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(
                color: AppColors.textFieldBorderColor, width: 0)),
        fillColor: Colors.white,
        filled: true,
        hintStyle: FormBuilderTextStyle.normal10style.copyWith(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.hintGreyColor),
        hintText: "Enter Text",
        enabled: true,
      ),
      style: FormBuilderTextStyle.normal10style,
    );
  }

  Widget _getRawDropdown(SubQuestionWrapper subquestionWrapper, int index) {
    final items = ["Option 1", "Option 2"];
    final selectedValue = subquestionWrapper.subQuestion.options[index].value;
    return CustomDropdown<String>(
      items: items,
      onChanged: (newItem) {
        if (newItem == null) {
          return;
        }
        subquestionWrapper.updateTextFieldValue(index, newItem);
      },
      initialItem: items.firstWhereOrNull((item) => item == selectedValue),
      hintText: '(Select)',
      listItemBuilder: (context, option, _, __) {
        return Text(
          option,
          style: FormBuilderTextStyle.normal10style,
        );
      },
      headerBuilder: (context, option, ___) {
        return Text(
          option,
          style: FormBuilderTextStyle.normal10style
              .copyWith(fontWeight: FontWeight.bold),
        );
      },
      decoration: CustomDropdownDecoration(
          closedBorder: Border.all(color: AppColors.textFieldBorderColor),
          closedBorderRadius: BorderRadius.circular(5),
          hintStyle: FormBuilderTextStyle.normal10style),
      closedHeaderPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, optionIndex) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: true,
    );
  }

  Widget _getUploadButton(SubQuestionWrapper subQuestionWrapper, int index) {
    return Center(
      child: PrimaryButton(
        padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
        width: 137.w,
        icon: SvgPicture.asset(
          AppAsset.uploadSvgIcon,
        ),
        onTap: () async {
          showDialog(
            context: context,
            builder: (context) =>
                SignatureUploadPopup(
                  onTakePhotoTap: () =>
                      onTakePhotoButtonAction(
                          context: context,
                          index: index,
                          subQuestionWrapper: subQuestionWrapper),
                  onUploadFileTap: () =>
                      onFileUploadTapButtonAction(
                          context: context,
                          index: index,
                          subQuestionWrapper: subQuestionWrapper),
                  onsignSaveAction: (image) =>
                      onSignUploadTapButtonAction(
                          subQuestionWrapper: subQuestionWrapper,
                          context: context,
                          index: index,
                          image: image),
                ),
          );
        },
        label: "Sign",
      ),
    );
  }

  Widget _getClearButton(QuestionWrapper questionWrapper, int index) {
    return Center(
      child: PrimaryButton(
        buttonColor: Colors.white,
        labelStyle: FormBuilderTextStyle.bold10Style
            .copyWith(color: AppColors.primaryAppLightColor),
        padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
        onTap: () async {},
        label: "Clear",
      ),
    );
  }

  Future<void> onSignUploadTapButtonAction({required BuildContext context,
    required SubQuestionWrapper subQuestionWrapper,
    required int index,
    required Uint8List image}) async {
    try {
      if (image.isNotEmpty) {
        subQuestionWrapper.updateUploadImageValue(index, XFile.fromData(image),
            "signature${DateTime
                .now()
                .millisecondsSinceEpoch}.png");

        // Close both dialogs
        Navigator.pop(context); // close preview
        Navigator.pop(context);
      }
    } catch (e) {}
  }

  Future<void> onFileUploadTapButtonAction({required BuildContext context,
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

  Future<void> onTakePhotoButtonAction({required BuildContext context,
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
class WebDragScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch, // for mobile
        PointerDeviceKind.mouse, // 👈 allow mouse dragging on web
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
