import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

class AppRadioButton<T> extends StatefulWidget {
  const AppRadioButton(
      {super.key,
      required this.value,
      required this.groupValue,
      this.onChanged,
      this.height,
      this.color});
  final T value;
  final T groupValue;
  final void Function(T? value)? onChanged;
  final double? height;
  final Color? color;

  @override
  State<AppRadioButton<T>> createState() => _AppRadioButtonState<T>();
}

class _AppRadioButtonState<T> extends State<AppRadioButton<T>> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      width: 15.w,
      child: Radio(
        value: widget.value,
        groupValue: widget.groupValue,
        activeColor: AppColors.textGreyColor,
        fillColor: WidgetStatePropertyAll(widget.value == widget.groupValue
            ? (widget.color ?? AppColors.textGreyColor)
            : AppColors.textGreyColor),
        onChanged: (value) {
          // liability.isChecked.value = index == 0 ? true : false;
          widget.onChanged?.call(value);
          // if (widget.onChanged != null) {
          //   widget.onChanged!(value);
          // }
        },
      ),
    );
  }
}
