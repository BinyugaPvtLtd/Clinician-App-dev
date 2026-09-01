import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/buttons/primary_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/buttons/primary_outlined_button.dart';

import 'package:signature/signature.dart';

import '../../constants/responsive.dart';

class ManualSignaturePopup extends StatefulWidget {
  final void Function(Uint8List image)? onsignSaveAction;
  const ManualSignaturePopup({super.key, this.onsignSaveAction});

  @override
  State<ManualSignaturePopup> createState() => _ManualSignaturePopupState();
}

class _ManualSignaturePopupState extends State<ManualSignaturePopup> {
  final SignatureController sigController = SignatureController(
    penStrokeWidth: 5,
    exportBackgroundColor: Colors.transparent,
  );

  @override
  void initState() {
    super.initState();
//     var _signatureCanvas = Signature(
//       controller: sigController,
//       width: 300,
//       height: 300,
//       backgroundColor: Colors.lightBlueAccent,
//     );
//     sigController.clear();

// // EXPORT BYTES AS PNG
// // The exported image will be limited to the drawn area
    sigController.toPngBytes();
  }

  @override
  void dispose() {
    super.dispose();
    sigController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: Responsive.isMobile(context)
              ? EdgeInsets.symmetric(horizontal: 30)
              : null,
          constraints: BoxConstraints(
              // maxHeight: 807.h,
              maxWidth: 550.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                decoration:
                    const BoxDecoration(color: AppColors.primaryAppLightColor),
                child: Row(
                  children: [
                    Text(
                      'Clinician Signature',
                      style: FormBuilderTextStyle.normal12style.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                    // const Spacer(),
                    // InkWell(
                    //     onTap: () {
                    //       Navigator.of(context).pop();
                    //     },
                    //     child: SvgPicture.asset(
                    //       AppAsset.closeSvgIcon,
                    //       colorFilter: const ColorFilter.mode(
                    //           AppColors.textGreyColor, BlendMode.srcIn),
                    //     )),
                  ],
                ),
              ),
              customHeight(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAsset.reloadSvgIcon),
                  customWidth(10.w),
                  Text(
                    'Uploading signature...',
                    style: FormBuilderTextStyle.normal12style.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryAppLightColor),
                  )
                ],
              ),
              Flexible(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    customHeight(30),
                    SizedBox(
                        // width: 400.w,
                        child: Signature(
                      controller: sigController,
                      width: 300,
                      height: 200,
                      backgroundColor: Colors.transparent,
                    )),
                    customHeight(36),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.undo),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() => sigController.undo());
                          },
                          tooltip: 'Undo',
                        ),
                        IconButton(
                          icon: const Icon(Icons.redo),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() => sigController.redo());
                          },
                          tooltip: 'Redo',
                        ),
                        //CLEAR CANVAS
                        IconButton(
                          key: const Key('clear'),
                          icon: const Icon(Icons.clear),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() => sigController.clear());
                          },
                          tooltip: 'Clear',
                        ),
                      ],
                    ),
                    customHeight(36),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryOutlinedButton(
                          width: 100,
                          height: 40,
                          text: 'Cancel',
                          radius: 12,

                          // padding: EdgeInsets.symmetric(
                          //     horizontal: 10.w, vertical: 5.h),

                          // buttonColor: Colors.white,
                          textStyle:
                              FormBuilderTextStyle.normal10style.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        ),
                        customWidth(21),
                        PrimaryButton(
                          label: 'Save',
                          borderRadius: 8,
                          onTap: () => onsignSaveButtonAction(),
                          height: 40,
                          width: Responsive.isMobile(context) ? 100 : 160,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 11),
                          labelStyle: FormBuilderTextStyle.normal10style
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                        ),
                        customWidth(Responsive.isMobile(context) ? 20:50),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onsignSaveButtonAction() async {
    try {
      if (sigController.isNotEmpty) {
        // Convert signature to PNG bytes
        final Uint8List? data = await sigController.toPngBytes();
        widget.onsignSaveAction!(data!);

        // if (data != null) {
        //   try {
        //     // ---- Upload to API ----
        //     final request = http.MultipartRequest(
        //       'POST',
        //       Uri.parse("https://your-api.com/upload-signature"),
        //     );
        //     request.files.add(
        //       http.MultipartFile.fromBytes(
        //         'file',
        //         data,
        //         filename: "signature.png",
        //         contentType: MediaType('image', 'png'),
        //       ),
        //     );

        //     final response = await request.send();

        //     if (response.statusCode == 200) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text("Signature uploaded successfully")),
        //       );

        //       // Close dialogs
        //       Navigator.pop(context);
        //       Navigator.pop(context);
        //     } else {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(content: Text("Upload failed: ${response.statusCode}")),
        //       );
        //     }
        //   } catch (e) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text("Error uploading: $e")),
        //     );
        //   }
        // }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please sign before saving")),
        );
      }
    } catch (e) {}
  }
}
