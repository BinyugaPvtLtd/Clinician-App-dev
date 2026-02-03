// ✅ Screen integrated with GetX (Obx) + API data

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/core/ui/common_divider.dart';
import 'package:clinician_app/pages/home/chat_screen.dart';
import 'package:clinician_app/services/token_manager/token_manager_service.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/chat_controller.dart';
import '../../controller/profile_controller.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
   ChatDataController controller = Get.put(ChatDataController());
   ProfileController profileController = Get.put(ProfileController());
  @override
  initState() {
    controller.startChatListListening(clinicianId: profileController.employeeIdByEmail.value.employeeId);
    super.initState();
  }
  @override
  void dispose() {
    controller.stopChatListListening();
    super.dispose();
  }
  Color getColors(int inx) {
    switch (inx % 2) {
      case 0:
        return AppColors.chatGreenColor.withValues(alpha: 0.8);
      case 1:
        return AppColors.chatBlueColor.withValues(alpha: 0.8);
      default:
        return Colors.white;
    }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppbar(label: 'Chats'),
            CommonDivider(color: const Color(0xffDADADA)),
            Expanded(
              child: Obx(() {
                if (controller.isLoadingChatList.value) {
                  return const Center(child: CircularProgressIndicator(color: AppColors.primaryAppColor,));
                }
                // if (controller.error.value.isNotEmpty) {
                //   return Center(
                //     child: Text(
                //       controller.error.value,
                //       style: AppTextStyle.normal12style,
                //     ),
                //   );
                // }

                if (controller.chatListItem.isEmpty) {
                  return const Center(child: Text("No chats found"));
                }

                return ListView.separated(
                  itemCount: controller.chatListItem.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  separatorBuilder: (context, index) => customHeight(16.h),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = controller.chatListItem[index];
                    final bg = getColors(index);

                    var title = item.isGroup
                        ? (item.groupName ?? '')
                        : TokenManager.getUserId() == item.userId ? "${item.firstName ?? ''} ${item.lastName ?? ''} (You)":  '${item.firstName ?? ''} ${item.lastName ?? ''}'.trim();

                    final avatarUrl =
                    item.isGroup ? item.groupProfileUrl : item.imgUrl;

                    return InkWell(
                      onTap: () {
                        Get.to(() => ChatScreen(
                          isYou: TokenManager.getUserId() == item.userId ? true : false,
                          userId: controller.userId.value,
                          isGroup: item.isGroup,
                          ptGroupId: item.ptGroupId,
                          otherEmpId: item.partnerEmpId,
                          title: title.isEmpty ? 'Chat' : title,
                          avatarUrl: (avatarUrl != null && avatarUrl.toString().trim().isNotEmpty)
                              ? avatarUrl
                              : "",));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          color: item.unseenMessageCount > 0 ? AppColors.chatBlueColor.withValues(alpha: 0.8) : Colors.white,
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border(
                            bottom: BorderSide(
                              color: const Color(0xFFA2A2A2).withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            customWidth(16.w),

                            // Avatar (network if available else placeholder)
                            Container(
                              width: 50.h,
                              height: 50.h,
                              decoration: const BoxDecoration(shape: BoxShape.circle),
                              clipBehavior: Clip.hardEdge,
                              child: (avatarUrl != null && avatarUrl.toString().isNotEmpty)
                                  ? Image.network(
                                avatarUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Image.asset(
                                  AppAsset.profilePicImg,
                                  fit: BoxFit.cover,
                                ),
                              )
                                  : Image.asset(
                                AppAsset.profilePicImg,
                                fit: BoxFit.cover,
                              ),
                            ),

                            customWidth(10.w),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    title.isEmpty ? 'Unknown' : title,
                                    style: AppTextStyle.normal12style.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.defaultTxtGrey,
                                    ),
                                  ),
                                  Text(
                                    (item.lastMessageText ?? '').isEmpty
                                        ? ' '
                                        : (item.lastMessageText ?? ''),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.normal10style.copyWith(
                                      fontSize: 8.sp,
                                      color: AppColors.defaultTxtGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            customWidth(10.w),

                            Column(
                              children: [
                                Text(
                                  item.lastMessageTimestamp!,
                                  style: AppTextStyle.normal12style.copyWith(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.defaultTxtGrey,
                                  ),
                                ),
                                customHeight(3.h),

                               item.unseenMessageCount > 0 ?
                                  Container(
                                    height: 12.h,
                                    width: 13.w,
                                    decoration: const BoxDecoration(
                                      color: Color(0x180EA5E9),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${item.unseenMessageCount}',
                                      style: AppTextStyle.normal10style.copyWith(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff0369A1),
                                      ),
                                    ),
                                  ) : SizedBox(height: 12.h,
                                 width: 14.w,),
                              ],
                            ),

                            customWidth(16.w),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
