import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/pages/home/chat_screen.dart';
import 'package:clinician_app/utils/common_methods.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          widget.chat.isSender ? Alignment.centerRight : Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!widget.chat.isSender && widget.isGroup) ...[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 30.w,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        AppAsset.chatAvatarImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                customWidth(12.w),
              ],
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  constraints: BoxConstraints(maxWidth: 262.w),
                  decoration: BoxDecoration(
                    color:
                        widget.chat.isSender
                            ? AppColors.chatPrimaryBlueColor
                            : !widget.isGroup
                            ? Color(0xffE8ECEF)
                            : AppColors.chatRedColor.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.only(
                      topLeft:
                          widget.chat.isSender
                              ? Radius.circular(6.r)
                              : Radius.zero,
                      topRight:
                          widget.chat.isSender
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
                            color: CommonMethods.getTextColorForBackground(
                              widget.chat.isSender
                                  ? AppColors.chatPrimaryBlueColor
                                  : AppColors.chatRedColor.withValues(
                                    alpha: 0.5,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      if (widget.chat.isSender)
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SvgPicture.asset(
                            AppAsset.readDoubleTickSvgIcon,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (!widget.chat.isSender) ...[
            customHeight(16.h),
            Text(
              '12:34 PM',
              style: AppTextStyle.normal10style.copyWith(
                fontSize: 8.sp,
                color: AppColors.defaultTxtGrey,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
