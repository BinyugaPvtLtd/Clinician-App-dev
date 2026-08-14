import '../../generate_options.dart';

class FormDataPatientIncidentReport {
  static Map<int, Map<String, dynamic>> drawerItems = {
    64: employeeRelatedIncidents,
    65: notifications,
    66: administrativeFollowup,
  };
  static Map<String, dynamic> employeeRelatedIncidents = {
    "template_name": "Patient Incident Report",
    "cols": 2,
    "title": "Patient-Related Incident",
    "formId": 68,
    "subFormId": 1118,
    "questions": [
      {
        'question_type_id': 681118001, //691121001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "title": "<b>Patient Name:</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(["Injury"]),
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(["Fall"]),
          },{
            "question_id": 4,
            "type": "RADIO",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(["Witnessed","Unwitnessed"]),
          },
          {
            "question_id": 5,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "Medication Error",
              "Suspected Abuse",
              "Potential Communicable Disease",
              "Adverse/Allergic Drug Reaction",
              "Pharmacy/ Equipment/ Delivery Error",
              "Venous Access Infection/Sepsis",
              "Other",
            ], textFieldPopup: [
              6
            ]),
          },
        ],
      },
      {
        'question_type_id': 681118002, //691121002,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "DATETIME",
            "title": "<b>Incident Date/Time:</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
          {
            "question_id": 2,
            "type": "DATE",
            "title": "<b>Date Reported:</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
        ],
      },
      {
        'question_type_id': 681118003, //691121003,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Description of Incident/Occurence</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
      {
        'question_type_id': 681118004, //691121004,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Actions Taken:</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
    ]
  };
  static Map<String, dynamic> notifications = {
    "template_name": "Patient Incident Report",
    "cols": 2,
    "title": "Notifications",
    "formId": 68,
    "subFormId": 1119,
    "questions": [
      {
        'question_type_id': 681119001, //691122001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Notifications</b>",
        "group_options": false,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "options": generateOptions([""])
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "Name of Physician Notified:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              [""],
            ),
          },
          {
            "question_id": 3,
            "type": "DATETIME",
            "title": "Date/Time Notified:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
          {
            "question_id": 4,
            "type": "CHECKBOX",
            "options": generateOptions([""])
          },
          {
            "question_id": 5,
            "type": "TEXTFIELD",
            "title": "Family/Caregiver Name Notified:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              [""],
            ),
          },
          {
            "question_id": 6,
            "type": "DATETIME",
            "title": "Date/Time Notified:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
          {
            "question_id": 7,
            "type": "CHECKBOX",
            "options": generateOptions([""])
          },
          {
            "question_id": 8,
            "type": "TEXTFIELD",
            "title": "Administrative Manager Name:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              [""],
            ),
          },
          {
            "question_id": 9,
            "type": "DATETIME",
            "title": "Date/Time Notified:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
        ]
      },
      {
        'question_type_id': 681119002, //691122002,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Supervisor Must Always Be Notified</b>",
        "group_options": false,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "options": generateOptions([""])
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "Name Person Filing Report:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              [""],
            ),
          },
          {
            "question_id": 3,
            "type": "DATE",
            "title": "Date:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
          {
            "question_id": 4,
            "type": "CHECKBOX",
            "options": generateOptions([""])
          },
          {
            "question_id": 5,
            "type": "TEXTFIELD",
            "title": "Administrative Interviewer:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              [""],
            ),
          },
          {
            "question_id": 6,
            "type": "DATETIME",
            "title": "Date:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
        ]
      },
    ]
  };
  static Map<String, dynamic> administrativeFollowup = {
    "template_name": "Patient Incident Report",
    "cols": 2,
    "title": "Administrative Follow Up",
    "formId": 68,
    "subFormId": 1120,
    "questions": [
      {
        'question_type_id': 681120001, //691123001,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "Administrative Follow Up",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
    ]
  };
}
