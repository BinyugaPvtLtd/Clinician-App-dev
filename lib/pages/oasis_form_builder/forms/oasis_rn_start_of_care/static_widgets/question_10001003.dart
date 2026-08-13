import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_check_box_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:provider/provider.dart';

import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';

class Question10001003 extends StatelessWidget {
  const Question10001003({super.key, required this.queWrapper});

  final QuestionWrapper queWrapper;

  static const String _liablityPaymentTxt =
      '''I understand that while I am under the agency's plan of care, the agency will coordinate all medically necessary therapy services and medical supplies for me. Should | arrange for these services or supplies on my own, I understand that Medicare will not reimburse me or my supplier, and | will be responsible for their cost.''';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // title: 'Liability For Payment'.toUpperCase(),
      // backgroundColor: (Responsive.isMobile(context)) ? Colors.white : null,
      children: [
        Html(
          data:
              '''I certify that the information given by me in applying for payment under Title XVIII of the Social Security Act and/or from any third party payer is correct. | request that payment of authorized
        benefits from Medicare, Medicaid, or other responsible payers be made on my behalf of ProHealth Home Care.''',
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        customHeight(14.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ChangeNotifierProvider<SubQuestionWrapper>.value(
            value: queWrapper.subQuestionWrappers[0],
            child: Consumer<SubQuestionWrapper>(
                builder: (context, subQuestionWrapper, ch) {
              final subquestion = subQuestionWrapper.subQuestion;
              return RichText(
                text: TextSpan(
                    text: 'I\t\t',
                    style: FormBuilderTextStyle.normal10style.copyWith(
                      // fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGreyColor),
                    children: [
                      WidgetSpan(
                        child: SubQuestionCheckbox(
                          subQuestionWrapper: subQuestionWrapper,
                          optionIndex: 0,
                        ),
                        baseline: TextBaseline.alphabetic,
                        alignment: PlaceholderAlignment.middle,
                      ),
                      // TextSpan(
                      //   text: '\t\t${subquestion.options[0].label}\t\t',
                      //   style: FormBuilderTextStyle.normal10style.copyWith(
                      //     // fontSize: 14,
                      //       fontWeight: FontWeight.w600,
                      //       color: AppColors.textGreyColor),
                      // ),
                      WidgetSpan(
                        child:SubQuestionCheckbox(
                          subQuestionWrapper: subQuestionWrapper,
                          optionIndex:1,
                        ),
                        baseline: TextBaseline.alphabetic,
                        alignment: PlaceholderAlignment.middle,
                      ),
                      // TextSpan(
                      //   text:
                      //   '\t\t${queWrapper.question.subQuestions[0].options[1].label} ',
                      //   style: FormBuilderTextStyle.normal10style.copyWith(
                      //     // fontSize: 14,
                      //       fontWeight: FontWeight.w600,
                      //       color: AppColors.textGreyColor),
                      // ),
                      TextSpan(
                        text:
                        'a participating member of an HMO (health maintenance organization). If I enroll in one, I will immediately notify the home care agency.',
                        style: FormBuilderTextStyle.normal10style.copyWith(
                          // fontSize: 14,
                          color: AppColors.textGreyColor,
                        ),
                      ),
                    ]),
              );
            }),
          ),
        ),
        customHeight(14.h),
        Html(
          data:
              '''If I have <b>Medicare benefits,</b> I understand that Medicare payments will be accepted as payment in full unless the agency notifies me in writing that the services will not be covered by Medicare''',
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        customHeight(14.h),
        Html(
          data: _liablityPaymentTxt,
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        customHeight(14.h),
        Html(
          data:
              '''If I have other <b>health insurance, </b> I may be responsible for the co-payments and any charges that my insurance will not cover. Those costs will be itemized and explained to me on a separate Client Service Agreement.''',
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        customHeight(14.h),
        Html(
          data: 'Expected payer source(s) for my home care services include: ',
          style: FormBuilderTextStyle.htmlTextStyle(false),
        ),
        customHeight(14.h),
        StaticCheckBoxWidget(
            subQuestionWrapper: queWrapper.subQuestionWrappers[1]),
      ],
    );
  }
}
