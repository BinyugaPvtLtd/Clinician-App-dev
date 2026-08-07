import 'package:flutter_svg/flutter_svg.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class PrimaryDropDown extends StatefulWidget {
  const PrimaryDropDown(
      {super.key,
        this.name,
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
        this.isSearchable = true,
        this.iconStyleData,
        this.buttonStyleData,
        this.customButton,
        this.dropDownWidth});
  final String? value;
  final List<DropdownMenuItem<String>>? items;

  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final DropdownStyleData? dropdownStyleData;
  //
  final String? name;
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
  final Widget? customButton;
  final double? dropDownWidth;
  @override
  State<PrimaryDropDown> createState() => _PrimaryDropDownState();
}

class _PrimaryDropDownState extends State<PrimaryDropDown>
    with WidgetsBindingObserver {
  final textEditingController = TextEditingController();
  final key = GlobalKey<DropdownButton2State>();
  final node = FocusNode();

  // Tracks the last known keyboard inset so we can distinguish an actual
  // screen-size/orientation change from the keyboard opening/closing.
  double _lastBottomInset = 0;

  @override
  void initState() {
    super.initState();
    // Registers this State to receive app-wide metric change callbacks
    // (screen size, orientation, keyboard, etc.) — this is the mobile-safe
    // replacement for `html.window.addEventListener("resize", ...)`.
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    textEditingController.dispose();
    node.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    if (!mounted) return;

    final view = View.of(context);
    final currentBottomInset =
        view.viewInsets.bottom / view.devicePixelRatio;

    // Ignore changes purely caused by the on-screen keyboard opening/closing,
    // so we only react to genuine resize/orientation events (matching the
    // original web "browser resize" intent).
    final keyboardChanged = currentBottomInset != _lastBottomInset;
    _lastBottomInset = currentBottomInset;
    if (keyboardChanged) return;

    // Defer to after the current frame/build to safely use context.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final modalRoute = ModalRoute.of(context);
      if (modalRoute == null || modalRoute.isCurrent) return;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return SizedBox(
        child: DropdownButtonFormField2<String>(
          dropdownButtonKey: key,
          // value: widget.name ?? "",
          value: (widget.value ?? '').isEmpty ? null : widget.value,
          customButton: widget.customButton,
          isExpanded: true,
          items: widget.items ?? [],
          focusNode: node,
          buttonStyleData: widget.buttonStyleData ??
              ButtonStyleData(
                  height: 30.h,
                  padding: widget.contentPadding ??
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h)),

          hint: Text(widget.hintText ?? '(Select)',
              style: widget.hintStyle ??
                  FormBuilderTextStyle.normal10style.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.hintGreyColor)),
          onChanged: widget.onChanged,
          iconStyleData: widget.iconStyleData ??
              IconStyleData(
                  icon: SvgPicture.asset(
                    AppAsset.dropDownMenuSvgIcon,
                    width: 10.w,
                  ),
                  iconSize: 20),
          selectedItemBuilder: widget.selectedItemBuilder,
          // alignment: Alignment.center,
          decoration: InputDecoration(
            // errorStyle: const TextStyle(height: 0, fontSize: 0),
            // errorText: null,
            // errorMaxLines: 1,
            constraints:
            BoxConstraints(maxWidth: widget.maxWidth ?? double.maxFinite),
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: widget.prefixIconConstraints,
            hoverColor: widget.hoverColor,
            prefixText: widget.prefixText,
            prefixStyle: widget.prefixTextStyle,
            contentPadding: widget.contentPadding ??
                (EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h)),
            enabledBorder: widget.focusedBorder ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: AppColors.textFieldBorderColor,
                        width: 1.w)),
            floatingLabelStyle: widget.floatingLabelStyle,
            focusedBorder: widget.focusedBorder ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: AppColors.textFieldBorderColor,
                        width: 1.w)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: widget.filledColor ?? Colors.transparent,
                    width: 0.0)),
            border: widget.focusedBorder ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: AppColors.textFieldBorderColor,
                        width: 1.w)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: const BorderSide(
                  color: AppColors.redColor,
                )),

            fillColor: widget.filledColor ?? Colors.white,
            filled: widget.filled ?? true,
            // hintStyle: widget.hintStyle ??
            //     AppTextStyle.normal10style.copyWith(
            //         fontSize: 15.sp,
            //         fontWeight: FontWeight.w400,
            //         color: AppColors.hintGreyColor),
            // hintText: widget.hintText ?? "",
            enabled: widget.enabled ?? true,
            suffixIcon: widget.enableSuffixIcon
                ? widget.suffixIcon ?? const SizedBox.shrink()
                : null,
            labelStyle: widget.labelStyle,
            labelText: widget.labelText,
            helperText: widget.helperText,
          ),
          // dropdownStyleData: widget.dropdownStyleData ??
          //     DropdownStyleData(
          //         width: widget.dropDownWidth,
          //         // padding: EdgeInsets.symmetric(horizontal: 70.w),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(5.r),
          //             color: Colors.white)),

          // //This to clear the search value when you close the menu
          // onMenuStateChange: (isOpen) {
          //   if (widget.onTap != null) {
          //     widget.onTap!();
          //   }
          //   if (!isOpen) {
          //     textEditingController.clear();
          //   }
          // },
        ),
      );
    });
  }
}