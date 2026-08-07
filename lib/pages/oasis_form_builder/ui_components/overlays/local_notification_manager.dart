import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';

class LocalNotificationManager {
  static showSuccessNotification(BuildContext context, String title,
      {String subtitle = ''}) {
    ElegantNotification.success(
      notificationMargin: 100,
      shadow: const BoxShadow(
        blurRadius: 10,
        spreadRadius: 0.1,
        offset: Offset(5, 5),
        color: Colors.black12
      ),
      position: Alignment.topRight,
      height: 100,
      width: MediaQuery.of(context).size.width/5<250?250:MediaQuery.of(context).size.width/5,
      title: Text(
        title,
        style: FormBuilderTextStyle.bold10Style.copyWith(color: Colors.black),
      ),
      description: Text(
        subtitle,
        style: FormBuilderTextStyle.normal10style,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ).show(context);
  }

  static showErrorNotification(BuildContext context, String title,
      {String subtitle = ''}) {
    ElegantNotification.error(
      notificationMargin: 100,
      shadow: const BoxShadow(
          blurRadius: 10,
          spreadRadius: 0.1,
          offset: Offset(5, 5),
          color: Colors.black12
      ),
      position: Alignment.topRight,
      height: 100,
      width: MediaQuery.of(context).size.width/5<250?250:MediaQuery.of(context).size.width/5,
      title: Text(
        title,
        style: FormBuilderTextStyle.bold10Style.copyWith(color: Colors.black),
      ),
      description: Text(
        subtitle,
        style: FormBuilderTextStyle.normal10style,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ).show(context);
  }
}
