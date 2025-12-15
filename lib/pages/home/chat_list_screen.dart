import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/common_appbar.dart';
import 'package:clinician_app/core/ui/common_divider.dart';
import 'package:clinician_app/pages/home/chat_screen.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  Color getColors(int inx) {
    switch (inx) {
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
            CommonDivider(color: Color(0xffDADADA)),
            Expanded(
              child: ListView.separated(
                itemCount: 6,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                separatorBuilder: (context, index) => customHeight(16.h),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => ChatScreen(isGroup: (index == 0 || index == 1)),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color: getColors(index),
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFA2A2A2).withValues(alpha: 0.2),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          customWidth(16.w),
                          Container(
                            width: 50.h,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              AppAsset.chatAvatarImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                          customWidth(10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  '42657845 John Scott PT',
                                  style: AppTextStyle.normal12style.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color:
                                        CommonMethods.getTextColorForBackground(
                                          getColors(index),
                                        ),
                                  ),
                                ),
                                Text(
                                  'Lorem Ipsum is simply dummy text Lorem Ipsum is simply....',
                                  style: AppTextStyle.normal10style.copyWith(
                                    fontSize: 8.sp,
                                    color:
                                        CommonMethods.getTextColorForBackground(
                                          getColors(index),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          customWidth(10.w),
                          Column(
                            children: [
                              Text(
                                '9:00 AM',
                                style: AppTextStyle.normal12style.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      CommonMethods.getTextColorForBackground(
                                        getColors(index),
                                      ),
                                ),
                              ),
                              customHeight(4.h),
                              Container(
                                height: 14.h,
                                width: 14.w,
                                decoration: BoxDecoration(
                                  color: Color(0x180EA5E9),
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '1',
                                  style: AppTextStyle.normal10style.copyWith(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff0369A1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          customWidth(16.w),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
