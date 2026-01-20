// ===========================
// chat_element_widget.dart (UPDATED)
// ===========================
//
// ✅ Works for BOTH group + emp chat API
// ✅ Uses ChatModel.time for showing time (instead of hardcoded "12:34 PM")
// ✅ Shows sender avatar in group chat when message is not mine
// ✅ Shows sender name (optional) when group chat
//
// NOTE: You must update ChatModel to include optional senderName + senderAvatarUrl
// (I included that change below)

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/pages/home/chat_screen.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

// ===========================
// Update ChatModel in chat_screen.dart like this:
// ===========================
//


class ChatElementWidget extends StatefulWidget {
  const ChatElementWidget({
    super.key,
    required this.isGroup,
    required this.chat,
  });

  final bool isGroup;
  final ChatModel chat;

  @override
  State<ChatElementWidget> createState() => _ChatElementWidgetState();
}

class _ChatElementWidgetState extends State<ChatElementWidget> {
  String _formatTime(DateTime dt) {
    return DateFormat('h:mm a').format(dt.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.chat.isSender
        ? AppColors.chatPrimaryBlueColor
        : (!widget.isGroup
        ? const Color(0xffE8ECEF)
        : AppColors.chatRedColor.withValues(alpha: 0.5));

    final txtColor = CommonMethods.getTextColorForBackground(bgColor);

    return Container(
      alignment:
      widget.chat.isSender ? Alignment.centerRight : Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: widget.chat.isSender
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ show avatar only for group chat + received messages
              if (!widget.chat.isSender && widget.isGroup) ...[
                Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  clipBehavior: Clip.hardEdge,
                  child: (widget.chat.senderAvatarUrl != null &&
                      widget.chat.senderAvatarUrl!.trim().isNotEmpty)
                      ? Image.network(
                    widget.chat.senderAvatarUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Image.asset(
                      AppAsset.chatAvatarImg,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Image.asset(
                    AppAsset.chatAvatarImg,
                    fit: BoxFit.cover,
                  ),
                ),
                customWidth(12.w),
              ],

              Flexible(
                child: Column(
                  crossAxisAlignment: widget.chat.isSender
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    // ✅ sender name for group chat (received msg)
                    if (!widget.chat.isSender &&
                        widget.isGroup &&
                        (widget.chat.senderName ?? '').trim().isNotEmpty) ...[
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Text(
                          widget.chat.senderName!,
                          style: AppTextStyle.normal10style.copyWith(
                            fontSize: 8.sp,
                            color: AppColors.defaultTxtGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      constraints: BoxConstraints(maxWidth: 262.w),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: widget.chat.isSender
                              ? Radius.circular(6.r)
                              : Radius.zero,
                          topRight: widget.chat.isSender
                              ? Radius.zero
                              : Radius.circular(6.r),
                          bottomLeft: Radius.circular(6.r),
                          bottomRight: Radius.circular(6.r),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              widget.chat.msg,
                              style: AppTextStyle.normal10style.copyWith(
                                color: txtColor,
                              ),
                            ),
                          ),
                          if (widget.chat.isSender)
                            Padding(
                              padding: EdgeInsets.only(left: 6.w),
                              child: SvgPicture.asset(
                                AppAsset.readDoubleTickSvgIcon,
                              ),
                            ),
                        ],
                      ),
                    ),

                    // ✅ time below bubble for both sender/receiver
                    Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: Text(
                        _formatTime(widget.chat.time),
                        style: AppTextStyle.normal10style.copyWith(
                          fontSize: 8.sp,
                          color: AppColors.defaultTxtGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
