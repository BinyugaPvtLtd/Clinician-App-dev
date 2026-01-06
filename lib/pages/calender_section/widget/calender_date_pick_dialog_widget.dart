import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalenderDatePickDialogWidget extends StatefulWidget {
  const CalenderDatePickDialogWidget({super.key});

  @override
  State<CalenderDatePickDialogWidget> createState() =>
      _CalenderDatePickDialogWidgetState();
}

class _CalenderDatePickDialogWidgetState
    extends State<CalenderDatePickDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: Colors.white,
          ),
          child: CalendarDatePicker2(
            onValueChanged: (value) {
              // log('-=-=->${value}');
              if (value.isNotEmpty && value.first != null) {
                final DateTime d = value.first!;
                final formatted =
                    "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";

                Get.back(result: formatted); // ✅ return String
              }
            },
            config: CalendarDatePicker2Config(
              firstDayOfWeek: 1,
              weekdayLabelBuilder: ({isScrollViewTopHeader, required weekday}) {
                return Text(
                  CommonMethods.formatWeekday(weekday),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bold14style.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: AppColors.greyColor,
                  ),
                );
              },
              calendarType: CalendarDatePicker2Type.range,
              selectedDayTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              dayTextStyle: AppTextStyle.normal14style.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.calenderTxtBlack,
              ),
              disabledMonthTextStyle: AppTextStyle.bold14style,
              disabledDayTextStyle: AppTextStyle.normal10style,

              disableVibration: false,
              centerAlignModePicker: true,
              customModePickerIcon: SizedBox(),
              dayBorderRadius: BorderRadius.circular(6.r),
              selectedRangeDecorationPredicate: ({
                required dayToBuild,
                required decoration,
                required isEndDate,
                required isStartDate,
              }) {
                return BoxDecoration(
                  color: AppColors.primaryAppColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: isStartDate ? Radius.circular(6.r) : Radius.zero,
                    bottomLeft:
                        isStartDate ? Radius.circular(6.r) : Radius.zero,
                    topRight: isEndDate ? Radius.circular(6.r) : Radius.zero,
                    bottomRight: isEndDate ? Radius.circular(6.r) : Radius.zero,
                  ),
                  border: Border(
                    top: BorderSide(
                      color: AppColors.primaryAppColor,
                      width: 1.7.w,
                    ),
                    left:
                        (isStartDate)
                            ? BorderSide(
                              color: AppColors.primaryAppColor,
                              width: 1.7.w,
                            )
                            : BorderSide.none,
                    right:
                        isEndDate
                            ? BorderSide(
                              color: AppColors.primaryAppColor,
                              width: 1.7.w,
                            )
                            : BorderSide.none,
                    bottom: BorderSide(
                      color: AppColors.primaryAppColor,
                      width: 1.7.w,
                    ),
                  ),
                );
              },
              selectedRangeHighlightBuilder: ({
                required dayToBuild,
                required isEndDate,
                required isStartDate,
              }) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryAppColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.only(
                      topLeft: isStartDate ? Radius.circular(6.r) : Radius.zero,
                      bottomLeft:
                          isStartDate ? Radius.circular(6.r) : Radius.zero,
                      topRight: isEndDate ? Radius.circular(6.r) : Radius.zero,
                      bottomRight:
                          isEndDate ? Radius.circular(6.r) : Radius.zero,
                    ),
                    border: Border(
                      top: BorderSide(
                        color: AppColors.primaryAppColor,
                        width: 1.7.w,
                      ),
                      left:
                          (isStartDate)
                              ? BorderSide(
                                color: AppColors.primaryAppColor,
                                width: 1.7.w,
                              )
                              : BorderSide.none,
                      right:
                          isEndDate
                              ? BorderSide(
                                color: AppColors.primaryAppColor,
                                width: 1.7.w,
                              )
                              : BorderSide.none,
                      bottom: BorderSide(
                        color: AppColors.primaryAppColor,
                        width: 1.7.w,
                      ),
                    ),
                  ),
                );
              },
              dayBuilder: ({
                required date,
                decoration,
                isDisabled,
                isSelected,
                isToday,
                textStyle,
              }) {
                return Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  decoration:
                      (isSelected ?? false)
                          ? BoxDecoration(
                            color: AppColors.primaryAppColor.withValues(
                              alpha: 0.2,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.primaryAppColor,
                              width: 1.7.w,
                            ),
                          )
                          : null,
                  child: Text(
                    '${date.day}',
                    style: AppTextStyle.normal14style.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.calenderTxtBlack,
                    ),
                  ),
                );
              },
              // dayBuilder: _yourDayBuilder,
              // yearBuilder: _yourYearBuilder,
            ),
            value: [],
            // onValueChanged: (dates) => _dates = dates,
          ),
        ),
      ),
    );
  }
}
