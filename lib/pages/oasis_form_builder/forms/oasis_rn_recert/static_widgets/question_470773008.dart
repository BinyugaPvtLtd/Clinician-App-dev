import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/reusable_widgets/wrapper_checkbox.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/static_datefield_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../provider/sub_question_wrapper_provider.dart';

class Question470773008 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  const Question470773008({super.key, required this.questionWrapper});

  @override
  Widget build(BuildContext context) {
    final subQuestionWrappers = questionWrapper.subQuestionWrappers;
    return Column(
      spacing: 10,
      children: [
        _getRow(context, subQuestionWrappers[0], firstRow: true),
        _getRow(context, subQuestionWrappers[1]),
        _getRow(context, subQuestionWrappers[2]),
        _getRow(context, subQuestionWrappers[3]),
        _getRow(context, subQuestionWrappers[4]),
        _getRow(context, subQuestionWrappers[5]),
        _getRow(context, subQuestionWrappers[6]),
      ],
    );
  }

  Widget _getRow(BuildContext context, SubQuestionWrapper subQuestionWrapper,
      {bool firstRow = false}) {
    final isMobile = Responsive.isMobile(context);
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: subQuestionWrapper,
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          return Row(
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
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StaticDateFieldElement(
                    onDateChange: (newDate) {
                      subQuestionWrapper.updateTextFieldValue(
                          1, newDate.toIso8601String());
                    },
                    initialDate: DateTime.tryParse(
                        subQuestionWrapper.subQuestion.options[1].value),
                  ),
                  // if (isMobile)
                  //   firstRow ? _getCheckBox(subQuestionWrapper, 2) : SizedBox(),
                ],
              )),
              // if (!isMobile)
              //   Expanded(
              //       flex: 2,
              //       child: firstRow
              //           ? Padding(
              //               padding: EdgeInsets.only(left: 50),
              //               child: _getCheckBox(subQuestionWrapper, 2),
              //             )
              //           : SizedBox()),
            ],
          );
        },
      ),
    );
  }

  Future<void> openCalenderPopup(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return CalenderPopup();
        });
  }

  Widget _getCalenderButton(BuildContext context,
      SubQuestionWrapper subQuestionWrapper, int optionIndex) {
    final option = subQuestionWrapper.subQuestion.options[optionIndex];
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            final date =
                await openDatePicker(context, DateTime.tryParse(option.value));
            if (date != null) {
              subQuestionWrapper.updateTextFieldValue(
                  optionIndex, date.toIso8601String());
            }
          },
          icon: Icon(Icons.calendar_month),
          color: AppColors.primaryAppLightColor,
        ),
        Text(
          option.label,
          style: FormBuilderTextStyle.normal10style,
        ),
      ],
    );
  }

  Widget _getCheckBox(SubQuestionWrapper subQuestionWrapper, optionIndex) {
    return SubQuestionCheckbox(
      subQuestionWrapper: subQuestionWrapper,
      optionIndex: optionIndex,
      isEnabled: true,
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
}

class CalenderPopup extends StatefulWidget {
  const CalenderPopup({super.key});

  @override
  State<CalenderPopup> createState() => _CalenderPopupState();
}

class _CalenderPopupState extends State<CalenderPopup> {
  List<Day> days = [];

  @override
  void initState() {
    days = generate70Days(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
       
              constraints: BoxConstraints(
                  minWidth:  80.w),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10.h,
                        children: [
                          Text(
                            'OASIS RN Start Of Care',
                            style: FormBuilderTextStyle.bold14style,
                          ),
                          Text(
                            'Plan Of Care',
                            style: FormBuilderTextStyle.bold10Style,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Discipline',
                            style: FormBuilderTextStyle.bold10Style,
                          ),
                          Container(
                            width: 150.w,
                            child: CustomDropdown<String>(
                              items: [
                                "OT",
                                "ST",
                                "SN",
                                "PT",
                                "MSW",
                                "HHA",
                                "RD"
                              ],
                              onChanged: (newOption) {},
                              initialItem: "PT",
                              hintText: '(Select)',
                              listItemBuilder: (context, option, _, __) {
                                return Text(
                                  option,
                                  style: FormBuilderTextStyle.normal10style,
                                );
                              },
                              headerBuilder: (context, option, ___) {
                                return Text(
                                  option,
                                  style: FormBuilderTextStyle.normal10style
                                      .copyWith(fontWeight: FontWeight.bold),
                                );
                              },
                              decoration: CustomDropdownDecoration(
                                closedBorder: Border.all(
                                    color: AppColors.textFieldBorderColor),
                                closedBorderRadius: BorderRadius.circular(5),
                              ),
                              closedHeaderPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  sbh(40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        ...List.generate(7, (index) {
                          final list = [
                            'Sun',
                            'Mon',
                            'Tue',
                            'Wed',
                            'Thu',
                            'Fri',
                            'Sat',
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
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemBuilder: (ctx, index) {
                          final day = days[index];
                          return Container(
                            padding: EdgeInsets.all(20),
                            color: Color(0xfff9edff),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${day.date.day == 1 ? DateFormat('MMM').format(day.date) : ''} ${day.date.day.toString()}',
                                      style: FormBuilderTextStyle.normal10style,
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
    DateTime lastOfNextMonth = firstOfNextNextMonth.subtract(Duration(days: 1));

    // Step 3: Generate all days from startDate until last day of next month
    DateTime datePointer = startDate;
    while (!datePointer.isAfter(lastOfNextMonth)) {
      daysList.add(Day(date: datePointer));
      datePointer = datePointer.add(Duration(days: 1));
    }

    // Step 4: If less than 70 days, keep adding from month after next
    while (daysList.length < 70) {
      daysList.add(Day(date: datePointer));
      datePointer = datePointer.add(Duration(days: 1));
    }

    return daysList;
  }
}

class Day {
  DateTime date;

  Day({required this.date});
}
