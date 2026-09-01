import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/buttons/primary_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/presentation/widgets/title_description.dart';



class TextfieldPopup extends StatelessWidget {
  final String title;
  final Function(String value) popupValue;

  TextfieldPopup({super.key, required this.popupValue, required this.title});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          constraints: const BoxConstraints(
              // maxHeight: 807.h,
              maxWidth: 450),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryAppLightColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 2, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TitleDescription(title: title),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  maxLines: 10,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  controller: controller,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),

                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: 1)),
                    // floatingLabelStyle: floatingLabelStyle,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: AppColors.redColor,
                        )),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                            color: AppColors.textFieldBorderColor, width: 0)),
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: FormBuilderTextStyle.normal10style.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.hintGreyColor),
                    hintText: "Enter Text",
                    enabled: true,
                  ),
                  style: FormBuilderTextStyle.normal10style,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  PrimaryButton(
                    onTap: () => Navigator.pop(context),
                    label: 'Cancel',
                    borderRadius: 5,
                    // width: 120.w,
                    // height: 35.h,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    buttonColor: Colors.white,
                    labelStyle: FormBuilderTextStyle.normal12style
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  PrimaryButton(
                    onTap: () {
                      popupValue(controller.text.trim());
                      Navigator.pop(context);
                    },
                    label: 'Save',
                    borderRadius: 5,
                    // height: 35.h,
                    // width: 120.w,
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    labelStyle: FormBuilderTextStyle.normal12style.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
