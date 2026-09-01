import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/enums.dart';
import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../services/api/managers/form_builder_manager.dart';
import '../../../ui_components/buttons/primary_button.dart';
import '../../../widgets/reusable_widgets/wrapper_checkbox.dart';
import '../../../widgets/static/data/static_option_model.dart';
import '../../../widgets/static/data/static_question_model.dart';

class Question10032008 extends StatefulWidget {
  final QuestionWrapper questionWrapper;
  final String templeteName;
  final bool requireMinVisits;
  const Question10032008(
      {super.key, required this.questionWrapper, required this.templeteName, this.requireMinVisits = false});

  @override
  State<Question10032008> createState() => _Question10032008State();
}

class _Question10032008State extends State<Question10032008> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      await loadEmployeeTypes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ChangeNotifierProvider.value(
            value: widget.questionWrapper,
            child: Consumer<QuestionWrapper>(
              builder: (BuildContext context, QuestionWrapper questionWrapper,
                  Widget? child) {
                return Column(
                  spacing: 10.h,
                  children: [
                    ...questionWrapper.subQuestionWrappers.map(
                      (subQuestionWrapper) =>
                          ChangeNotifierProvider<SubQuestionWrapper>.value(
                        value: subQuestionWrapper,
                        child: Consumer<SubQuestionWrapper>(builder:
                            (BuildContext context, subQuestionWrapper,
                                Widget? child) {
                          var options = subQuestionWrapper.subQuestion.options;
                          return _getRow(context, subQuestionWrapper);
                        }),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
  }

  Widget _getRow(BuildContext context, SubQuestionWrapper subQuestionWrapper,
      {bool firstRow = false}) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final selectedDates = generateDatesFromString(
              subQuestionWrapper.subQuestion.options.first.value);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        _getCheckBox(subQuestionWrapper, 0),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        openCalenderPopup(context, widget.questionWrapper,
                            subQuestionWrapper);
                      },
                      child: Text(
                        'Manage Frequency',
                        style: FormBuilderTextStyle.bold10Style
                            .copyWith(color: AppColors.primaryAppLightColor),
                      ),
                    ),
                  ),
                ],
              ),
              if (selectedDates.isNotEmpty)
                Text(
                  '(${buildSummary(selectedDates)})',
                  style: FormBuilderTextStyle.normal10style,
                ),
            ],
          );
        },
      ),
    );
  }

  Future<void> openCalenderPopup(
      BuildContext context,
      QuestionWrapper questionWrapper,
      SubQuestionWrapper subQuestionWrapper) async {
    await showDialog(
        context: context,
        builder: (context) {
          return CalenderPopup(
              templeteName: widget.templeteName,
              questionWrapper: questionWrapper,
              selectedSubQuestionWrapper: subQuestionWrapper,
              requireMinVisits: widget.requireMinVisits);
        });
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, optionIndex) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
    );
  }

  Future<DateTime?> openDatePicker(
      BuildContext context, DateTime? initialDate) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1000),
        lastDate: DateTime(4000),
        initialDate: initialDate);
    return date;
  }

  Future<void> loadEmployeeTypes() async {
    if (widget.questionWrapper.isAnswered) {
      isLoading = false;
      if (mounted) {
        setState(() {});
      }
      return;
    }
    setState(() {
      isLoading = true;
    });
    final employeeTypes =
        await FormBuilderManager().getEmployeeTypesByDepartment1(context);
    widget.questionWrapper.subQuestionWrappers.clear();

    widget.questionWrapper.subQuestionWrappers.addAll(
      employeeTypes.map((element) {
        final index = employeeTypes.indexOf(element);
        final wrapper = SubQuestionWrapper(
          subQuestion: StaticQuestionModel(
              id: index + 1,
              code: null,
              type: AnswerType.static,
              title: '',
              description: '',
              optionsAlignment: OptionsAlignment.vertical,
              scrollAxisAlignment: OptionsAlignment.vertical,
              groupOptions: false,
              options: [
                StaticOptionModel(
                  index: 0,
                  label: element.abbreviation,
                  value: '',
                  selected: false,
                  questionAnswerType: AnswerType.checkbox,
                ),
                StaticOptionModel(
                  index: 1,
                  label: '',
                  value: '',
                  selected: false,
                  questionAnswerType: AnswerType.date,
                ),
              ],
              flags: []),
        );
        wrapper.addListener(widget.questionWrapper.onSubQuestionChanged);
        return wrapper;
      }),
    );

    widget.questionWrapper.forceNotify();

    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }
}

class CalenderPopup extends StatefulWidget {
  final QuestionWrapper questionWrapper;
  final SubQuestionWrapper selectedSubQuestionWrapper;
  final String templeteName;
  final bool requireMinVisits;
  const CalenderPopup({
    super.key,
    required this.questionWrapper,
    required this.templeteName,
    required this.selectedSubQuestionWrapper,
    this.requireMinVisits = false,
  });

  @override
  State<CalenderPopup> createState() => _CalenderPopupState();
}

class _CalenderPopupState extends State<CalenderPopup> {
  List<Day> days = [];
  late SubQuestionWrapper selectedSubQuestionWrapper;
  bool _showValidationError = false;

  @override
  void initState() {
    days = generate70Days(DateTime.now());
    selectedSubQuestionWrapper = widget.selectedSubQuestionWrapper;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final questionWrapper = widget.questionWrapper;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(Responsive.isMobile(context) ? 10 : 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Responsive.isMobile(context)
                ? Container()
                : Container(
                    constraints: BoxConstraints(
                        minWidth: Responsive.isMobile(context) ? 10.w : 80.w),
                    child: IconButton(
                      onPressed: () {
                        if (widget.requireMinVisits) {
                          final dates = generateDatesFromString(
                              selectedSubQuestionWrapper.subQuestion.options.first.value);
                          if (dates.length < 2) {
                            setState(() { _showValidationError = true; });
                            return;
                          }
                        }
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Responsive.isMobile(context)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10.h,
                                children: [
                                  Text(
                                    widget.templeteName,
                                    style: FormBuilderTextStyle.bold14style
                                        .copyWith(fontSize: 16),
                                  ),
                                  Text(
                                    'Plan Of Care',
                                    style: FormBuilderTextStyle.bold10Style,
                                  ),
                                  Text(
                                    'Select Discipline',
                                    style: FormBuilderTextStyle.bold10Style
                                        .copyWith(fontSize: 12),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: CustomDropdown<SubQuestionWrapper>(
                                      items:
                                          questionWrapper.subQuestionWrappers,
                                      onChanged: (newOption) {
                                        setState(() {
                                          selectedSubQuestionWrapper =
                                              newOption!;
                                        });
                                      },
                                      initialItem: selectedSubQuestionWrapper,
                                      hintText: '(Select)',
                                      listItemBuilder:
                                          (context, subQuestionWrapper, _, __) {
                                        return Html(
                                          data: subQuestionWrapper
                                              .subQuestion.options.first.label,
                                          style: FormBuilderTextStyle
                                              .htmlTextStyle(false),
                                        );
                                      },
                                      headerBuilder:
                                          (context, subQuestionWrapper, ___) {
                                        return Html(
                                          data:
                                              "<b>${subQuestionWrapper.subQuestion.options.first.label}</b>",
                                          style: FormBuilderTextStyle
                                              .htmlTextStyle(false),
                                        );
                                      },
                                      decoration: CustomDropdownDecoration(
                                        closedBorder: Border.all(
                                            color:
                                                AppColors.textFieldBorderColor),
                                        closedBorderRadius:
                                            BorderRadius.circular(5),
                                      ),
                                      closedHeaderPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10.h,
                                children: [
                                  Text(
                                    widget.templeteName,
                                    style: FormBuilderTextStyle.bold14style,
                                  ),
                                  Text(
                                    'Plan Of Care',
                                    style: FormBuilderTextStyle.bold10Style,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Select Discipline',
                                      style: FormBuilderTextStyle.bold10Style,
                                    ),
                                    Container(
                                      width: 150.w,
                                      child: CustomDropdown<SubQuestionWrapper>(
                                        items:
                                            questionWrapper.subQuestionWrappers,
                                        onChanged: (newOption) {
                                          setState(() {
                                            selectedSubQuestionWrapper =
                                                newOption!;
                                          });
                                        },
                                        initialItem: selectedSubQuestionWrapper,
                                        hintText: '(Select)',
                                        listItemBuilder: (context,
                                            subQuestionWrapper, _, __) {
                                          return Html(
                                            data: subQuestionWrapper.subQuestion
                                                .options.first.label,
                                            style: FormBuilderTextStyle
                                                .htmlTextStyle(false),
                                          );
                                        },
                                        headerBuilder:
                                            (context, subQuestionWrapper, ___) {
                                          return Html(
                                            data:
                                                "<b>${subQuestionWrapper.subQuestion.options.first.label}</b>",
                                            style: FormBuilderTextStyle
                                                .htmlTextStyle(false),
                                          );
                                        },
                                        decoration: CustomDropdownDecoration(
                                          closedBorder: Border.all(
                                              color: AppColors
                                                  .textFieldBorderColor),
                                          closedBorderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        closedHeaderPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                  sbh(40),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.isMobile(context) ? 5 : 20),
                    child: Row(
                      children: [
                        ...List.generate(7, (index) {
                          final list = [
                            Responsive.isMobile(context) ? "S" : 'Sun',
                            Responsive.isMobile(context) ? "M" : 'Mon',
                            Responsive.isMobile(context) ? "T" : 'Tue',
                            Responsive.isMobile(context) ? "W" : 'Wed',
                            Responsive.isMobile(context) ? "T" : 'Thu',
                            Responsive.isMobile(context) ? "F" : 'Fri',
                            Responsive.isMobile(context) ? "S" : 'Sat',
                          ];
                          return Expanded(
                            child: Center(
                              child: Text(
                                list[index],
                                style: FormBuilderTextStyle.normal10style
                                    .copyWith(color: AppColors.greyColor),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ChangeNotifierProvider.value(
                      value: selectedSubQuestionWrapper,
                      child: Consumer<SubQuestionWrapper>(
                        builder: (BuildContext context,
                            SubQuestionWrapper subQuestionWrapper,
                            Widget? child) {
                          final selectedDates = generateDatesFromString(
                              subQuestionWrapper
                                  .subQuestion.options.first.value);
                          return Container(
                            padding: EdgeInsets.all(
                                Responsive.isMobile(context) ? 5 : 20),
                            child: Column(
                              children: [
                                if (selectedDates.isNotEmpty)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '(${buildSummary(selectedDates)})',
                                        style:
                                            FormBuilderTextStyle.normal10style,
                                      ),
                                    ],
                                  ),
                                Expanded(
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 7,
                                            childAspectRatio:
                                                Responsive.isMobile(context)
                                                    ? 1
                                                    : 1.5,
                                            crossAxisSpacing:
                                                Responsive.isMobile(context)
                                                    ? 2
                                                    : 10,
                                            mainAxisSpacing:
                                                Responsive.isMobile(context)
                                                    ? 2
                                                    : 10),
                                    itemBuilder: (ctx, index) {
                                      final day = days[index];
                                      bool isSelected =
                                          selectedDates.contains(day.date);
                                      return InkWell(
                                        onTap: () {
                                          if (isSelected) {
                                            selectedDates.remove(day.date);
                                          } else {
                                            selectedDates.add(day.date);
                                          }
                                          subQuestionWrapper
                                              .updateTextFieldValue(
                                                  0,
                                                  selectedDates
                                                      .map((date) => DateFormat(
                                                              'MM-dd-yyyy')
                                                          .format(date))
                                                      .join(','));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 20),
                                          color: isSelected
                                              ? Colors.blue.shade50
                                              : const Color(0xfff9edff),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '${day.date.day == 1 ? DateFormat('MMM').format(day.date) : ''} ${day.date.day.toString()}',
                                                    style: Responsive.isMobile(
                                                            context)
                                                        ? FormBuilderTextStyle
                                                            .normal10style
                                                            .copyWith(
                                                                fontSize: 8)
                                                        : FormBuilderTextStyle
                                                            .normal10style,
                                                  )
                                                ],
                                              ),
                                              Responsive.isMobile(context)
                                                  ? Spacer()
                                                  : Container(),
                                              if (isSelected)
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: Responsive.isMobile(
                                                              context)
                                                          ? 2
                                                          : 10.0),
                                                  child: Text(
                                                    'Visit#${selectedDates.indexOf(day.date) + 1}',
                                                    style: FormBuilderTextStyle
                                                        .bold10Style
                                                        .copyWith(
                                                      fontSize:
                                                          Responsive.isMobile(
                                                                  context)
                                                              ? 8
                                                              : 12,
                                                      color: AppColors
                                                          .primaryAppColor,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: 70,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (_showValidationError)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Please select more than one visit in date calendar',
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Responsive.isMobile(context)
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 20),
                          child: Row(
                            spacing: 20,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              PrimaryButton(
                                onTap: () => Navigator.pop(context),
                                label: 'Close',
                                borderRadius: 10,
                                // width: 120.w,
                                // height: 35.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                buttonColor: Colors.white,
                                labelStyle:
                                    FormBuilderTextStyle.normal10style.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              PrimaryButton(
                                onTap: () {
                                  if (widget.requireMinVisits) {
                                    final dates = generateDatesFromString(
                                        selectedSubQuestionWrapper.subQuestion.options.first.value);
                                    if (dates.length < 2) {
                                      setState(() { _showValidationError = true; });
                                      return;
                                    }
                                  }
                                  Navigator.pop(context);
                                },
                                label: 'Save',
                                borderRadius: 10,
                                // height: 35.h,
                                // width: 120.w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                labelStyle: FormBuilderTextStyle.normal10style
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Day> generate70Days(DateTime currentDate) {
  List<Day> daysList = [];

  // Get first day of current month
  DateTime firstOfCurrentMonth =
      DateTime(currentDate.year, currentDate.month, 1);

  // Step 1: Start from the Sunday before or on the first of the current month
  int daysToSubtract = firstOfCurrentMonth.weekday % 7; // Sunday = 7 % 7 = 0
  DateTime startDate =
      firstOfCurrentMonth.subtract(Duration(days: daysToSubtract));

  // Step 2: Get last day of next month
  DateTime firstOfNextMonth =
      DateTime(currentDate.year, currentDate.month + 1, 1);
  DateTime firstOfNextNextMonth =
      DateTime(currentDate.year, currentDate.month + 2, 1);
  DateTime lastOfNextMonth =
      firstOfNextNextMonth.subtract(const Duration(days: 1));

  // Step 3: Generate all days from startDate until last day of next month
  DateTime datePointer = startDate;
  while (!datePointer.isAfter(lastOfNextMonth)) {
    daysList.add(Day(date: datePointer));
    datePointer = datePointer.add(const Duration(days: 1));
  }

  // Step 4: If less than 70 days, keep adding from month after next
  while (daysList.length < 70) {
    daysList.add(Day(date: datePointer));
    datePointer = datePointer.add(const Duration(days: 1));
  }

  return daysList;
}

int getWeekNumber(DateTime date) {
  final firstDayOfYear = DateTime(date.year, 1, 1);
  final daysSinceStart = date.difference(firstDayOfYear).inDays;
  return ((daysSinceStart + firstDayOfYear.weekday) / 7).ceil();
}

Map<int, int> groupVisitsByWeek(List<DateTime> visits) {
  Map<int, int> weekCounts = {};
  for (var date in visits) {
    int weekNum = getWeekNumber(date);
    weekCounts[weekNum] = (weekCounts[weekNum] ?? 0) + 1;
  }
  return weekCounts;
}

String buildSummary(List<DateTime> visits) {
  final weekCounts = groupVisitsByWeek(visits);

  // Count how many weeks had X visits
  Map<int, int> summaryCounts = {};
  weekCounts.values.forEach((count) {
    summaryCounts[count] = (summaryCounts[count] ?? 0) + 1;
  });

  // Format like "3w1, 2w2"
  return summaryCounts.entries.map((e) => "${e.value}w${e.key}").join(", ");
}

List<DateTime> generateDatesFromString(String value) {
  final splitList = value.split(',');
  splitList.remove("");
  return splitList
      .map(
        (dateString) => DateFormat('MM-dd-yyyy').parse(dateString),
      )
      .toList();
}

class Day {
  DateTime date;

  Day({required this.date});
}
