import 'package:clinician_app/core/constant/app_colors.dart';
import 'package:clinician_app/core/constant/app_text_style.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryDropDown extends StatefulWidget {
  const PrimaryDropDown({
    super.key,
    this.value,
    this.items,
    this.selectedItemBuilder,
    this.dropdownStyleData,
    this.labelText,
    this.helperText,
    this.initialValue,
    this.errorMaxLines,
    this.maxLines,
    this.maxLength,
    this.enabled,
    this.autofocus = false,
    this.obscureText = false,
    this.filledColor,
    this.filled,
    this.cursorColor,
    this.borderColor,
    this.hoverColor,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.prefixText,
    this.prefixTextStyle,
    this.suffixIcon,
    this.enableSuffixIcon = false,
    this.isShowError = false,
    this.focusNode,
    this.style,
    this.hintStyle,
    this.floatingLabelStyle,
    this.labelStyle,
    this.controller,
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
    this.maxWidth,
    this.isMaxWidth = true,
    this.isLandLine = false,
    this.boxShadow,
    this.isCapital = false,
    this.hintText,
    this.isSearchable = false,
    this.iconStyleData,
    this.buttonStyleData,
    this.menuItemStyleData = const MenuItemStyleData(),
  });
  final String? value;
  final List<DropdownMenuItem<String>>? items;

  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final DropdownStyleData? dropdownStyleData;
  //
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? initialValue;
  final int? errorMaxLines;
  final int? maxLines;
  final int? maxLength;
  final double? borderRadius = 0;
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
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final BorderSide? border;
  final EdgeInsetsGeometry? contentPadding;
  final bool? readonly;
  final EdgeInsets? scrollPadding;
  final String? obscuringCharacter;
  final InputBorder? focusedBorder;
  final double? maxWidth;
  final bool isMaxWidth;
  final bool isLandLine;
  final bool isSearchable;
  final List<BoxShadow>? boxShadow;
  final bool isCapital;
  final IconStyleData? iconStyleData;
  final ButtonStyleData? buttonStyleData;
  final MenuItemStyleData menuItemStyleData;
  @override
  State<PrimaryDropDown> createState() => _PrimaryDropDownState();
}

class _PrimaryDropDownState extends State<PrimaryDropDown> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      dropdownSearchData:
          widget.isSearchable
              ? DropdownSearchData(
                searchController: searchController,
                searchMatchFn: (item, searchValue) {
                  return (item.value ?? "").toLowerCase().contains(searchValue);
                },
                searchInnerWidget: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: PrimaryTextField(
                    controller: searchController,
                    textInputAction: TextInputAction.done,
                    hintText: 'Search Here...',
                  ),
                ),
                searchInnerWidgetHeight: 40.h,
              )
              : null,
      value: (widget.value ?? '').isEmpty ? null : widget.value,
      isExpanded: true,
      items: widget.items,
      menuItemStyleData: widget.menuItemStyleData,
      buttonStyleData:
          widget.buttonStyleData ??
          ButtonStyleData(height: 40.h, width: double.maxFinite),
      hint: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.hintText ?? '--select--',
          style:
              widget.hintStyle ??
              AppTextStyle.normal10style.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.hintGrey,
              ),
        ),
      ),
      onChanged: widget.onChanged,
      iconStyleData:
          widget.iconStyleData ??
          const IconStyleData(icon: Icon(Icons.keyboard_arrow_down_rounded)),
      selectedItemBuilder: widget.selectedItemBuilder,
      alignment: Alignment.center,
      validator: widget.validator,
      decoration: InputDecoration(
        // errorStyle: const TextStyle(height: 0, fontSize: 0),
        // errorText: null,
        // errorMaxLines: 1,
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: widget.prefixIconConstraints,
        hoverColor: widget.hoverColor,
        prefixText: widget.prefixText,
        prefixStyle: widget.prefixTextStyle,
        isDense: true,

        contentPadding:
            widget.contentPadding ??
            (const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
        enabledBorder:
            widget.focusedBorder ??
            UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.textFieldBackGColor,
              ),
            ),
        floatingLabelStyle: widget.floatingLabelStyle,
        focusedBorder:
            widget.focusedBorder ??
            UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.textFieldBackGColor,
              ),
            ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: widget.filledColor ?? Colors.transparent,
            width: 0.0,
          ),
        ),
        border:
            widget.focusedBorder ??
            UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.textFieldBackGColor,
                width: 0.0,
              ),
            ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
        fillColor: widget.filledColor ?? AppColors.textFieldBackGColor,
        filled: widget.filled ?? true,
        // hintStyle: widget.hintStyle ??
        //     AppTextStyle.normal10style.copyWith(
        //         fontSize: 15.sp,
        //         fontWeight: FontWeight.w400,
        //         color: AppColors.hintGreyColor),
        // hintText: widget.hintText ?? "",
        enabled: widget.enabled ?? true,
        suffixIcon:
            widget.enableSuffixIcon
                ? widget.suffixIcon ?? const SizedBox.shrink()
                : null,
        labelStyle: widget.labelStyle,
        labelText: widget.labelText,
        helperText: widget.helperText,
      ),
      dropdownStyleData:
          widget.dropdownStyleData ??
          DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
          ),

      //This to clear the search value when you close the menu
      onMenuStateChange: (isOpen) {
        if (!isOpen) {
          searchController.clear();
        }
      },
    );
  }
}
