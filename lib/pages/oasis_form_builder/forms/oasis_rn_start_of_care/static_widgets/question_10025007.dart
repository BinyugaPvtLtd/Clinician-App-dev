import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_radio_widget.dart';

class Question10025007 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10025007({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    const TitleDescription(
                      title:
                          "<b>1. Is taking</b><br><br> Check if the patient is taking any medications by pharmacological classification, not how it is used, in the following classes",
                    ),
                    if (Responsive.isMobile(context))
                      const TitleDescription(
                        title:
                            "<b>2. Indication Noted</b><br><br> If Column 1 is checked, check if there is an indication noted for all medications in the drug class",
                      )
                  ],
                )),
            if (!Responsive.isMobile(context))
              const Expanded(flex: 7, child: SizedBox()),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TitleDescription(
                title: Responsive.isMobile(context)
                    ? " "
                    : "<b>2. Indication Noted</b><br><br> If Column 1 is checked, check if there is an indication noted for all medications in the drug class",
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Text(
                    '↓ Check all that apply ↓',
                    style: FormBuilderTextStyle.normal10style
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '1. Is Talking',
                          style: FormBuilderTextStyle.normal10style
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '2. Indication Noted',
                          style: FormBuilderTextStyle.normal10style
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const Divider(),
        ...List.generate(6, (index) {
          final list = [
            "A. <b>Antipsychotic</b>",
            "E. <b>Anticoagulant</b>",
            "F. <b>Antibiotic</b>",
            "H. <b>Opioid</b>",
            "l. <b>Antiplatelet</b>",
            "J. <b>Hypoglycemic</b> (including insulin)",
          ];
          return _getRow(
              list[index],
              questionWrapper.subQuestionWrappers[(index * 2)],
              questionWrapper.subQuestionWrappers[(index * 2) + 1]);
        }),
        Row(
          children: [
            const Expanded(
              flex: 3,
              child: TitleDescription(
                title: "Z. <b>None of the above</b>",
              ),
            ),
            Expanded(
              flex: 7,
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: StaticRadioWidget(
                        subQuestionWrapper:
                            questionWrapper.subQuestionWrappers[12]),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _getRow(
      String title, SubQuestionWrapper wrapper1, SubQuestionWrapper wrapper2) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TitleDescription(
                title: title,
              ),
            ),
            Expanded(
                flex: 7,
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: StaticRadioWidget(subQuestionWrapper: wrapper1),
                    ),
                    Expanded(
                      child: StaticRadioWidget(subQuestionWrapper: wrapper2),
                    ),
                  ],
                )),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
