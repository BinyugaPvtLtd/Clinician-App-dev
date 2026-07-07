// ignore_for_file: invalid_use_of_protected_member

import 'package:clinician_app/controller/home_controller.dart';
import 'package:clinician_app/controller/visit_controller.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';
import 'package:clinician_app/core/ui/buttons/primary_outlined_button.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/core/ui/primary_textfield.dart';
import 'package:clinician_app/pages/home/widget/chat_fab_widget.dart';
import 'package:clinician_app/pages/profile/widgets/add_doc_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/update_documents_controller.dart';

class DocumnetPage extends StatefulWidget {
  final int empId;
  const DocumnetPage({super.key, required this.empId});

  @override
  State<DocumnetPage> createState() => _DocumnetPageState();
}

class _DocumnetPageState extends State<DocumnetPage>
    with SingleTickerProviderStateMixin {
  VisitController visitController = Get.put(VisitController());

  final homeController = Get.find<HomeController>();
  RxInt selectedIndex = 0.obs;
  final UpdateDocumentsController updateController = Get.put(UpdateDocumentsController());
  @override
  void initState() {
    updateController.fetchDocListDetails(empId: widget.empId, approveOnly: 'no', searchText: 'all');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: ChatFABWidget(),
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
            child: Column(
              children: [
                // ------ header -------
                CommonAppbar(
                  label: "Document Update",
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 15.h,
                    bottom: 8.h,
                  ),
                ),
                Divider(),
                customHeight(18.h),

                // --------- search and dropdown ----------
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 30.h,
                          child: PrimaryTextField(
                            onChanged: (value){
                              if (value.trim().isEmpty) {
                                updateController.fetchDocListDetails(empId: widget.empId, approveOnly: 'no', searchText: 'all');
                              } else {
                                updateController.fetchDocListDetails(empId: widget.empId, approveOnly: 'no', searchText: value.trim());
                              }
                            },
                            borderRadius: 6,
                            hintText: 'Search',
                            filledColor: Color(0xffE9E9E9),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(AppAsset.searchSvgIcon),
                            ),
                          ),
                        ),
                      ),
                      customWidth(8.w),
                      PrimaryOutlinedButton(
                        spaceBetweenIconText: 2,
                        text: "Add New",
                        onPressed: () {
                          showAddDocumentDialog(context,widget.empId);
                        },
                        textStyle: AppTextStyle.normal12style.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryAppColor,
                        ),

                        width: 100.w,
                        radius: 6,
                        height: 30.h,
                        icon: Icon(Icons.add, color: AppColors.primaryAppColor),
                      ),
                    ],
                  ),
                ),
                customHeight(17.h),
                Container(
                  height: 40.h,
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Text(
                          "Licensure & Certifications",
                          style: AppTextStyle.normal12style.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Expiry date",
                          style: AppTextStyle.normal12style.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  if (updateController.isDocListLoading.value) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryAppColor,
                        ),
                      ),
                    );
                  }

                  final items = updateController.documentResponseModel.value.document;
                  if (items.isEmpty) {
                    return const Expanded(
                      child: Center(child: Text("No Document Found!")),
                    );
                  }
                 return Expanded(
                   child: ListView.separated(
                     padding: EdgeInsets.symmetric(
                       vertical: 10.h,
                       horizontal: 20.w,
                     ),
                     separatorBuilder: (context, index) {
                       return Divider();
                     },
                     itemCount: updateController.documentResponseModel.value.document.length,
                     itemBuilder: (context, index) {
                       var docItem = updateController.documentResponseModel.value.document[index];
                       return Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           customHeight(20.h),
                           Text(
                             docItem.docName,
                             style: AppTextStyle.bold12style,
                           ),
                           customHeight(6.h),
                           Row(
                             children: [
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                      ...List.generate(docItem.docList.length,
                                         (index)=>docItem.docList.isEmpty ? Center(child: Text("No Document Found!")) : Column(
                                           children: [
                                             Row(
                                               crossAxisAlignment:
                                               CrossAxisAlignment.center,
                                               children: [
                                                 Icon(
                                                   Icons.file_copy_outlined,
                                                   size: 12,
                                                   color: AppColors.defaultTxtGrey,
                                                 ),
                                                 customWidth(5.w),
                                                 Expanded(
                                                   child: Text(
                                                     docItem.docList[index].documentName,
                                                     style: AppTextStyle.normal12style
                                                         .copyWith(
                                                       color: AppColors.grey,
                                                       fontWeight: FontWeight.w400,
                                                     ),
                                                     maxLines: 1,
                                                     overflow: TextOverflow.ellipsis,
                                                   ),
                                                 ),
                                                 SizedBox(width: 8),
                                                 Text(
                                                   docItem.docList[index].expiryDate,
                                                   style: AppTextStyle.normal12style
                                                       .copyWith(
                                                     color: docItem.docList[index].docStatus == "Active" ? AppColors.grey : AppColors.redBackGColor,
                                                     fontWeight: FontWeight.w400,
                                                   ),
                                                 ),
                                               ],
                                             ),
                                             docItem.docList[index].docStatus == "Active" ?customHeight(0.h) :customHeight(8.h),
                                             docItem.docList[index].docStatus == "Active" ?Offstage() : Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                 PrimaryButton(
                                                   label: "Update",
                                                   buttonColor:
                                                   AppColors.primaryLightBackGColor,
                                                   labelStyle: AppTextStyle
                                                       .regular10style
                                                       .copyWith(
                                                     color:
                                                     AppColors.primaryAppColor,
                                                   ),
                                                   padding: EdgeInsets.zero,
                                                   height: 25.h,
                                                   width: 50.w,
                                                   borderRadius: 4,
                                                 ),
                                               ],
                                             ),
                                             docItem.docList[index].docStatus == "Active" ?customHeight(0.h) : customHeight(10.h),
                                           ],
                                         ),),
                                     // customHeight(8.h),
                                     // Row(
                                     //   crossAxisAlignment:
                                     //   CrossAxisAlignment.center,
                                     //   children: [
                                     //     Icon(
                                     //       Icons.file_copy_outlined,
                                     //       size: 12,
                                     //       color: AppColors.defaultTxtGrey,
                                     //     ),
                                     //     customWidth(5.w),
                                     //     Expanded(
                                     //       child: Text(
                                     //         "National Provider Identifier (NPI)",
                                     //         style: AppTextStyle.normal12style
                                     //             .copyWith(
                                     //           color: AppColors.grey,
                                     //           fontWeight: FontWeight.w400,
                                     //         ),
                                     //         maxLines: 2,
                                     //         overflow: TextOverflow.ellipsis,
                                     //       ),
                                     //     ),
                                     //     SizedBox(width: 8),
                                     //     Text(
                                     //       "05/13/2025",
                                     //       style: AppTextStyle.normal12style
                                     //           .copyWith(
                                     //         color: AppColors.grey,
                                     //         fontWeight: FontWeight.w400,
                                     //       ),
                                     //     ),
                                     //   ],
                                     // ),
                                     // customHeight(8.h),
                                     // Row(
                                     //   crossAxisAlignment:
                                     //   CrossAxisAlignment.center,
                                     //   children: [
                                     //     Icon(
                                     //       Icons.file_copy_outlined,
                                     //       size: 12,
                                     //       color: AppColors.defaultTxtGrey,
                                     //     ),
                                     //     customWidth(5.w),
                                     //     Expanded(
                                     //       child: Text(
                                     //         "Board Certification",
                                     //         style: AppTextStyle.normal12style
                                     //             .copyWith(
                                     //           color: AppColors.grey,
                                     //           fontWeight: FontWeight.w400,
                                     //         ),
                                     //         maxLines: 2,
                                     //         overflow: TextOverflow.ellipsis,
                                     //       ),
                                     //     ),
                                     //     SizedBox(width: 8),
                                     //     Text(
                                     //       "05/13/2025",
                                     //       style: AppTextStyle.normal12style
                                     //           .copyWith(
                                     //         color: AppColors.redBackGColor,
                                     //         fontWeight: FontWeight.w400,
                                     //       ),
                                     //     ),
                                     //   ],
                                     // ),



                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ],
                       );
                     },
                   ),
                 );
                }
                ),
              ],
            ),
          ),

      ),
    );
  }
}
