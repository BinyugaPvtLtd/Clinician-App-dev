import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/enums.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/form_builder_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:provider/provider.dart';

import '../../../widgets/static/data/static_option_model.dart';
import '../../../widgets/static/presentation/widgets/image_preview_dialog_ui.dart';

class AddWoundImageWidget extends StatelessWidget {
  final SubQuestionWrapper subQuestionWrapper;

  const AddWoundImageWidget({super.key, required this.subQuestionWrapper});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final subQuestion = subQuestionWrapper.subQuestion;
          return Row(
            children: [
              Expanded(
                flex: 4,
                child: TitleDescription(
                  title: subQuestion.title,
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 10.w,
                        runSpacing: 10.h,
                        children: [
                          ...subQuestion.options
                              .where((option) {
                                final hasRenderableImage =
                                    (option.image != null &&
                                        option.image!.path.isNotEmpty) ||
                                        option.value.trim().isNotEmpty;
                                return hasRenderableImage;
                              })
                              .map((option) {
                            return _buildOptionChip(
                                context, option, subQuestionWrapper);
                          }),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await _pickFiles(subQuestionWrapper);
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        color: AppColors.primaryAppLightColor,
                      ),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOptionChip(BuildContext context, StaticOptionModel option,
      SubQuestionWrapper subQuestionWrapper) {
    final hasLocalImage = option.image != null && option.image!.path.isNotEmpty;
    final imageUrl = option.value.trim();
    final hasRemoteImage = imageUrl.isNotEmpty;

    return InkWell(
      onTap: () {
        if (!hasLocalImage && !hasRemoteImage) {
          print('No Image Found!');
          return;
        }
        showDialog(
          context: context,
          builder: (context) {
            return ImagePreviewDialogUi(
              image: hasLocalImage ? option.image : null,
              imageUrl: hasRemoteImage ? imageUrl : null,
              isButtonShow: false,
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppColors.primaryAppLightColor),
        ),
        padding: EdgeInsets.only(left: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              option.label,
              style: FormBuilderTextStyle.normal10style
                  .copyWith(color: AppColors.primaryAppLightColor),
            ),
            SizedBox(
              height: 35,
              child: IconButton(
                onPressed: () {
                  final optionIndex =
                      subQuestionWrapper.subQuestion.options.indexOf(option);
                  if (optionIndex == -1) {
                    return;
                  }
                  final formProvider = Provider.of<FormBuilderProvider>(
                    context,
                    listen: false,
                  );
                  formProvider.enqueueDeletedImageUrl(option.value);
                  subQuestionWrapper.markImageAsDeleted(optionIndex);
                },
                icon: Icon(Icons.close),
                color: AppColors.primaryAppLightColor,
                iconSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickFiles(SubQuestionWrapper subQuestionWrapper) async {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      withData: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (final file in files.files) {
        final path = file.path ?? "";
        final option = StaticOptionModel(
          index: subQuestionWrapper.subQuestion.options.length ,
          label: 'Image ${subQuestionWrapper.subQuestion.options.length + 1}',
          value: "",
          selected: true,
          questionAnswerType: AnswerType.upload,
        );
        if (path.isEmpty) {
          continue;
        }
        option.image = XFile(path);
        subQuestionWrapper.subQuestion.options.add(option);
        subQuestionWrapper.forceNotify();
      }
    }
    subQuestionWrapper.forceNotify();
  }
}
