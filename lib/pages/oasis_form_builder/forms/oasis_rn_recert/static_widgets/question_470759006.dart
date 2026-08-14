// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
// import 'package:provider/provider.dart';
//
// import '../../../constants/app_colors.dart';
// import '../../../constants/app_text_style.dart';
// import '../../../provider/sub_question_wrapper_provider.dart';
// import '../../../widgets/popup/popup_handler.dart';
// import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';
// import '../../../widgets/static/presentation/widgets/static_textfield_widget.dart';
//
// class Question470759006 extends StatelessWidget {
//   final QuestionWrapper questionWrapper;
//
//   const Question470759006({super.key, required this.questionWrapper});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<QuestionWrapper>.value(
//       value: questionWrapper,
//       child: Consumer<QuestionWrapper>(
//         builder: (BuildContext context, value, Widget? child) {
//           final subQuestionWrappers = questionWrapper.subQuestionWrappers;
//           final options = subQuestionWrappers
//               .map((wrapper) => wrapper.subQuestion.options.first)
//               .toList();
//           return Column(
//             spacing: 10.h,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     '   ' + subQuestionWrappers[0].subQuestion.title + '   ',
//                     style: FormBuilderTextStyle.normal10style,
//                   ),
//                   Expanded(
//                     flex: 6,
//                     child: StaticTextFieldElement(
//                       option: options[0],
//                       subQuestion: subQuestionWrappers[0].subQuestion,
//                       onUpdate: (int index, String value) {
//                         subQuestionWrappers[0]
//                             .updateTextFieldValue(options[0].index, value);
//                         options[1].selected = false;
//                         questionWrapper.forceNotify();
//                       },
//                     ),
//                   ),
//                   _getIconButton(
//                       context, subQuestionWrappers[0], options[0].index),
//                   Expanded(
//                     flex: 4,
//                     child: SubQuestionCheckbox(
//                       subQuestionWrapper: subQuestionWrappers[1],
//                       optionIndex: options[1].index,
//                       onChange: (_) {
//                         subQuestionWrappers[0]
//                             .clearTextFieldAt(options[0].index);
//                         questionWrapper.forceNotify();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _getIconButton(BuildContext context,
//       SubQuestionWrapper subQuestionWrapper, int optionIndex) {
//     return IconButton(
//       onPressed: () {
//         PopupHandler.showPopup(context, "TEXTFIELDPOPUP", (newValue) {
//           subQuestionWrapper.updateTextFieldValue(optionIndex, newValue);
//         });
//       },
//       icon: Icon(Icons.edit_outlined),
//       color: AppColors.primaryAppLightColor,
//     );
//   }
// }
