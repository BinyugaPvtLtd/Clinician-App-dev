import '../../generate_options.dart';

class FormDataInfectionIdentificationReport {
  static Map<int, Map<String, dynamic>> drawerItems = {
    70: infectionIdentificationReport,
  };

  static Map<String, dynamic> infectionIdentificationReport = {
    "template_name": "Infection Identification Report",
    "cols": 2,
    "title": "Infection Indication Report",
    "formId": 66,
    "subFormId": 1110,
    "questions": [
      {
        'question_type_id': 0661110001,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "draw_box":false,
        "title": "<b>Complete this form whenever:</b>",
        "questions": [
          {
            "question_id": 1,
            "type": "INFO",
            "title": '''
            1) patient is admitted to home care/ hospice with the diagnosis of an infection
            <br><br>2) signs for symptoms of an infection are noted during a home during a home visit
            <br><br>3) the patient has a positive culture
            <br><br>4) new antibiotic(s) are ordered
            <br><br>5) the patient is admitted to hospital or dies, due to an infection or employee infection''',
          },
          {
            "question_id": 2,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>SOC Date:</b>",
            "options": generateOptions(['']),
          },
          {
            "question_id": 2,
            "type": "TEXT",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Admit DX:</b>",
            "options": generateOptions(['']),
          },
          {
            "question_id": 3,
            "type": "TEXT",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Reported By:</b>",
            "options": generateOptions(['']),
          }
        ]
      },
      {
        'question_type_id': 0661110002,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "title": "<b>DATE INFECTION WAS FIRST OBSERVED</b>",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "group_options": true,
            "options": generateOptions([
              "Infection was present on admission to Home Care/ Hospice from:",
              "Infection was first noted during Home Care/ Hospice visit.",
            ]),
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Hospital",
              "MD Office",
              "ER",
              "Nursing Home",
              "Other",
            ], textFieldPopup: [
              4
            ])
          },
          {
            "question_id": 3,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "Date of Discharge/Visit",
            "options": generateOptions([""])
          },
          {
            "question_id": 4,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "Date of first observed/notified",
            "options": generateOptions([""])
          }
        ],
      },
      {
        'question_type_id': 0661110003,
        "type": "MIX",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "title": "<b>SITE OF SUSPECTED/ACTUAL INFECTION</b>",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "options_alignment":"HORIZONTAL",
            "options": generateOptions([
              "Urinary",
              "Wound",
              "Surgical Incision",
              "Respiratory",
              "Site",
              "Oral",
              "Gastrointestinal",
              "Blood",
              "Other",
            ], textFieldPopup: [
              8
            ]),
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title":
                "Factors associated with the development of the infection:",
            "options_alignment":"HORIZONTAL",
            "options": generateOptions([
              "Foley Catheter",
              "Wound",
              "Tracheostomy",
              "COPD",
              "Other",
            ], textFieldPopup: [
              4
            ]),
          },
        ],
      },
      {
        'question_type_id': 0661110004,
        "type": "MIX",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "title": "<b>SIGNS AND SYMPTOMS OBSERVED</b>",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "options_alignment":"HORIZONTAL",
            "options": generateOptions([
              "Fever/Chills",
              "Cloudy/Foul Urine",
              "Change in sputum color",
              "Purpulent Drainage",
              "Erythema",
              "Dysuria/ Flank pain",
              "Increase in Sputum",
              "Increase in Drainage",
              "Diarrhea",
              "Cough/ Dyspnea",
              "Wound Pain",
              "Other",
            ], textFieldPopup: [
              11
            ]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "Additional explanation/description:",
            "options": generateOptions([""]),
          },
        ],
      },
      {
        'question_type_id': 0661110005,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Labs Rating to Infection</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(["Not Applicable"], hints: [' ']),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "options": generateOptions([""]),
          },
        ],
      },
      {
        'question_type_id': 0661110006,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>MD Orders Relating to Infection</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(["Not Applicable"], hints: [' ']),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "options": generateOptions([""]),
          },
        ],
      },
      {
        'question_type_id': 0661110007,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Medication Orders Relating to Infection</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(["Not Applicable"], hints: [' ']),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "options": generateOptions([""]),
          },
        ],
      },
      {
        'question_type_id': 0661110008,
        "type": "TEXTFIELD",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": true,
        "title": "<b>Follow up required / additional comments</b>",
        "answer_id": 0,
        "question_options": generateOptions([''])
      },
      {
        'question_type_id': 0661110010,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "title": "<b>For QA Purpose Only</b>",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "scroll_axis": "HORIZONTAL",
            "title":"Was the disease reportable?",
            "options_alignment":"HORIZONTAL",
            "group_options": true,
            "options": generateOptions(["Yes", "No"])
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "options": generateOptions(
              ["Report to Health Department/CDC on:", "BY Whom:"],
              addToValues: false,
            )
          }
        ]
      },
      {
        'question_type_id': 0661110011,
        "type": "UPLOAD",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": true,
        "title": "Clinical Signature:",
        "answer_id": 0,
        "options": generateOptions(["Upload Signature"])
      },
    ]
  };
}
