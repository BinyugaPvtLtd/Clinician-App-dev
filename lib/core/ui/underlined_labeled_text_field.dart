import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnderlinedLabeledTextField extends StatelessWidget {
  const UnderlinedLabeledTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.maxLines,
  });
  final TextEditingController? controller;
  final String hintText;
  final int? maxLength;
  final int? maxLines;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return PrimaryTextField(
      labelText: hintText,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      filledColor: Colors.white,
      labelStyle: AppTextStyle.normal10style.copyWith(
        fontWeight: FontWeight.w300,
        color: AppColors.iconGreyColor,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.iconGreyColor.withValues(alpha: 0.25),
        ),
      ),
    );
  }
}
