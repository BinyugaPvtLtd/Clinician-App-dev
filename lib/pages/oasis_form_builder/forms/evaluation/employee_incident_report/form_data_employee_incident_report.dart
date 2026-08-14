import '../../generate_options.dart';

class FormDataEmployeeIncidentReport {
  static Map<int, Map<String, dynamic>> drawerItems = {
    64: employeeRelatedIncidents,
    65: notifications,
    66: administrativeFollowup,
  };
  static Map<String, dynamic> employeeRelatedIncidents = {
    "template_name": "Employee Incident Report",
    "cols": 2,
    "title": "Employee-Related Incident",
    "formId": 69,
    "subFormId": 1121,
    "questions": [
      {
        'question_type_id': 691121001,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "title": "<b>Employee Name:</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "Injury",
              "Patient Property Damage",
              "Motor Vehicle Accident",
              "Medication Error",
              "Needlestick",
              "Dog Bite",
              "Potential Communicable Disease",
              "Hazardous Environmental Exposure",
              "Other",
            ],textFieldPopup: [8]),
          },
          {
            "question_id": 3,
            "type": "INFO",
            "title":
                "<b>Follow Up With Supervisor And Human Resources Immediately.</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
        ],
      },
      {
        'question_type_id': 691121002,
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
            "title": "Incident Date/Time:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
          {
            "question_id": 2,
            "type": "DATE",
            "title": "Date Reported:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
        ],
      },
      {
        'question_type_id': 691121003,
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
        'question_type_id': 691121004,
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
    "template_name": "Employee Incident Report",
    "cols": 2,
    "title": "Notifications",
    "formId": 69,
    "subFormId": 1122,
    "questions": [
      {
        'question_type_id': 691122001,
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
        'question_type_id': 691122002,
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
    "template_name": "Employee Incident Report",
    "cols": 2,
    "title": "Administrative Follow Up",
    "formId": 69,
    "subFormId": 1123,
    "questions": [
      {
        'question_type_id': 691123001,
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
