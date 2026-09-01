import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:clinician_app/pages/oasis_form_builder/constants/app_colors.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/helpers/date_formatter.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_text_style.dart';
import '../../../../provider/question_wapper_provider.dart';
import '../../model/option_data_model.dart';

class DynamicDateFieldSection extends StatelessWidget {
  const DynamicDateFieldSection({super.key, required this.questionWrapper});

  final QuestionWrapper questionWrapper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionWrapper>.value(
      value: questionWrapper,
      child: Consumer<QuestionWrapper>(
        builder: (BuildContext context, questionWrapper, Widget? child) {
          final question = questionWrapper.question;
          final options = question.options;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: options!.map((option) {
              final initialDate = DateTime.tryParse(option.value);
              return SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _getTitle(option),
                    _getOptions(context, questionWrapper, option, initialDate),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _getTitle(OptionDataModel option) {
    return Flexible(
      child: Html(
        data: option.label,
        style: FormBuilderTextStyle.htmlTextStyle(false),
      ),
    );
  }

  Widget _getOptions(BuildContext context, QuestionWrapper questionWrapper,
      OptionDataModel option, DateTime? initialDate) {
    return Responsive.isMobile(context)
        ? Column(
            children: [
              _getDateFieldElement(context, option, initialDate),
              if (option.hint != null && option.hint!.trim().isNotEmpty)
                Html(
                  data: option.hint,
                  style: FormBuilderTextStyle.htmlTextStyle(false),
                ),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: _getDateFieldElement(context, option, initialDate),
              ),
              if (option.hint != null && option.hint!.isNotEmpty)
                Expanded(
                  child: Html(
                    data: option.hint,
                    style: FormBuilderTextStyle.htmlTextStyle(false),
                  ),
                ),
            ],
          );
  }

  Widget _getDateFieldElement(BuildContext context, OptionDataModel option, DateTime? initialDate)
  {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.textFieldBorderColor, width: 1),
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: InkWell(
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.tryParse(option.value),
            firstDate: DateTime(1000),
            lastDate: DateTime(5000),
          );
          if (date != null) {
            questionWrapper.updateTextFieldValue(
                option.index, date.toIso8601String());
          }
        },
        child: Row(
          children: [
            Expanded(
              child: AbsorbPointer(
                absorbing: true,
                child: TextFormField(
                  key: UniqueKey(),
                  initialValue: initialDate == null
                      ? null
                      : formatDate(initialDate),
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical:
                      Responsive.isDesktop(context) ? 10 : 15,
                    ),
                    hintStyle: FormBuilderTextStyle.normal10style
                        .copyWith(
                        // fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.hintGreyColor),
                    hintText: "MM-DD-YYYY",
                  ),
                  style: FormBuilderTextStyle.normal10style,
                ),
              ),
            ),
            const Icon(
              Icons.calendar_month,
              color: AppColors.textGreyColor,
            ),
          ],
        ),
      ),
    );
  }

}
