import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

// ignore: must_be_immutable
class DateSelectionButton extends StatefulWidget {
  DateSelectionButton(
      {super.key,
      this.time,
      this.height,
      this.width,
      this.hintTxt,
      this.hintStyle});
  DateTime? time;
  final double? height;
  final double? width;
  final String? hintTxt;
  final TextStyle? hintStyle;

  @override
  State<DateSelectionButton> createState() => _DateSelectionButtonState();
}

class _DateSelectionButtonState extends State<DateSelectionButton> {
  Rx<DateTime?> selectedDateTime = (null as DateTime?).obs;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 5),
      () {
        selectedDateTime.value = widget.time;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var date = await showDatePicker(
            context: context,
            firstDate: DateTime(2015),
            lastDate: DateTime(2030));
        widget.time = date ?? DateTime.now();
        selectedDateTime.value = date ?? DateTime.now();
      },
      child: Container(
          height: widget.height,
          width: widget.width,
          constraints: BoxConstraints(maxWidth: 229.w, maxHeight: 30.h),
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 1.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: AppColors.textFieldBorderColor)),
          child: Row(
            children: [
              Expanded(
                child: Obx(
                  () => Text(
                      selectedDateTime.value == null
                          ? widget.hintTxt ?? 'dd-mm-yy'
                          : DateFormat('dd/MM/yyyy')
                              .format(selectedDateTime.value ?? DateTime.now()),
                      style: FormBuilderTextStyle.normal10style.copyWith(
                          fontSize: selectedDateTime.value == null
                              ? widget.hintStyle?.fontSize ?? 10.sp
                              : null,
                          fontWeight: selectedDateTime.value == null
                              ? widget.hintStyle?.fontWeight
                              : FontWeight.w500,
                          color: selectedDateTime.value == null
                              ? widget.hintStyle?.color ?? AppColors.greyColor
                              : null)),
                ),
              ),
              customWidth(2.w),
              SvgPicture.asset(AppAsset.calenderSvgIcon),
            ],
          )),
    );
  }
}
