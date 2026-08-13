import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_asset.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/app_radio_button.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';

class Question10009003 extends StatelessWidget {
  const Question10009003({super.key, required this.queWrapper});
  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(builder: (context, que, ch) {
        return Column(
          children: [
            customHeight(14.h),
            Responsive.isMobile(context)
                ? GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    children: List.generate(
                      6,
                      (index) {
                        return ChangeNotifierProvider<SubQuestionWrapper>.value(
                          value: que.subQuestionWrappers[0],
                          child: Consumer<SubQuestionWrapper>(
                            builder: (context, value, child) {
                              final subQuestion = value.subQuestion;
                              var groupValue = subQuestion.options
                                  .firstWhereOrNull((option) => option.selected)
                                  ?.value;

                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    [
                                      AppAsset.firstPainReview,
                                      AppAsset.secondPainReview,
                                      AppAsset.thirdPainReview,
                                      AppAsset.forthPainReview,
                                      AppAsset.fifthPainReview,
                                      AppAsset.sixthPainReview,
                                    ].elementAt(index),
                                    height: 40,
                                  ),
                                  customHeight(10),
                                  Text(
                                    que.subQuestionWrappers[0].subQuestion
                                        .options[index].label,
                                    textAlign: TextAlign.center,
                                    style: FormBuilderTextStyle.normal10style
                                        .copyWith(
                                            fontWeight: FontWeight.w600),
                                  ),
                                  customHeight(10),
                                  AppRadioButton(
                                    value: subQuestion.options[index].value,
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      groupValue = value ?? "";
                                      for (var i in subQuestion.options) {
                                        i.selected = (value == i.value);
                                      }
                                      que.subQuestionWrappers[0]
                                          .forceNotify();
                                    },
                                  ),
                                  customHeight(14),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                : Row(
                    children: List.generate(
                      6,
                      (index) {
                        return ChangeNotifierProvider<SubQuestionWrapper>.value(
                          value: que.subQuestionWrappers[0],
                          child: Consumer<SubQuestionWrapper>(
                              builder: (context, value, child) {
                            final subQuestion = value.subQuestion;
                            var groupValue = subQuestion.options
                                .firstWhereOrNull((option) => option.selected)
                                ?.value;
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14.w),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      [
                                        AppAsset.firstPainReview,
                                        AppAsset.secondPainReview,
                                        AppAsset.thirdPainReview,
                                        AppAsset.forthPainReview,
                                        AppAsset.fifthPainReview,
                                        AppAsset.sixthPainReview,
                                      ].elementAt(index),
                                      height: 48.h,
                                    ),
                                    customHeight(10.h),
                                    Text(
                                      que.subQuestionWrappers[0].subQuestion
                                          .options[index].label,
                                      textAlign: TextAlign.center,
                                      style: FormBuilderTextStyle.normal10style
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                    customHeight(10.h),
                                    AppRadioButton(
                                      value: subQuestion.options[index].value,
                                      groupValue: groupValue,
                                      // activeColor: AppColors.textGreyColor,
                                      // fillColor:
                                      //     const WidgetStatePropertyAll(AppColors.textGreyColor),
                                      onChanged: (value) {
                                        // subQuestionWrapper.toggleOption(static.index);
                                        groupValue = value ?? "";
                                        for (var i in subQuestion.options) {
                                          i.selected = (value == i.value);
                                        }
                                        que.subQuestionWrappers[0]
                                            .forceNotify();
                                        // widget.onChanged?.call(value);
                                        // if (widget.onChanged != null) {
                                        //   widget.onChanged!(value);
                                        // }
                                      },
                                    ),
                                    customHeight(14.h)
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
            Html(
                data: "<i>" +
                    que.subQuestionWrappers[1].subQuestion.description +
                    "</i>")
          ],
        );
      }),
    );
  }
}
