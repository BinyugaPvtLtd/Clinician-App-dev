import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/pages/home/chat_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatFABWidget extends StatefulWidget {
  const ChatFABWidget({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<ChatFABWidget> createState() => _ChatFABWidgetState();
}

class _ChatFABWidgetState extends State<ChatFABWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          widget.onTap ??
          () {
            Get.to(() => ChatListScreen());
          },
      child: Container(
        width: 38.w,
        height: 38.h,
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(7.5),
        child: SvgPicture.asset(AppAsset.fabChatSvgIcon),
      ),
    );
  }
}
