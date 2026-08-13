import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/buttons/vertical_icon_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/manual_signature_popup.dart';

import '../../constants/responsive.dart';

class SignatureUploadPopup extends StatelessWidget {
  const SignatureUploadPopup(
      {super.key,
      this.onManualSignTap,
      this.onTakePhotoTap,
      this.onsignSaveAction,
      this.onUploadFileTap});
  final void Function()? onManualSignTap;
  final void Function()? onTakePhotoTap;
  final void Function(Uint8List image)? onsignSaveAction;
  final void Function()? onUploadFileTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          padding: EdgeInsets.fromLTRB(
              Responsive.isMobile(context) ? 20 : 73,
              Responsive.isMobile(context) ? 20 : 44,
              Responsive.isMobile(context) ? 20 : 73,
              Responsive.isMobile(context) ? 20 : 44),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          child: SizedBox(
            height: 100,
            child: ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return customWidth(Responsive.isMobile(context) ? 10 : 59);
              },
              itemBuilder: (context, index) {
                var list = ['Manual Signature', 'Take a Photo', 'Upload File'];
                var iconList = [
                  AppAsset.manaulSignatureSvgIcon,
                  AppAsset.cameraSvgIcon,
                  AppAsset.uploadSvgIcon
                ];
                return VerticalIconButton(
                  width: Responsive.isMobile(context) ? 85 : 166,
                  height: Responsive.isMobile(context) ? 48 : 150,
                  onTap: () {
                    switch (index) {
                      case 0:
                        showDialog(
                          context: context,
                          builder: (context) => ManualSignaturePopup(
                            onsignSaveAction: (image) =>
                                onsignSaveAction!(image),
                          ),
                        );
                        onManualSignTap?.call();
                        break;
                      case 1:
                        onTakePhotoTap?.call();
                        break;
                      case 2:
                        onUploadFileTap?.call();
                        break;
                    }
                  },
                  icon: SvgPicture.asset(
                    iconList[index],
                    colorFilter: const ColorFilter.mode(
                        AppColors.textGreyColor, BlendMode.srcIn),
                  ),
                  labelStyle: FormBuilderTextStyle.regular16style
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  label: list[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
