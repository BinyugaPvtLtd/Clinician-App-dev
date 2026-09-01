import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField(
      {super.key,
      final Key? fieldKey,
      this.autovalidateMode,
      this.hintText,
      this.labelText,
      this.helperText,
      this.initialValue,
      this.errorMaxLines,
      this.maxLines,
      this.maxLength,
      this.enabled,
      this.filledColor,
      this.filled,
      this.borderRadius,
      this.cursorColor,
      this.borderColor,
      this.hoverColor,
      this.prefixIcon,
      this.prefixText,
      this.prefixTextStyle,
      this.suffixIcon,
      this.focusNode,
      this.style,
      this.hintStyle,
      this.floatingLabelStyle,
      this.labelStyle,
      this.controller,
      this.inputFormatters,
      this.textInputAction,
      this.keyboardType,
      this.onTap,
      this.onSaved,
      this.validator,
      this.onChanged,
      this.onFieldSubmitted,
      this.border,
      this.contentPadding,
      this.readonly,
      this.scrollPadding,
      this.obscuringCharacter,
      this.focusedBorder,
      this.obscureText = false,
      this.isShowError = false,
      this.textAlign = TextAlign.left,
      this.autofocus = false,
      this.enableSuffixIcon = true,
      this.textCapitalization = TextCapitalization.none,
      this.maxWidth,
      this.isMaxWidth = true,
      this.isLandLine = false,
      this.boxShadow,
      this.validationLength,
      this.prefixIconConstraints,
      this.isCapital = false,
      this.name,
      this.onTapOutside});
  final AutovalidateMode? autovalidateMode;
  final String? name;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? initialValue;
  final int? errorMaxLines;
  final int? maxLines;
  final int? maxLength;
  final double? borderRadius;
  final bool? enabled;
  final bool autofocus;
  final bool obscureText;
  final Color? filledColor;
  final bool? filled;
  final Color? cursorColor;
  final Color? borderColor;
  final Color? hoverColor;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final Widget? suffixIcon;
  final bool enableSuffixIcon;
  final bool isShowError;
  final FocusNode? focusNode;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? floatingLabelStyle;
  final TextStyle? labelStyle;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final GestureTapCallback? onTap;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final BorderSide? border;
  final EdgeInsetsGeometry? contentPadding;
  final bool? readonly;
  final EdgeInsets? scrollPadding;
  final String? obscuringCharacter;
  final InputBorder? focusedBorder;
  final double? maxWidth;
  final bool isMaxWidth;
  final bool isLandLine;
  final List<BoxShadow>? boxShadow;
  final bool isCapital;
  final void Function(PointerDownEvent)? onTapOutside;

  /// Validate Textfield after given number of length
  final int? validationLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 35,
      child: TextFormField(
        // name: name ?? '',
        scrollPadding: scrollPadding ?? EdgeInsets.zero,
        key: key,
        readOnly: readonly ?? false,
        controller: controller,
        focusNode: focusNode,
        maxLines: maxLines,
        initialValue: initialValue,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        obscureText: obscureText,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        enabled: enabled ?? true,
        validator: validator,
        maxLength: maxLength,
        textInputAction: textInputAction ?? TextInputAction.next,
        inputFormatters: [...inputFormatters ?? []],
        buildCounter: (context,
            {required currentLength, required isFocused, maxLength}) {
          return null;
        },
        onTap: onTap,
        onSaved: onSaved,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onTapOutside: onTapOutside,
        autocorrect: true,
        autofocus: autofocus,
        textAlign: textAlign,
        cursorColor: style?.color,
        cursorHeight: (style?.height ?? 20).h,
        obscuringCharacter: obscuringCharacter ?? "●",
        style: style ?? Theme.of(context).textTheme.labelMedium,
        decoration: InputDecoration(
          // errorStyle: const TextStyle(height: 0, fontSize: 0),
          // errorText: null,
          // errorMaxLines: 1,
          // label: Text(
          //   "",
          //   style: hintStyle,
          // ),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: prefixIcon,
          prefixIconConstraints: prefixIconConstraints,
          hoverColor: hoverColor,
          prefixText: prefixText,
          prefixStyle: prefixTextStyle,
          // constraints: BoxConstraints(
          //   maxWidth:
          //       MediaQuery.of(navigatorKey.currentContext!).size.width * 0.5,
          // ),
          isDense: true,
          contentPadding: contentPadding ??
              (const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),

          enabledBorder: focusedBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
                  borderSide: BorderSide(
                      color: AppColors.textFieldBorderColor, width: 1.w)),
          // floatingLabelStyle: floatingLabelStyle,
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
                  borderSide: BorderSide(
                      color: AppColors.textFieldBorderColor, width: 1.w)),
          border: focusedBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
                  borderSide: BorderSide(
                      color: AppColors.textFieldBorderColor, width: 1.w)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
              borderSide: const BorderSide(
                color: AppColors.redColor,
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
              borderSide: const BorderSide(
                  color: AppColors.textFieldBorderColor, width: 0)),
          fillColor: filledColor ?? Colors.white,
          filled: filled ?? true,
          hintStyle: hintStyle ??
              FormBuilderTextStyle.normal10style.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintGreyColor),
          hintText: hintText ?? "Enter Text",
          enabled: enabled ?? true,
          suffixIcon:
              enableSuffixIcon ? suffixIcon ?? const SizedBox.shrink() : null,
          labelStyle: labelStyle,
          labelText: labelText,
          helperText: helperText,
        ),
      ),
    );
  }
}
