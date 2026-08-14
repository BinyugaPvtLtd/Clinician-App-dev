import '../../generate_options.dart';

class FormDataCaseConference {
  static Map<int, Map<String, dynamic>> drawerItems = {
    61: careSummary,
    62: meetingNotes,
  };
  static Map<String, dynamic> careSummary = {
    "template_name": "CASE CONFERENCE",
    "cols": 2,
    "title": "Care Summary",
    "formId": 72,
    "subFormId": 1134,
    "questions": [
      {
        'question_type_id': 721134008,
        "type": "RADIO",
        // "question_id": 2,
        "question_type": "COMPREHENSIVE",
        "title": "<b>Category Case Conference</b>",
        "scroll_axis": "HORIZONTAL",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "options": [
          {"index": 0, "label": "Recert/DC", "value": "Recert/DC", "selected": false},
          {"index": 1, "label": "Wound care", "value": "Wound care", "selected": false},
          {"index": 2, "label": "Utilization visit", "value": "Utilization visit", "selected": false}
        ]
      },
      {
        'question_type_id': 721134001,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>SN</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions([
          "Clinician name:",
          "Frequency:",
          "Summary:",
        ])
      },
      {
        'question_type_id': 721134002,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>PT</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions([
          "Clinician name:",
          "Frequency:",
          "Summary:",
        ])
      },
      {
        'question_type_id': 721134003,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>OT</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions([
          "Clinician name:",
          "Frequency:",
          "Summary:",
        ])
      },
      {
        'question_type_id': 721134004,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>ST</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions([
          "Clinician name:",
          "Frequency:",
          "Summary:",
        ])
      },
      {
        'question_type_id': 721134005,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>MSW</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions([
          "Clinician name:",
          "Frequency:",
          "Summary:",
        ])
      },
      {
        'question_type_id': 721134006,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>HHA</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions([
          "Clinician name:",
          "Frequency:",
          "Summary:",
        ])
      },
      {
        'question_type_id': 721134007,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>RD</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions([
          "Clinician name:",
          "Frequency:",
          "Summary:",
        ])
      },
    ]
  };
  static Map<String, dynamic> meetingNotes = {
    "template_name": "CASE CONFERENCE",
    "cols": 2,
    "title": "Meeting Notes",
    "formId": 72,
    "subFormId": 1135,
    "questions": [
      {
        'question_type_id': 721135001,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "DATE",
            "title": "Date:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "",
            ])
          },
          {
            "question_id": 3,
            "type": "TEXTFIELD",
            "title": "Progress Notes:",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              [
                "",
              ],
              addToValues: false,
            )
          }
        ]
      },
      {
        'question_type_id': 721135002,
        "type": "ACTIONBUTTON",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": "Add New Conference Note",
            "value": "",
          }
        ],
      },
    ]
  };
}
