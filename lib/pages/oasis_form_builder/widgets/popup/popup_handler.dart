import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/overlays/local_notification_manager.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/overlays/popup_template.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/SelfCareHistoryPopup.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/edit_popup.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/musculoskeletal_popups.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/question_markup_popup.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/popup/textfield_popup.dart';

import '../../constants/form_key_string.dart';

class PopupHandler {
  static showPopup(BuildContext context, String popupCode,
      Function(String value) onPopupValue,
      {String title = ''}) {
    if (popupCode == FormkeyString.textFieldPopup) {
      showDialog(
        context: context,
        builder: (context) {
          return TextfieldPopup(
            popupValue: onPopupValue,
            title: title,
          );
        },
      );
    } else if (popupCode == FormkeyString.musculoskeletalStrength) {
      showDialog(
        context: context,
        builder: (context) {
          return MusculoskeletalStrengthPopup();
        },
      );
    } else if (popupCode == FormkeyString.musculoskeletalROMUpperBody) {
      showDialog(
        context: context,
        builder: (context) {
          return MusculoskeletalRomUpperBody();
        },
      );
    } else if (popupCode == FormkeyString.musculoskeletalROMLowerBody) {
      showDialog(
        context: context,
        builder: (context) {
          return MusculoskeletalRomLowerBody();
        },
      );
    } else if (popupCode == FormkeyString.staticSitting) {
      showDialog(
        context: context,
        builder: (context) {
          return MusculoskeletalSitting(
            sittingName: "Static Sitting",
          );
        },
      );
    } else if (popupCode == FormkeyString.dynamicSitting) {
      showDialog(
        context: context,
        builder: (context) {
          return MusculoskeletalSitting(
            sittingName: "Dynamic Sitting",
          );
        },
      );
    } else if (popupCode == FormkeyString.staticStanding) {
      showDialog(
        context: context,
        builder: (context) {
          return MusculoskeletalSitting(
            sittingName: "Static Standing",
          );
        },
      );
    } else if (popupCode == FormkeyString.dynamicStanding) {
      showDialog(
        context: context,
        builder: (context) {
          return MusculoskeletalSitting(
            sittingName: "Dynamic Standing",
          );
        },
      );
    } else if (popupCode == FormkeyString.editPopup) {
      showDialog(
        context: context,
        builder: (context) {
          return EditPopup(popupValue: onPopupValue, title: title);
        },
      );
    } else {
      LocalNotificationManager.showErrorNotification(
          context, 'Something Went Wrong!');
    }
  }

  static showQuestionCodePopup(BuildContext context, String questionCode) {
    showDialog(
      context: context,
      builder: (context) {
        return QuestionMarkupPopup(
          code: questionCode,
        );
      },
    );
  }

  static questionLookupDialogForSelfCare(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return PopupTemplate(
          maxHeight: 600.h,
          maxWidth: 900.w,
          body: [Padding(
            padding: const EdgeInsets.all(20),
            child: SelfCareHistoryPopup(),
          )],
          bottomButtons: null,
          title: 'Self Care',
        );
      },
    );
  }
}
