import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/buttons/primary_button.dart';


class EditPopup extends StatelessWidget {
  final String title;
  final Function(String value) popupValue;

  EditPopup({super.key, required this.popupValue, required this.title});

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
          //padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          constraints: BoxConstraints(
              // maxHeight: 807.h,
              maxWidth: 600),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Edit",
                        style: FormBuilderTextStyle.bold10Style
                            .copyWith(color: Colors.white),
                      ),
                    ),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Html(
                  data: "<b>$title</b>",
                  style: FormBuilderTextStyle.htmlTextStyle(false),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  maxLines: 10,
                  minLines: 10,
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
                            color: AppColors.textFieldBorderColor, width: 1.w)),
                    // floatingLabelStyle: floatingLabelStyle,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: 1.w)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: 1.w)),
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
              SizedBox(
                height: 20,
              ),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  PrimaryButton(
                    onTap: () => Navigator.pop(context),
                    label: 'Close',
                    borderRadius: 10,
                    // width: 120.w,
                    // height: 35.h,
                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    buttonColor: Colors.white,
                  labelStyle: FormBuilderTextStyle.normal10style
                  .copyWith(fontWeight: FontWeight.w600, ),
                  ),
                  PrimaryButton(
                    onTap: () {
                      popupValue(controller.text.trim());
                      Navigator.pop(context);
                    },
                    label: 'Save',
                    borderRadius: 10,
                    // height: 35.h,
                    // width: 120.w,
                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                labelStyle: FormBuilderTextStyle.normal10style
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
