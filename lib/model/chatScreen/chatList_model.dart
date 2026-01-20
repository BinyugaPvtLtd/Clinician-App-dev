import 'dart:ui';

class ChatListItem {
  final bool isGroup;

  // Direct chat fields
  final int? partnerEmpId;
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? imgUrl;

  // Group chat fields
  final int? ptGroupId;
  final String? groupName;
  final String? groupDescription;
  final String? groupProfileUrl;
  final bool? isActive;
  final List<GroupMember>? groupMembers;

  // Common fields
  final int unseenMessageCount;
  final String? lastMessageText;
  final String? lastMessageTimestamp;

  ChatListItem({
    required this.isGroup,
    required this.unseenMessageCount,
    this.lastMessageText,
    this.lastMessageTimestamp,

    this.partnerEmpId,
    this.userId,
    this.firstName,
    this.lastName,
    this.imgUrl,

    this.ptGroupId,
    this.groupName,
    this.groupDescription,
    this.groupProfileUrl,
    this.isActive,
    this.groupMembers,
  });
}

class GroupMember {
  final int? memberId;
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? imgUrl;

  GroupMember({
    this.memberId,
    this.userId,
    this.firstName,
    this.lastName,
    this.imgUrl,
  });
}



class AbbrChipModel {
  final String abbr;
  final Color color;

  AbbrChipModel({required this.abbr, required this.color});
}