import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' show Html;
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/common_divider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

class Question10018008 extends StatelessWidget {
  const Question10018008({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: queWrapper,
      child: Consumer<QuestionWrapper>(
          builder: (BuildContext context, que, Widget? child) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.iconGrey,
                  ),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Row(
                children: [
                  Expanded(
                      flex: 6,
                      child: Html(
                        data:
                            '<b>Nutritional Screening</b> (select all that apply)',
                        style: FormBuilderTextStyle.htmlTextStyle(false),
                        shrinkWrap: true,
                      )),
                  Expanded(
                    flex: 1,
                    child: Html(
                      data: 'Yes',
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            const CommonDivider(),
            ListView.separated(
              itemCount: 11,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.iconGrey,
              ),
              itemBuilder: (context, index) {
                var list = [
                  'Illness or condition that changed the kind and/or amount of food eaten',
                  'Eats fewer than 2 meals per day',
                  'Eats few fruits or vegetables or milk products',
                  'Drinks 3 or more drinks or beer, liquor, or wine almost every day',
                  'Has tooth or mouth problems that makes it hard to eat',
                  'Doesn\'t always have enough money to buy the food needed',
                  'Eats alone most of the time',
                  'Takes 3 or more different prescribed or over-the-counter drugs a day',
                  'Without wanting to has lost or gained 10 pounds in the last 6 months',
                  'Not always physically able to shop, cook, and/or feed self',
                  '<b>Score of 6-8 = high risk.</b> Potential referral to dietician, MSW,Physician.'
                ];
                return Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Html(
                        data: list[index],
                        style: FormBuilderTextStyle.htmlTextStyle(false),
                      ),
                    ),
                    Expanded(
                        flex: index == 10 ? 2 : 1,
                        child: index == 10
                            ? StaticTextFieldWidget(
                                subQuestionWrapper:
                                    que.subQuestionWrappers[index])
                            : StaticCheckBoxWidget(
                                subQuestionWrapper:
                                    que.subQuestionWrappers[index]))
                  ],
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
