import '../../generate_options.dart';

class FormDataOxygenSafetyAssessment {
  static Map<int, Map<String, dynamic>> drawerItems = {
    58: oxygenSafetyAssessment,
  };

  static Map<String, dynamic> oxygenSafetyAssessment = {
    "template_name": "OXYGEN SAFETY ASSESSMENT",
    "cols": 2,
    "title": "Oxygen Safety Assessment",
    "formId": 64,
    "subFormId": 1104,
    "questions": [
      {
        'question_type_id': 0641104001,
        "type": "INFO",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": true,
        "title":
            "Instructions: Assess each element below and indicate the specific teaching given in the appropriate spaces. Submit this form to the Office and leave a copy of the \"Home Oxygen Safety Guidelines\" in the home folder.",
      },
      {
        'question_type_id': 0641104002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "1. Oxygen signs are posted:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "If <b>NO</b>, actions taken:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "",
            ]),
          }
        ],
      },
      {
        'question_type_id': 0641104003,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "2. There are smoking materials in the home:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "If <b>YES</b>, patient instructed as follows:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "",
            ]),
          }
        ],
      },
      {
        'question_type_id': 0641104004,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title":
                "3. There are potential sources for open flames (examples: gas stoves, candles, fireplace, etc.):",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "If <b>YES</b>, what sources were identified?",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "",
            ]),
          },
          {
            "question_id": 3,
            "type": "TEXTFIELD",
            "title": "Patient instructed as follows:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "",
            ]),
          }
        ],
      },{
        'question_type_id': 0641104005,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title":
                "4. There are functioning smoke detectors in the home:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "If <b>YES</b>, how were they checked?",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "",
            ]),
          },
          {
            "question_id": 3,
            "type": "TEXTFIELD",
            "title": "If <b>NO</b>, patient instructed as follows:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "",
            ]),
          }
        ],
      },
      {
        'question_type_id': 0641104006,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "5. Oxygen tanks stored safely (racked or lying down in a ventilated space):",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "If <b>NO</b>, patient and/or Caregiver instructed as follows:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "",
            ]),
          }
        ],
      },{
        'question_type_id': 0641104007,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "6. Oxygen concentrator located in a ventilated space:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "If <b>NO</b>, patient and/or Caregiver instructed as follows:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "",
            ]),
          }
        ],
      },

      {
        'question_type_id': 0641104008, //0651105001,
        "type": "UPLOAD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Clinician Signature:</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(["Upload Signature"])
      },
    ]
  };
}
