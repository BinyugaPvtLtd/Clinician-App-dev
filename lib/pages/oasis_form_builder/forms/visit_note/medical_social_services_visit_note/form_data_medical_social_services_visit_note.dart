import '../../generate_options.dart';

class FormDataMedicalSocialServicesVisitNote {
  static Map<int, Map<String, dynamic>> drawerItems = {
    4: patientHistory,
    3: clinicalRecordItems,
    29: interventionsEducationProvided,
    30: assessmentSummary,
    33: carePlanningCoordination,
  };
  static Map<String, dynamic> patientHistory = {
    "template_name": "Medical Social Services Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Patient History & Signature",
    "formId": 65,
    "subFormId": 1105,
    "questions": [
      {
        'question_type_id': 0651105001,
        "type": "UPLOAD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Patient Signature</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(["Upload Signature"])
      },
      {
        'question_type_id': 0651105002,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Any MD/ER visits/hospitalizations since last visit?</b>",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "No",
          "Yes",
        ])
      },
      {
        'question_type_id': 0651105003,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Any medication changes since last visit?</b>",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "No",
          "Yes",
        ])
      },
    ]
  };
  static Map<String, dynamic> clinicalRecordItems = {
    "template_name": "Medical Social Services Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Clinical Record Items",
    "formId": 65,
    "subFormId": 1106,
    "questions": [
      {
        'question_type_id': 0651106001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Two (or more) patient identifiers used this visit:</b>",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "question_options": List.generate(8, (index) {
          var list = [
            'Assigned identification number (for example, MBI, DOB, SSN)',
            'Insurance Card',
            'Direct facial recognition (known to staff)',
            'Patient address confirmed',
            'Driver\'s License',
            'Patient Name',
            'Passport',
            'Other patient identifier(s) used this visit',
          ];
          return {
            "index": index,
            "label": list[index],
            "value": list[index],
            "selected": false,
            if (index == 7) "popup_code": "TEXTFIELDPOPUP"
          };
        })
      },
      {
        'question_type_id': 0651106002,
        "type": "TEXTAREA",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>What is most important to the patient today?</b>",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": '',
            "value": '',
          }
        ]
      },
    ]
  };
  static Map<String, dynamic> interventionsEducationProvided = {
    "template_name": "Medical Social Services Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Interventions/Education Provided",
    "formId": 65,
    "subFormId": 1108,
    'questions': [
      {
        "question_type_id": 651108001, //571063002,
        "type": "STATIC",
        "dynamic_type": false,
        "question_type": "COMPREHENSIVE", "draw_box":false,
        "questions": [
          ...List.generate(5, (index) {
            final list = [
              "<b>Gait Training</b>",
              "<b>Goal:</b> Patient will be able to walk 150ft with SBA and FWW.",
              "<b>Goal:</b> Patient will be able to walk 300ft independently.",
              "<b>Transfer Training</b>",
              "<b>Balance Training</b>",
            ];
            return {
              "question_id": index + 1,
              "type": "OPTION",
              "title": list[index],
              "options": index == 1 || index == 2
                  ? generateOptions(["<b>Met</b>", "<b>Not Met</b>"])
                  : generateOptions(["<b>Provided</b>", "<b>Not Provided</b>"],
                      textFieldPopup: [0]),
            };
          })
        ]
      },
      {
        'question_type_id': 651108002,
        "type": "ACTIONBUTTON",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['Exercise Flowsheet']),
      },
    ]
  };
  static Map<String, dynamic> assessmentSummary = {
    "template_name": "Medical Social Services Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Assessment",
    "formId": 65,
    "subFormId": 1107,
    'questions': [
      ...List.generate(3, (index) {
        final titles = [
          "Updates/changes related to social and emotional factors:",
          "Updates [changes related to financial or community resources:",
          "Updates/changes related to physical/medical needs",
        ];
        return {
          'question_type_id': 0651107001 + index,
          "type": "TEXTAREA",
          "title": "<b>${titles[index]}</b>",
          "question_type": "COMPREHENSIVE",
          "dynamic_type": true,
          "has_color": true,
          "answer_id": 0,
          "question_options": generateOptions(['']),
        };
      }),
      ...List.generate(2, (index) {
        final titles = [
          "Additional assessment findings:",
          "Ongoing skilled needed:"
        ];
        return {
          'question_type_id': 0651107004 + index,
          "type": "TEXTAREA",
          "title": "<b>${titles[index]}</b>",
          "question_type": "NON-COMPREHENSIVE",
          "dynamic_type": true,
          "has_color": true,
          "answer_id": 0,
          "question_options": generateOptions(['']),
        };
      })
    ]
  };
  static Map<String, dynamic> carePlanningCoordination = {
    "template_name": "Medical Social Services Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Care Planning/Coordination",
    "formId": 65,
    "subFormId": 1109,
    'questions': [
      {
        'question_type_id': 0651109001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(
          ["Changes made to Plan Of Care"],
          textFieldPopup: [0],
        ),
      },
      {
        'question_type_id': 0651109002,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(
          ["Changes made to Discharge Plan"],
          textFieldPopup: [0],
        ),
      },
      {
        'question_type_id': 0651109003,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "options_alignment": "HORIZONTAL",
        "title": "<b>Plans for next visit</b>",
        "answer_id": 0,
        "question_options": generateOptions([
          "Assessment",
          "Teaching",
          "Treatments/procedures/therapy",
          "Preparation for discharge",
          "Other",
        ], textFieldPopup:[4]),
      },
      {
        'question_type_id': 0651109004,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "DATE",
            "title": "<b>Date of next physician visit:</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""], hints: [" "]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "Reason for Visit:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
        ],
      },
      {
        'question_type_id': 0651109005,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Care coordination with:</b>",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Physician",
              "Case Manager",
              "Clinical Manager",
              "SN",
              "PT",
              "PTA",
              "OT",
              "COTA",
              "ST",
              "Aide",
              "MSW",
              "Other",
            ], selectedIndexes: [
              2,
              5,
              8
            ], textFieldPopup: [
              11
            ])
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "<b>Coordination details:</b>",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "POC",
              "Additional Disciplines Needed",
              "Abnormal Vital Signs",
              "Other",
            ], selectedIndexes: [
              3
            ], textFieldPopup: [
              1,
              2,
              3
            ])
          }
        ]
      },
      {
        'question_type_id': 0651109006,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "draw_box":false,
        "answer_id": 0,
        "question_options": generateOptions(['Create Physician Order'],addToValues: false),
      },
    ]
  };
}
