import 'package:clinician_app/core/constant/app_asset.dart';
import 'package:clinician_app/model/icon_with_label.dart';
import 'package:clinician_app/model/request/request_data_model.dart';

class ListContent {
  static List<IconWithLabel> homeBottomBarList = [
    IconWithLabel(iconPath: AppAsset.requestSvgIcon, label: 'Request'),
    IconWithLabel(iconPath: AppAsset.calenderSvgIcon, label: 'Calender'),
    IconWithLabel(iconPath: AppAsset.liveLocationSvgIcon, label: 'Live'),
    IconWithLabel(iconPath: AppAsset.timeSheetSvgIcon, label: 'TimeSheet'),
    IconWithLabel(iconPath: AppAsset.profileSvgIcon, label: 'Profile'),
  ];

  static List<RequestDataModel> requestDataList = [
    RequestDataModel(
      status: 'Pending',
      dateTime: DateTime.now(),
      statusTxt: '',
      zone: ZoneType.warning,
      noteTxt: '⚠ Schedule Conflict: You have an existing visit at this time.',
    ),

    RequestDataModel(
      status: 'Pending',
      dateTime: DateTime.now().copyWith(day: 15),
      statusTxt: '',
      zone: ZoneType.inZone,
      noteTxt: '',
    ),
    RequestDataModel(
      status: 'Pending',
      dateTime: DateTime.now().copyWith(day: 15),
      statusTxt: '',
      zone: ZoneType.outOfZone,
      noteTxt: '📝 Note: Unconfirmed Request on this Time Slot',
    ),
    RequestDataModel(
      status: 'Accepted',
      dateTime: DateTime.now().copyWith(day: 15),
      statusTxt: 'Acceptd on 10:30 AM , 21 December 2024',
      zone: ZoneType.inZone,
    ),
    RequestDataModel(
      status: 'Rejected',
      dateTime: DateTime.now().copyWith(day: 15),
      statusTxt: 'Rejected on 10:30 AM , 21 December 2024',
      zone: ZoneType.inZone,
    ),
    RequestDataModel(
      status: 'Rescheduled',
      dateTime: DateTime.now().copyWith(day: 15),
      statusTxt: 'Rescheduled on 10:30 AM , 21 December 2024',
      zone: ZoneType.inZone,
    ),
    RequestDataModel(
      status: 'Rescheduled',
      dateTime: DateTime.now().copyWith(day: 15),
      statusTxt:
          'Pending to reschedule. Request has been generated on 10:30 AM , 21 December 2024',
      zone: ZoneType.inZone,
    ),
    RequestDataModel(
      status: 'Completed',
      dateTime: DateTime.now().copyWith(day: 15),
      statusTxt: 'Rescheduled on 10:30 AM , 21 December 2024',
      zone: ZoneType.inZone,
    ),
    RequestDataModel(
      status: 'Rescheduled',
      dateTime: DateTime.now().copyWith(day: 15),
      statusTxt:
          'Pending to reschedule. Request has been generated on 10:30 AM , 21 December 2024',
      zone: ZoneType.inZone,
    ),
  ];
}
