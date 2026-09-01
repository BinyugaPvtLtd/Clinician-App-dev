import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_action_button.dart';
import 'package:provider/provider.dart';
import '../../../../provider/question_wapper_provider.dart';
import '../../../../provider/sub_question_wrapper_provider.dart';

class DynamicInsertTemplatePopup extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const DynamicInsertTemplatePopup({
    super.key,
    required this.questionWrapper,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: InkWell(
        onTap: () async {
          await processShowDialog(
            context,
            questionWrapper.subQuestionWrappers.first,
          );
        },
        child: Html(
          shrinkWrap: true,
          data:
              '<u><p style="color:red;"><b>${questionWrapper.subQuestionWrappers.first.subQuestion.options.first.label}</b></p></u>',
          style: _htmlTextStyle(),
        ),
      ),
    );
  }

  Future<void> processShowDialog(
      BuildContext context, SubQuestionWrapper subQuestionWrapper) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 450.w),
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Html(
                  data: '<b>MENTAL STATUS</b>',
                  style: FormBuilderTextStyle.htmlTextStyle(false),
                ),
                sbh(20),
                Html(
                  data: '<b>Patient: OASIS, E - 43761</b>',
                  style: FormBuilderTextStyle.htmlTextStyle(false),
                ),
                sbh(15),
                Html(
                  data: '<b>Chart # 3 | Lead</b>',
                  style: FormBuilderTextStyle.htmlTextStyle(false),
                ),
                sbh(20),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ChooseCategoryPopup();
                        });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.greyColor,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 25.w,
                    ),
                    child: Text(
                      'Insert From Template',
                      style: FormBuilderTextStyle.normal10style,
                    ),
                  ),
                ),
                sbh(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonButton(onTap: () {}, label: 'Insert To Form'),
                    CommonButton(
                      onTap: () {},
                      label: 'Cancel',
                      buttonColor: Colors.white,
                      textColor: AppColors.textGreyColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Map<String, Style> _htmlTextStyle() {
    return {
      "h1": Style(
        color: AppColors.redColor, // Customize text color
        fontSize: FontSize(24), // Set font size
        fontWeight: FontWeight.bold, // Make it bold
      ),
      "p": Style(
        color: AppColors.redColor, // Set text color
      ),
      "body": Style(
        fontFamily: 'Fira_Sans',
        color: AppColors.redColor, // Set text color
      ),
      "b": Style(
        color: AppColors.redColor, // Style for <b> tags
      ),
    };
  }
}

class ChooseCategoryPopup extends StatefulWidget {
  const ChooseCategoryPopup({super.key});

  @override
  State<ChooseCategoryPopup> createState() => _ChooseCategoryPopupState();
}

class _ChooseCategoryPopupState extends State<ChooseCategoryPopup> {
  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        constraints: BoxConstraints(maxWidth: 400.w),
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    'Category:',
                    style: FormBuilderTextStyle.normal10style,
                    textAlign: TextAlign.center,
                  ),
                )),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CustomDropdown<String>.search(
                        items: [
                          "( No Category )",
                          "HOMEBOUND STATUS:",
                          "RECERTIFICATION OF PATIENT ELIGIBILITY.",
                          "FACE TO FACE ENCOUNTER :",
                        ],
                        onChanged: (newValue) {
                          // subQuestionWrapper.toggleOption(newOption!.index);
                        },
                        hintText: '(Select Category)',
                        listItemBuilder: (context, value, _, __) {
                          return Text(
                            value,
                            style: FormBuilderTextStyle.normal10style,
                          );
                        },
                        headerBuilder: (context, value, ___) {
                          return Text(
                            value,
                            style: FormBuilderTextStyle.normal10style
                                .copyWith(fontWeight: FontWeight.bold),
                          );
                        },
                        decoration: CustomDropdownDecoration(
                          closedBorder:
                              Border.all(color: AppColors.textFieldBorderColor),
                          closedBorderRadius: BorderRadius.circular(5),
                          hintStyle: FormBuilderTextStyle.normal10style,
                        ),
                        closedHeaderPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      ),
                      sbh(15),
                      Text(
                        selectedCategory.isEmpty
                            ? 'Please Select a Category'
                            : selectedCategory,
                        style: FormBuilderTextStyle.normal10style,
                      ),
                      sbh(15),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.greyColor,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 20.w,
                        ),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Insert Template To ELIGIBILITY',
                            style: FormBuilderTextStyle.normal10style,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
