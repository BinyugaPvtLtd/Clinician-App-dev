import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' show Html;
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/common_divider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:provider/provider.dart';

class Question10018007 extends StatelessWidget {
  const Question10018007({super.key, required this.queWrapper});
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
              // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              // decoration: BoxDecoration(
              //     border: Border.all(
              //       color: AppColors.iconGrey,
              //     ),
              //     borderRadius: BorderRadius.circular(4.r)),
              child: Row(
                children: [
                  Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Html(
                            data: '<b>On Admission</b>',
                            shrinkWrap: true,
                            style: FormBuilderTextStyle.htmlTextStyle(false),
                          ),
                          Html(
                            data:
                                'Check all of the nutritional approaches that apply on admission',
                            style: FormBuilderTextStyle.htmlTextStyle(false),
                            shrinkWrap: true,
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Html(
                            data: '<b>1. On Admission</b>',
                            style: FormBuilderTextStyle.htmlTextStyle(false),
                            shrinkWrap: true,
                          ),
                          Html(
                            data:
                                '''<div style="text-align: center; font-weight: bold;">
            Check all<br>that apply ↓ 
              </div>''',
                            // '<b><p>↓ Enter Scores in ↓</p><p style="text-align:center;">Boxes</p></b>',
                            style: FormBuilderTextStyle.htmlTextStyle(false),
                            shrinkWrap: true,
                          )
                        ],
                      ))
                ],
              ),
            ),
            const CommonDivider(),
            ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.iconGrey,
              ),
              itemBuilder: (context, index) {
                var list = [
                  'A.  <b>Parenteral/IV feeding</b>',
                  'B.  <b>Feeding tube</b> (e.g., nasogastric or abdominal (PEG))',
                  'C.  <b>Mechanically altered diet</b> - require change in texture of food or liquids (e.g., pureed food, thickened liquids)',
                  'D.  <b>Therapeutic diet</b> (e.g., low salt, diabetic, low cholesterol)',
                  'Z.  <b>None of the above</b>'
                ];

                return Row(
                  children: [
                    Expanded(flex: 6, child: Html(data: list[index],
                      style: FormBuilderTextStyle.htmlTextStyle(false),
                    )),
                    Expanded(
                        flex: 1,
                        child: StaticCheckBoxWidget(
                            subQuestionWrapper: que.subQuestionWrappers[index]))
                  ],
                );
              },
            ),
            const CommonDivider(),
          ],
        );
      }),
    );
  }
}
