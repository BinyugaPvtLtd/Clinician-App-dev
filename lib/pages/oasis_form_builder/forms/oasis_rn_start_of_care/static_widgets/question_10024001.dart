import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/helper_widgets/dynamic_checkbox_element.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_textfield_widget.dart';
import 'package:provider/provider.dart';

class Question10024001 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question10024001({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrapper1 = questionWrapper.subQuestionWrappers[0];
    final subQuestionWrapper2 = questionWrapper.subQuestionWrappers[1];
    return Column(
      children: [
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subQuestionWrapper1,
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context, subQuestionWrapper, Widget? child) {
              final subQuestion = subQuestionWrapper.subQuestion;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Points',
                        style: FormBuilderTextStyle.normal10style
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ...subQuestion.options.map((option) {
                    final descriptions = [
                      "",
                      "Includes only documented medical diagnosis",
                      "An unintentional change in position resulting in coming to rest on the ground or at a lower level",
                      "Inability to make it to the bathroom or commode in timely manner Includes frequency, urgency, and/or nocturia.",
                      "Includes but not limited to, macular degeneration, diabetic retinopathies, visual field loss, age related changes, decline in visual acuity, accommodation, glare tolerance, depth perception, and night vision or not wearing prescribed glasses or having the correct prescription.",
                      "May include patients who need help with IADLS or ADLS or have gait or transfer problems, arthritis, pain, fear of falling, foot problems, impaired sensation, impaired coordination or improper use of assistive devices.",
                      "May include but not limited to, poor illumination, equipment tubing, inappropriate footwear, pets, hard to reach items, floor surfaces that are uneven or cluttered, or outdoor entry and exits. ",
                      "ALL PRESCRIPTIONS including prescriptions for OTC meds. Drugs highly associated with fall risk include but not limited to, sedatives, anti-depressants, tranquilizers. narcotics, antihypertensives, cardiac meds, corticosteroids, anti-anxiety drugs, anticholinergic drugs, and hypoglycemic drugs.",
                      "Pain often affects an individual's desire or ability to move or pain can be a factor in depression or compliance with safety recommendations.",
                      "Could include patients with dementia, Alzheimer's or stroke patients or patients who are confused, use poor judgment, have decreased comprehension, impulsivity, memory deficits. Consider patients ability to adhere to the plan of care.",
                    ];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleDescription(
                                  title: option.label,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    descriptions[option.index],
                                    style: FormBuilderTextStyle.normal10style,
                                    textAlign: TextAlign.left,
                                  ),
                                )
                              ],
                            ),
                          ),
                          DynamicCheckboxElement(
                            label: "",
                            value: "",
                            selected: option.selected,
                            onTap: (_, __) {
                              subQuestionWrapper.toggleOption(option.index);
                            },
                            index: option.index,
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        ChangeNotifierProvider<SubQuestionWrapper>.value(
          value: subQuestionWrapper2,
          child: Consumer<SubQuestionWrapper>(
            builder: (BuildContext context, subQuestionWrapper, Widget? child) {
              final subQuestion = subQuestionWrapper.subQuestion;
              return Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: Text(
                        'A score of 4 or more is considered at risk for falling',
                        style: FormBuilderTextStyle.normal10style
                            .copyWith(fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Text(
                          'Total',
                          style: FormBuilderTextStyle.normal10style
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: StaticTextFieldElement(
                            option: subQuestion.options.first,
                            subQuestion: subQuestion,
                            onUpdate: (index, value) {
                              subQuestionWrapper.updateTextFieldValue(
                                  index, value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Missouri Alliance for HOME CARE 2420 Hyde Park, Suite A, Jefferson City, MO 65109-4731 (573) 634-7772 (573) 634-4374 Fax',
          style: FormBuilderTextStyle.normal10style,
        )
      ],
    );
  }
}
