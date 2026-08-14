import '../../generate_options.dart';

class FormDataPhysicianOrder {
  static Map<int, Map<String,dynamic>> drawerItems = {75: physicianOrder};

  static Map<String, dynamic> physicianOrder = {
    "template_name": "Physician Order",
    "cols": 2,
    "title": "Physician Order",
    "formId": 73,
    "subFormId": 1136,
    "questions": [
      {
        'question_type_id': 731136001,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            'question_id': 1,
            "type": "DATE",
            "title": "<b>Order Date:</b>",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "<b>Patient Name:</b>",
            "options_alignment": "HORIZONTAL",
            "description": '',
            "options": generateOptions([
              "Last:",
              "First:",
            ], addToValues: false),
          },
          {
            'question_id': 3,
            "type": "TEXTFIELD",
            "title": "<b>MR Number:</b>",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
          {
            'question_id': 4,
            "type": "TEXTFIELD",
            "title": "<b>Location Name:</b>",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
          {
            'question_id': 5,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "<b>Location Address:</b>",
              "City:",
              "State:",
              "Zip:",
            ],addToValues: false),
          },
          {
            'question_id': 6,
            "type": "TEXTFIELD",
            "title": "<b>Location Phone:</b>",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
          {
            'question_id': 7,
            "type": "TEXTFIELD",
            "title": "<b>Location Fax:</b>",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
          {
            'question_id': 8,
            "type": "TEXTFIELD",
            "title": "<b>Health Insurance Claim Number:</b>",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
          {
            'question_id': 9,
            "type": "TEXTFIELD",
            "title": "<b>Physician Name:</b>",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
          {
            'question_id': 10,
            "type": "TEXTFIELD",
            "title": "<b>Physician NPI:</b>",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
          {
            'question_id': 11,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "<b>Physician Address:</b>",
              "City:",
              "State:",
              "Zip:",
            ],addToValues: false),
          },
          {
            'question_id': 12,
            "type": "TEXTFIELD",
            "title": "<b>Physician Phone:</b>",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
          {
            'question_id': 13,
            "type": "TEXTFIELD",
            "title": "<b>Fax:</b>",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
        ]
      },
      {
        'question_type_id': 731136002,
        "type": "TEXTFIELD",
        "question_type": "QUESTIONTYPEBOTH",
        "title": "<b>Situation, Background, Assessment, Recommendation:</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
      {
        'question_type_id': 731136003,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Order Type (select all that apply):</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "question_options": generateOptions([
          "Edit Medications",
          "Edit Frequencies",
          "Add a New Discipline",
          "Update Wound Care Orders",
          "Add Supplies",
        ],textFieldPopup: [1,2]),
      },
      {
        'question_type_id': 731136004,
        "type": "DROPDOWN",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions":[
          {
            "question_id":1,
            "type":"DROPDOWN",
            "scroll_axis":"HORIZONTAL",
            "title": "<b>Plan of Care</b>",
            "options":generateOptions([
              "Activities Permitted",
              "Advance Directive",
              "Allergies",
              "Diagnosis",
              "Discharge Planning",
              "DME",
              "Eligibility",
              "Functional Limitations",
              "Goals",
              "Interventions",
              "Mental Status",
              "Nutritional Requirements",
              "Prognosis",
              "Rehab Potential",
              "Safety Measures",
            ]),
          }
        ]
      },
      {
        'question_type_id': 731136005,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            'question_id': 1,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "<b>Verbal Order</b>",
              "<b>Non-Verbal Order</b>",
            ]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "<b>Verbal Order received by:</b>",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "description": '',
            "options": generateOptions([
              "",
            ], addToValues: false),
          },
          {
            'question_id': 3,
            "type": "TEXTFIELD",
            "title": "<b>Verbal Order received from:</b>",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
          {
            'question_id': 4,
            "type": "DATE",
            "title": "<b>Date order received:</b>",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
          {
            "question_id": 5,
            "type": "TIME",
            "title": "<b>Time order received:</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""],),
          },
          {
            'question_id': 6,
            "type": "DATE",
            "title": "<b>Effective Date:</b>",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "group_options": false,
            "options": generateOptions([
              "",
            ]),
          },
        ]
      },
    ]
  };
}
