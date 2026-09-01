import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox(
      {super.key,
      required this.value,
      this.onChanged,
      this.height,
      this.color,
      this.name});
  final bool value;
  final void Function(bool value)? onChanged;
  final double? height;
  final String? name;
  final Color? color;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      height: widget.height ?? 25.h,
      width: 25.w,
      child:
          //  Theme(
          //   data: Theme.of(context).copyWith(
          //       checkboxTheme: CheckboxThemeData(
          //     side: BorderSide(color: AppColors.checkBoxBlueColor, width: 1.5.w),
          //     shape: ContinuousRectangleBorder(
          //       borderRadius: BorderRadius.circular(5.r),
          //     ),
          //   )),
          //   child: FormBuilderCheckbox(
          //       activeColor: widget.color ?? AppColors.checkBoxBlueColor,
          //       controlAffinity: ListTileControlAffinity.platform,
          //       name: widget.name ?? "",
          //       title: const Text(
          //         '',
          //         style: TextStyle(height: 0),
          //       )),
          // )

          Checkbox(
        value: widget.value,
        activeColor: widget.color ?? AppColors.checkBoxBlueColor,
        focusColor: widget.color ?? AppColors.checkBoxBlueColor,
        side: BorderSide(color: AppColors.checkBoxBlueColor, width: 1.5.w),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value ?? false);
          }
        },
      ),
    );
  }
}
