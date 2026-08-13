import '../../generate_options.dart';

class FormDataOccupationalTherapyMissedVisitNote {
  static Map<int, Map<String, dynamic>> drawerItems = {
    46: patientInformation,
    47: missedVisitInformation,
  };

  static Map<String, dynamic> patientInformation = {
    "template_name": "Occupational Therapy Missed Visit Note",
    "cols": 2,
    "title": "Patient Information",
    "formId": 26,
    "subFormId": 520,
    'questions': [
      {
        "question_type_id": 260520001,//0240516001,
        "dynamic_type": false,
        "type": "MIX",
        "title": "<b>Patient Name:</b>",
        "has_color": true,
        "question_type": "COMPREHENSIVE",
        "questions": [
          {
            'question_id': 1,
            "type": "TEXTFIELD",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(
              ['Last:', 'First:'],
              addToValues: false,
            ),
          },
          {
            'question_id': 2,
            "type": "TEXTFIELD",
            "options": generateOptions(
              [
                'Location Name:',
                'Location Address:',
                'City:',
                'State:',
                'Zip:',
                'Location Fax:',
                '<b>Physician Name:</b>',
                '<b>Physician Phone:</b>',
                '<b>Fax:</b>',
              ],
              addToValues: false,
            ),
          },
        ]
      },
      {
        "question_type_id": 260520002,//0240516002,
        "dynamic_type": false,
        "type": "MIX",
        "has_color": true,
        "question_type": "NON-COMPREHENSIVE",
        "questions": [
          {
            'question_id': 1,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>MR Number:</b>",
            "options": generateOptions(
              [""],
            ),
          },
          {
            'question_id': 2,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>DOB:</b>",
            "options": generateOptions([""]),
          },
          {
            'question_id': 3,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Location Number:</b>",
            "options": generateOptions(
              [""],
            ),
          },
          {
            'question_id': 4,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Location Phone:</b>",
            "options": generateOptions(
              [""],
            ),
          },
        ]
      },
      {
        "question_type_id": 260520003,//0240516003,
        "dynamic_type": false,
        "type": "TEXTFIELD",
        "has_color": true,
        "question_type": "NON-COMPREHENSIVE",
        "scroll_axis": "HORIZONTAL",
        "questions": [
          {
            'question_id': 1,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "<b>Physician Address:</b>",
              "City:",
              "State:",
              "Zip Code:",
            ], addToValues: false),
          },
        ],
      },
    ]
  };
  static Map<String, dynamic> missedVisitInformation = {
    "template_name": "Occupational Therapy Missed Visit Note",
    "cols": 1,
    "title": "Missed Visit Information",
    "formId": 26,
    "subFormId": 521,
    'questions': [
      {
        "question_type_id": 260521001,//0240517001,
        "dynamic_type": true,
        "has_color":true,
        "type": "CHECKBOX",
        "title": "<b>Reason for missed visit</b>",
        "question_type": "COMPREHENSIVE",
        "question_options": generateOptions([
          "Physician/clinic appointment (specify provider, type Of service planned)",
          "Caregiver/family available to assist patient this date",
          "Patient/ Representative refused care",
          "Dangerous weather Or other disaster making travel unsafe",
          "No answer to door/ phone",
          "Other",
        ], textFieldPopup: [
          0,
          5
        ]),
      },
      {
        "question_type_id": 260521002,//0240517002,
        "dynamic_type": true,
        "has_color":true,
        "type": "TEXTAREA",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Describe how patient's needs were met/hOw missed visit impacted Care:</b>",
        "question_options": generateOptions([""])
      },
      {
        "question_type_id": 260521003,//0240517003,
        "dynamic_type": true,
        "has_color":true,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Action taken</b>",
        "question_options": generateOptions([
          "Contacted authorized representative, caregiver, family, friends",
          "Rescheduled for later in week",
          "Contacted physician",
          "Other",
        ], textFieldPopup: [
          3
        ])
      },
      {
        "question_type_id": 260521004,//0240517004,
        "dynamic_type": false,
        "has_color":true,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Notification(s)</b>",
        "questions": [
          {
            "question_id": 1,
            "type": "DATE",
            "title": "Date of Notification:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "Time of notification:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "title": "Individuals notified:",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Clinical Manager",
              "Physician",
            ]),
          },
          {
            "question_id": 4,
            "type": "CHECKBOX",
            "title": "Method(s) of notification:",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Phone",
              "Fax",
              "Other",
            ], textFieldPopup: [
              2
            ]),
          },
        ]
      }
    ]
  };
}
