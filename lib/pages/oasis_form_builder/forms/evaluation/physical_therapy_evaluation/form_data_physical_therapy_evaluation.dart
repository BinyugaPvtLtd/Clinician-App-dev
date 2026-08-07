import '../../generate_options.dart';

class FormDataPhysicalTherapyEvaluation {
  static Map<int, Map<String,dynamic>> ptEvalFormDrawerItems = {
    3: clinicalRecordItems,
    4: patientHistory,
    41: subjective,
    8: vitalSignsHeight,
    44: priorLevelOfFunction,
    9: pain,
    19: integumentary,
    12: neurologicalCognitive,
    42: funcationalStatus,
    21: musculoskeletal,
    43: testsScales,
    45: objective,
    30: assessmentSummary,
    32: planOfCare,
    33: carePlanningCoordination,
    51: summaryForPhysician,
    68: adlAssessment,
  };

  static Map<String, dynamic> patientHistory = {
    "template_name": "Physical Therapy Evaluation",
    "cols": 2,
    "title": "Patient History & Signature",
    "formId": 31,
    "subFormId": 550,
    "questions": [
      {
        'question_type_id': 310550001, //0651105001,
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
        'question_type_id': 310550002, //0651105001,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Pertinent diagnoses and reason for home care</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([""], hints: [" "])
      },
      {
        'question_type_id': 310550003, //0651105001,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Past medical history</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([""], hints: [" "])
      },
      {
        'question_type_id': 310550004, //0651105002,
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
        ],textFieldPopup: [1])
      },
      {
        'question_type_id': 310550005, //0651105003,
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
        ],textFieldPopup: [1])
      },
    ]
  };

  static Map<String, dynamic> clinicalRecordItems = {
    "template_name": "Physical Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Clinical Record Items",
    "formId": 31,
    "subFormId": 551,
    "questions": [
      {
        'question_type_id': 310551001,
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
        'question_type_id': 310551002,
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

  static Map<String, dynamic> subjective = {
    "template_name": "Physical Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Subjective",
    "formId": 31,
    "subFormId": 552,
    'questions': [
      {
        'question_type_id': 310552001,
        "type": "TEXTAREA",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Subjective</b>",
        "code": "",
        "description": "",
        // "scroll_axis": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          {"index": 0, "value": "", "label": "", "selected": false}
        ]
      },
      {
        'question_type_id': 310552002,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>COVID-19 Screening</b>",
        "code": "",
        "description": "",
        // "scroll_axis": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          {
            "index": 0,
            "value": "No S/Sx Present",
            "label": "No S/Sx Present",
            "selected": false
          },
          {
            "index": 1,
            "value": "S/Sx Present",
            "label": "S/Sx Present",
            "selected": false
          },
        ]
      },
    ]
  };

  static Map<String, dynamic> vitalSignsHeight = {
    "template_name": "Physical Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Vital Signs",
    "formId": 31,
    "subFormId": 554,
    'questions': [
      {
        'question_type_id': 0310554001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>VITAL SIGNS</b>",
        "code": "",
        "description": "",
        // "scroll_axis": "HORIZONTAL",
        // "options_alignment": "VERTICAL",
        "group_options": false,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "type": 'TEXTFIELD',
            'question_id': 1,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            // "scroll_axis": 'HORIZONTAL',
            "title": '<b>Body Temperature<b>',
            "value": '',
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false}
            ]
          },
          {
            "type": 'DROPDOWN',
            'question_id': 2,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            "scroll_axis": 'HORIZONTAL',
            "title": '',
            "value": '',
            "selected": false,
            "options": generateOptions(
              [
                "Temporal",
                "Tympanic",
                "Oral",
                "Axillary",
                "Rectal",
                "Non-Contact Forehead",
                "Non-Contact Temporal",
                "Non-Contact",
                "Other",
              ],
            ),
          },
          {
            "type": 'TEXTFIELD',
            'question_id': 3,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            // "scroll_axis": 'HORIZONTAL',
            "title": '',
            "value": '',
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false},
            ]
          },
          {
            "type": 'TEXTFIELD',
            'question_id': 4,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            // "scroll_axis": 'HORIZONTAL',
            "title": '',
            "value": '',
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false},
            ]
          },
          {
            "type": 'DROPDOWN',
            'question_id': 5,
            // "title": list[index],
            "scroll_axis": 'HORIZONTAL',
            "title": 'Position:',
            "value": '',
            "selected": false,
            "options": [
              {"index": 0, "label": 'Sitting', "selected": false},
              {"index": 0, "label": 'Standing', "selected": false},
              {"index": 0, "label": 'Lying', "selected": false}
            ]
          },
          {
            "type": 'RADIO',
            'question_id': 6,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            "scroll_axis": 'HORIZONTAL',
            "title": '',
            "value": '',
            // "selected": false,
            "options": [
              {
                "index": 0,
                "label": 'L Arm',
                "value": 'L Arm',
                "selected": false
              },
              {
                "index": 1,
                "label": 'R Arm',
                "value": 'R Arm',
                "selected": false
              },
              {
                "index": 2,
                "label": 'Other',
                "value": 'Other',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              }
            ]
          },
          {
            "type": 'TEXTFIELD',
            'question_id': 7,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            // "scroll_axis": 'HORIZONTAL',
            "title": '',
            "value": '',
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false}
            ]
          },
          {
            "type": 'RADIO',
            'question_id': 8,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            "scroll_axis": 'HORIZONTAL',
            "title": 'Heart Rhythm:',
            "value": '',
            "selected": false,
            "options": [
              {
                "index": 0,
                "label": 'Regular',
                "value": 'Regular',
                "selected": false
              },
              {
                "index": 1,
                "label": 'Irregular',
                "value": 'Irregular',
                "selected": false
              }
            ]
          },
          {
            "type": 'RADIO',
            'question_id': 9,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            "scroll_axis": 'HORIZONTAL',
            "title": 'Heart Rate Location:',
            "value": '',
            "selected": false,
            "options": [
              {
                "index": 0,
                "label": 'Apical',
                "value": 'Apical',
                "selected": false
              },
              {
                "index": 1,
                "label": 'Radial',
                "value": 'Radial',
                "selected": false
              },
              {
                "index": 2,
                "label": 'Other',
                "value": 'Other',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              },
            ]
          },
          {
            "type": 'TEXTFIELD',
            'question_id': 10,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            // "scroll_axis": 'HORIZONTAL',
            "title": '',
            "value": '',
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false}
            ]
          },
          {
            "type": 'RADIO',
            'question_id': 11,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            "scroll_axis": 'HORIZONTAL',
            "title": 'Respiratory Rhythm:',
            "value": '',
            "selected": false,
            "options": [
              {
                "index": 0,
                "label": 'Regular',
                "value": 'Regular',
                "selected": false
              },
              {
                "index": 1,
                "label": 'Irregular',
                "value": 'Irregular',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              }
            ]
          },
          {
            "type": 'TEXTFIELD',
            'question_id': 12,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            // "scroll_axis": 'HORIZONTAL',
            "title": '',
            "value": '',
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false}
            ]
          },
          {
            "type": 'RADIO',
            'question_id': 13,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            "scroll_axis": 'HORIZONTAL',
            "title": 'Pulse Ox Location:',
            "value": '',
            "selected": false,
            "options": [
              {
                "index": 0,
                "label": 'Right finger',
                "value": 'Right finger',
                "selected": false
              },
              {
                "index": 1,
                "label": 'Left finger',
                "value": 'Left finger',
                "selected": false
              },
              {
                "index": 2,
                "label": 'Other',
                "value": 'Other',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              },
            ]
          },
          {
            "type": 'TEXTFIELD',
            'question_id': 14,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            // "scroll_axis": 'HORIZONTAL',
            "title": '',
            "value": '',
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false,"popup_code":"TEXTFIELDPOPUP",}
            ]
          },
        ]
      },
      {
        'question_type_id': 0310554002,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Patient/Caregiver self monitoring:</b>",
        "code": "",
        "description": "",
        "scroll_axis": "HORIZONTAL",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": List.generate(
          5,
          (index) {
            var list = [
              'Temp',
              'Pulse',
              'BP',
              'SPO2',
              'NA',
            ];
            return {
              "index": index,
              "label": list[index],
              "value": list[index],
              "selected": false
            };
          },
        )
      },
      {
        'question_type_id': 0310554003,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String, dynamic> priorLevelOfFunction = {
    "template_name": "Physical Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Prior Level Of Function",
    "formId": 31,
    "subFormId": 557,
    'questions': [
      {
        'question_type_id': 0310557001, //0020056001,
        "type": "TEXTAREA",
        "title": "<b>Prior Level Of Function</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 0310557002,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String, dynamic> pain = {
    "template_name": "Physical Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Pain",
    "formId": 31,
    "subFormId": 553,
    "questions": [
      {
        'question_type_id': 310553001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Scale used:</b>",
        "code": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          ...List.generate(
            4,
            (index) {
              var list = [
                'Numeric',
                'FACES',
                'N/A - Patient unable to communicate',
                'Other (specify)'
              ];
              return {
                "index": index,
                "value": list[index],
                "label": list[index],
                "selected": false,
                if (index == 3) "popup_code": "TEXTFIELDPOPUP"
              };
            },
          )
        ]
      },
      {
        'question_type_id': 310553002,
        "type": "DROPDOWN",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Pain Rating</b>",
        "code": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            'question_id': 1,
            "type": "DROPDOWN",
            "code": "",
            "description": "",
            "options_alignment": "VERTICAL",
            "group_options": true,
            "options": [
              ...List.generate(
                11,
                (index) {
                  return {
                    "index": index,
                    "value": index.toString(),
                    "label": index.toString(),
                    "selected": false
                  };
                },
              )
            ]
          },
        ]
      },
      {
        'question_type_id': 310553003,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Wong-Baker FACES® Pain Rating Scale</b>",
        "code": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            'question_id': 1,
            "type": "RADIO",
            "code": "",
            "description": "",
            "options_alignment": "VERTICAL",
            "group_options": true,
            "options": [
              ...List.generate(
                6,
                (index) {
                  var list = [
                    'No Hurt',
                    'Hurt Little Bit',
                    'Hurt Little More',
                    'Hurt Even More',
                    'Hurt Whole Lot',
                    'Hurt Worse',
                  ];
                  return {
                    "index": index,
                    "value": list[index],
                    "label": list[index],
                    "selected": false
                  };
                },
              )
            ]
          },
          {
            'question_id': 2,
            "type": "INFO",
            "code": "",
            "description":
                '''<a style="color:#1696C8;">www.wongbakerFACES.org</a> © 1983 Wong-Baker FACES® Foundation. Used with Permission.''',
            "options_alignment": "VERTICAL",
            "group_options": true,
          }
        ]
      },
      {
        'question_type_id': 310553004,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Patient unable to communicate, non-verbal indicators demonstrated:</b>",
        "code": "",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          ...List.generate(
            9,
            (index) {
              var list = [
                'Diaphoresis',
                'Grimacing',
                'Moaning/crying',
                'Guarding',
                'Irritability',
                'Tense',
                'Restlessness',
                'Change in vital signs',
                'Other'
              ];
              return {
                "index": index,
                "value": list[index],
                "label": list[index],
                "selected": false,
                if (index == 8) "popup_code": "TEXTFIELDPOPUP"
              };
            },
          )
        ]
      },
      {
        'question_type_id': 310553005,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Is the patient currently experiencing pain?</b>",
        "code": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          ...List.generate(
            3,
            (index) {
              var list = ['No', 'Yes', 'No pain due to medication'];
              return {
                "index": index,
                "value": list[index],
                "label": list[index],
                "selected": false,
              };
            },
          )
        ]
      },
      {
        'question_type_id': 310553006,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Pain Location:</b>",
        "code": "",
        "description": "",
        "scroll_axis": 'HORIZONTAL',
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          {
            "index": 0,
            "value": '',
            "label": '',
            "selected": false,
          }
        ]
      },
      {
        'question_type_id': 310553007,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Cause of pain:</b>",
        "code": "",
        "description": "",
        "scroll_axis": 'HORIZONTAL',
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          {
            "index": 0,
            "value": '',
            "label": '',
            "selected": false,
          }
        ]
      },
      {
        'question_type_id': 310553008,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Description of Pain:</b>",
        "code": "",
        "description": "",
        "scroll_axis": 'HORIZONTAL',
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          ...List.generate(
            9,
            (index) {
              var list = [
                'Sharp',
                'Dull',
                'Cramping',
                'Aching',
                'Burning',
                'Tingling',
                'Throbbing',
                'Shooting',
                'Pinching'
              ];
              return {
                "index": index,
                "value": list[index],
                "label": list[index],
                "selected": false,
              };
            },
          )
        ]
      },
      {
        'question_type_id': 310553009,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>What relieves pain:</b>",
        "code": "",
        "description": "",
        "scroll_axis": 'HORIZONTAL',
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          ...List.generate(
            6,
            (index) {
              var list = [
                'Medications',
                'Heat',
                'Ice',
                'Rest',
                'Relaxation',
                'Other',
              ];
              return {
                "index": index,
                "value": list[index],
                "label": list[index],
                "selected": false,
                if (index == 5) "popup_code": "TEXTFIELDPOPUP"
              };
            },
          )
        ]
      },
      {
        'question_type_id': 310553010,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>What makes pain worse:</b>",
        "code": "",
        "description": "",
        "scroll_axis": 'HORIZONTAL',
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          ...List.generate(
            4,
            (index) {
              var list = [
                'Movement',
                'Time of day',
                'Posture',
                'Other',
              ];
              return {
                "index": index,
                "value": list[index],
                "label": list[index],
                "selected": false,
                if (index == 3) "popup_code": "TEXTFIELDPOPUP"
              };
            },
          )
        ]
      },
      {
        'question_type_id': 310553011,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>How often is breakthrough medication needed:</b>",
        "code": "",
        "description": "",
        // "scroll_axis": 'HORIZONTAL',
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "options_alignment": "HORIZONTAL",
            "type": "RADIO",
            "title": '',
            "options": List.generate(
              5,
              (index) {
                var list = [
                  'Never',
                  'Less than Daily',
                  'Daily',
                  '2-3 times/day',
                  'More than 3 times/day'
                ];
                return {
                  "index": index,
                  "value": list[index],
                  "label": list[index],
                  "selected": false,
                };
              },
            )
          },
          {
            "question_id": 2,
            "options_alignment": "HORIZONTAL",
            "type": "CHECKBOX",
            "title": '',
            "options": [
              {
                "index": 0,
                "value": 'Adequate pain control with current medications',
                "label": 'Adequate pain control with current medications',
                "selected": false
              }
            ]
          }
        ]
      },
    ]
  };

  static Map<String, dynamic> integumentary = {
    "template_name": "Physical Therapy Evaluation",
    "cols": 2,
    "title": "Integumentary Status",
    "formId": 31,
    "subFormId": 555,
    'questions': [
      {
        'question_type_id': 0310555001, //10019002,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Integumentary Status</b>",
        "dynamic_type": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "Color",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(6, (index) {
              final labelList = [
                "Normal for patient",
                "Jaundice",
                "Pale",
                "Mottled",
                "Ashen",
                "Other",
              ];
              return {
                "index": index,
                "label": labelList[index],
                "value": labelList[index],
                "selected": false,
                if (index == 5) "popup_code": "TEXTFIELDPOPUP"
              };
            }),
          },
          {
            "question_id": 2,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Skin Turgor",
            "group_options": true,
            "options": List.generate(3, (index) {
              final labelList = [
                "Good",
                "Fair",
                "Poor",
              ];
              return {
                "index": index,
                "label": labelList[index],
                "value": labelList[index],
                "selected": false,
              };
            }),
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Temperature / Moisture",
            "group_options": true,
            "options": List.generate(5, (index) {
              final labelList = [
                "Dry",
                "Warm",
                "Cool",
                "Clammy",
                "Diaphoretic",
              ];
              return {
                "index": index,
                "label": labelList[index],
                "value": labelList[index],
                "selected": false,
              };
            }),
          },
        ]
      },
      {
        'question_type_id': 0310555002, //10019002,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Wound(s) identified?</b>",
        "dynamic_type": true,
        "options_alignment": "HORIZONTAL",
        "scroll_axis": "HORIZONTAL",
        "answer_id": 0,
        "options": generateOptions(['No', 'Yes'],textFieldPopup: [1]),
      },
      {
        'question_type_id': 0310555003, //10019003,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title":
                "<b>Surgical wound</b> (complete for closed surgical wounds only)",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "value": "NA",
                "label": "NA",
                "selected": false,
              }
            ]
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "Location:",
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "value": "",
              }
            ]
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "title": "Incision closed with:",
            "group_options": true,
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": List.generate(5, (index) {
              final labelList = [
                "Staples ",
                "Sutures",
                "Steri-strips",
                "Skin /surgical adhesive",
                "Other",
              ];
              return {
                "index": index,
                "label": labelList[index],
                "value": labelList[index],
                "selected": false,
                if (index == 4) "popup_code": "TEXTFIELDPOPUP",
              };
            }),
          },
          {
            "question_id": 4,
            "type": "TEXTFIELD",
            "title": "Incision size/appearance:",
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "value": "",
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 0310555005, //10019002,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Additional Comments: </b>",
        "dynamic_type": true,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "options": generateOptions([""]),
      },
    ]
  };

  static Map<String, dynamic> neurologicalCognitive = {
    "template_name": "Physical Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Cognitive/Neurological Status",
    "formId": 31,
    "subFormId": 556,
    "questions": [
      {
        'question_type_id': 0310556001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Cognitive Status</b>",
        "options_alignment": "HORIZONTAL",
        "group_options": false,
        "dynamic_type": true,
        "answer_id": 0,
        "options": [
          ...List.generate(14, (inx) {
            var list = [
              'Oriented:',
              'Person',
              'Place',
              'Time',
              'Situation',
              'Alert',
              'Forgetful',
              'Confused',
              'Lethargic',
              'Disoriented',
              'Depressed',
              'Agitated',
              'Change in Cognition',
              'Other'
            ];
            return {
              "index": inx,
              "value": list[inx],
              "label": list[inx],
              "selected": false,
              if (inx == 13) "popup_code": "TEXTFIELDPOPUP",
            };
          })
        ]
      },
      {
        'question_type_id': 0310556002,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Cognitive / behavioral / psychosocial factors that may impact plan of care</b>",
        "options_alignment": "HORIZONTAL",
        "group_options": false,
        "dynamic_type": true,
        "answer_id": 0,
        "options": [
          ...List.generate(2, (inx) {
            var list = [
              'None',
              'Describe Factors',
            ];
            return {
              "index": inx,
              "value": list[inx],
              "label": list[inx],
              "selected": false,
              if (inx == 1) "popup_code": "TEXTFIELDPOPUP",
            };
          })
        ]
      },
      {
        'question_type_id': 0310556003,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Neurological Status</b>",
        "options_alignment": "HORIZONTAL",
        "group_options": false,
        "dynamic_type": true,
        "answer_id": 0,
        "options": [
          ...List.generate(2, (inx) {
            var list = [
              'No Deficits',
              'Describe Deficits',
            ];
            return {
              "index": inx,
              "value": list[inx],
              "label": list[inx],
              "selected": false,
              if (inx == 1) "popup_code": "TEXTFIELDPOPUP",
            };
          })
        ]
      },
    ]
  };

  static Map<String, dynamic> funcationalStatus = {
    "template_name": "Physical Therapy Evaluation",
    "template_code": "",
    "cols": 1,
    "title": "Functional Status",
    "formId": 31,
    "subFormId": 559,
    'questions': [
      {
        "question_type_id": 0310559001, //0020058001,
        "question_type": "QUESTIONTYPEBOTH",
        "type": "STATIC",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "options":
                generateOptions(["<b>No Weight bearing Restrictions</b>"]),
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "options": generateOptions([
              "<b>As Tolerated (WBAT)</b>",
              "LLE",
              "RLE",
              "LUE",
              "RUE",
            ])
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "options": generateOptions([
              "<b>Partial (PWB)</b>",
              "LLE",
              "RLE",
              "LUE",
              "RUE",
            ])
          },
          {
            "question_id": 4,
            "type": "CHECKBOX",
            "options": generateOptions([
              "<b>Toe Touch (TTWB)</b>",
              "LLE",
              "RLE",
            ])
          },
          {
            "question_id": 5,
            "type": "CHECKBOX",
            "options": generateOptions([
              "<b>No Weightbearing (NWB)</b>",
              "LLE",
              "RLE",
              "LUE",
              "RUE",
            ])
          },
        ]
      },
      {
        "question_type_id": 0310559002, //0020058002,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "title": "<b>Transfers</b>",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          ...List.generate(16, (index) {
            final titleList = [
              "Roll left and right",
              "Scoot/Bridge",
              "Sit to lying on bed",
              "Lying to sitting on side of bed",
              "Sit to Stand",
              "Chair/bed to chair transfer",
              "Get on/off toilet",
              "Car Transfer",
            ];
            return {
              "question_id": index + 1,
              "title": titleList[(index / 2).floor()],
              "type": "DROPDOWN",
              "options": generateOptions([
                "Independent",
                "Mod Independent",
                "Set Up/Clean Up",
                "Cueing Only",
                "Supervision",
                "SBA",
                "CGA",
                "Min Assist",
                "Mod Assist",
                "Max Assist",
                "Dependent",
                "N/A Limitations (IO)",
                "N/A Unable (88)",
                "N/A Doesn't Apply (10)",
              ]),
            };
          }),
          {
            "question_id": 17,
            "type": "TEXTFIELD",
            "title": "<b>Device Used/Additional Comments:</b>",
            "scroll_axis":"HORIZONTAL",
            "options": generateOptions(
              [''],
            ),
          }
        ]
      },
      {
        "question_type_id": 0310559003, //0020058003,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "title": "<b>Gait and Wheelchair Mobility</b>",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          ...List.generate(
            5,
            (index) {
              final list = [
                "<b>Even</b>",
                "<b>Uneven</b>",
                "<b>Ramp</b>",
                "<b>Stairs</b>",
                "<b>Wheelchair Mobility</b>",
              ];
              return {
                "question_id": index + 1,
                "type": "MIX",
                "title": list[index],
                "options": generateOptions([
                  "Not Applicable",
                  "Prior Assistance",
                  "Prior Distance",
                  "Prior Assistive Device",
                  "Current Assistance",
                  "Current Distance",
                  "Current Assistive Device",
                ])
              };
            },
          ),
        ]
      },
      {
        "question_type_id": 0310559004, //0020058004,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Gait analysis/abnormality of gait description</b>",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
      {
        "question_type_id": 0310559005, //0020058005,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Environmental / safety findings that might impact plan of care</b>",
        "dynamic_type": true,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions(["None", "Describe Findings"],textFieldPopup: [1])
      }
    ]
  };

  static Map<String, dynamic> musculoskeletal = {
    "template_name": "Physical Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Musculoskeletal Status",
    "formId": 31,
    "subFormId": 558,
    "questions": [
      {
        "question_type_id": 0310558001, //0020057001,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": false,
        "questions": [
          ...List.generate(114, (index) {
            final list = [
              "<b>Neck</b><br>Flexion",
              "Extension",
              "Lateral Flexion",
              "Rotation",
              "<b>Trunk</b><br>Flexion",
              "Extension",
              "Lateral Flexion",
              "Rotation",
              "<b>Shoulder</b><br>Flexion",
              "Extension",
              "Abduction",
              "Abduction",
              "Internal Rotation",
              "<b>Elbow</b><br>Flexion",
              "Extension",
              "<b>Forearm</b><br>Pronation",
              "Supination",
              "<b>Wrist</b><br>Flexion",
              "Extension",
              "Radial Deviation",
              "Ulnar Deviation",
              "<b>Hand</b><br>Finger Flexion",
              "Finger Extension",
              "Grip Strength",
              "<b>Hip</b><br>Flexion",
              "Extension",
              "Abduction",
              "Abduction",
              "Internal Rotation",
              "External Rotation",
              "<b>Knee</b><br>Flexion",
              "Extension",
              "<b>Ankle/Foot</b><br>Dorsiflextion",
              "Plantar Flexion",
              "Inversion",
              "Eversion",
              "Toe Flexion",
              "Toe Extension",
            ];
            return {
              "question_id": index + 1,
              "title": list[(index / 3).floor()],
              "type": "STATIC",
              "options": (((index + 1) % 1 == 0 || (index + 1) % 2 == 0) &&
                      (index + 1) % 3 != 0)
                  ? generateOptions([
                      "0",
                      "1-",
                      "1",
                      "1+",
                      "2-",
                      "2",
                      "2+",
                      "3-",
                      "3",
                      "3+",
                      "4-",
                      "4",
                      "4+",
                      "5-",
                      "5",
                      "5+",
                    ]) //For Dropdown
                  : generateOptions(["", ""]) //For Text fields under ROM
            };
          }),
          {
            "question_id": 115,
            "title": "<b>Additional impairment tests/ comments: </b>",
            "scroll_axis": "HORIZONTAL",
            "type": "STATIC",
            "options": generateOptions(
              [""], textFieldPopup:[0]
            ),
          }
        ]
      },
      {
        'question_type_id': 0310558002, //0020057002,
        "type": "STATIC",
        "has_color": false,
        "question_type": "COMPREHENSIVE",
        "group_options": true,
        "dynamic_type": false,
        "title": "<b>Sitting Balance</b>",
        "answer_id": 0,
        "questions": [
          {
            'question_id': 1,
            "type": "DROPDOWN",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "title": '''<b><u style="color:#1696C8;">Static Sitting</u></b>''',
            "options": generateOptions([
              "Normal",
              "Good",
              "Good-",
              "Fair+",
              "Fair",
              "Fair-",
              "Poor+",
              "Poor",
            ])
          },
          {
            'question_id': 2,
            "type": "DROPDOWN",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "title": '''<b><u style="color:#1696C8;">Dynamic Sitting</u></b>''',
            "options": generateOptions([
              "Normal",
              "Good",
              "Good-",
              "Fair+",
              "Fair",
              "Fair-",
              "Poor+",
              "Poor",
            ])
          },
          {
            'question_id': 3,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "title": "Postural deficits identified",
            "options": [
              {"index": 0, "label": "", "value": ""}
            ]
          },
          {
            'question_id': 4,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "title": "Additional Comments",
            "options": [
              {"index": 0, "label": "", "value": ""}
            ]
          },
        ]
      },
      {
        'question_type_id': 0310558003, //0020057003,
        "type": "STATIC",
        "has_color": false,
        "question_type": "COMPREHENSIVE",
        "group_options": true,
        "dynamic_type": false,
        "title": "<b>Sensation</b>",
        "answer_id": 0,
        "questions": [
          ...List.generate(
            3,
            (index) {
              var list = [
                'Light Touch',
                'Sharp/Dull',
                'Joint Position Sense',
              ];
              return {
                'question_id': index + 1,
                "type": "RADIO",
                "scroll_axis": "HORIZONTAL",
                "options_alignment": "HORIZONTAL",
                "group_options": true,
                "title": list[index],
                "options": [
                  ...generateOptions([
                    "Intact",
                    "Impaired",
                    "Not tested",
                  ]),
                  {"label": "Location:", "value": "", "selected": false, "index": 3}
                ]
              };
            },
          ),
        ]
      },
      {
        'question_type_id': 0310558004, //0020057004,
        "type": "STATIC",
        "has_color": false,
        "question_type": "NON-COMPREHENSIVE",
        "group_options": true,
        "dynamic_type": false,
        "title": "<b>Standing Balance</b>",
        "answer_id": 0,
        "questions": [
          {
            'question_id': 1,
            "type": "DROPDOWN",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "title": '''<b><u style="color:#1696C8;">Static Standing</u></b>''',
            "options": generateOptions([
              "Normal",
              "Good",
              "Good-",
              "Fair+",
              "Fair",
              "Fair-",
              "Poor+",
              "Poor",
            ])
          },
          {
            'question_id': 2,
            "type": "DROPDOWN",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "title": '''<b><u style="color:#1696C8;">Dynamic Standing</u></b>''',
            "options": generateOptions([
              "Normal",
              "Good",
              "Good-",
              "Fair+",
              "Fair",
              "Fair-",
              "Poor+",
              "Poor",
            ])
          },
          {
            'question_id': 3,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "title": "Postural deficits identified",
            "options": [
              {"index": 0, "label": "", "value": ""}
            ]
          },
          {
            'question_id': 4,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "title": "Additional Comments",
            "options": [
              {"index": 0, "label": "", "value": ""}
            ]
          },
        ]
      },
      {
        'question_type_id': 0310558005, //0020057005,
        "type": "MIX",
        "has_color": false,
        "question_type": "NON-COMPREHENSIVE",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "title": "<b>Amputation:</b>",
        "answer_id": 0,
        "questions": [
          {
            'question_id': 1,
            "type": "CHECKBOX",
            "has_color": false,
            "question_type": "COMPREHENSIVE",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "dynamic_type": false,
            "options": generateOptions(['Below Knee:', 'R', 'L'])
          },
          {
            'question_id': 2,
            "type": "CHECKBOX",
            "has_color": false,
            "question_type": "COMPREHENSIVE",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "dynamic_type": false,
            "options": generateOptions(['Above Knee:', 'R', 'L'])
          },
          {
            'question_id': 3,
            "type": "CHECKBOX",
            "has_color": false,
            "question_type": "COMPREHENSIVE",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "dynamic_type": false,
            "options": generateOptions(['Upper Extremity:', 'R', 'L'])
          },
          {
            'question_id': 4,
            "type": "CHECKBOX",
            "has_color": false,
            "question_type": "COMPREHENSIVE",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "dynamic_type": false,
            "options": generateOptions(['Other'])
          },
        ],
      },
    ]
  };

  static Map<String, dynamic> testsScales = {
    "template_name": "Physical Therapy Evaluation",
    "template_code": "",
    "cols": 1,
    "title": "Tests/Scales",
    "formId": 31,
    "subFormId": 560,
    'questions': [
      {
        "question_type_id": 0310560001, //0020059001,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          ...List.generate(9, (index) {
            final titleList = [
              "Timed Up and Go (TUG)",
              "Performance Oriented Mobility Assessment (POMA)",
              "30 Second Sit to Stand",
              "Berg Balance Test",
              "Clinical Test of Sensory Interaction on Balance (CTSIB)",
              "Functional Reach",
              "Fall Efficacy Scale",
              "Dynamic Gait Index",
              "Timed Walking Test",
            ];
            return {
              "question_id": index + 1,
              "type": "TEXTFIELD",
              "title": titleList[index],
              "options": generateOptions(
                  index == 4 || index == 8 ? ["", "", "", "", ""] : ["", ""]),
            };
          }),
          ...List.generate(2, (index) {
            return {
              "question_id": index + 6,
              "type": "TEXTFIELD",
              "title": index == 0 || index == 3 ? "Other:" : null,
              "options": generateOptions(["", "", ""]),
            };
          }),
        ]
      },
    ]
  };

  static Map<String, dynamic> objective = {
    "template_name": "Physical Therapy Evaluation",
    "cols": 2,
    "title": " Objective",
    "formId": 31,
    "subFormId": 562,
    'questions': [
      {
        'question_type_id': 0310562001, //0010029001,
        "type": "TEXTFIELD",
        "title": "<b>Interventions/Education Provided this visit:</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 0310562002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "notice": "Exercise Flowsheet",
        "answer_id": 0,
        "draw_box": false,
        "questions": [
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "options": generateOptions(
              [
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
              ],
            )
          }
        ],
      },
      {
        'question_type_id': 0310562003, //0010029002,
        "type": "TEXTFIELD",
        "title": "<b>Response to interventions/education:</b>",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
    ]
  };

  static Map<String, dynamic> assessmentSummary = {
    "template_name": "Physical Therapy Evaluation",
    "cols": 2,
    "title": "Assessment",
    "formId": 31,
    "subFormId": 563,
    'questions': [
      {
        'question_type_id': 0310563001, //0010030002,
        "type": "TEXTAREA",
        "title": "<b>Assessment</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 0310563002, //0010030003,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String, dynamic> planOfCare = {
    "template_name": "Physical Therapy Evaluation",
    "cols": 2,
    "title": "Plan Of Care",
    "formId": 31,
    "subFormId": 564,
    'questions': [
      {
        'question_type_id': 0310564001, //0010032001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options": [
              {
                "index": 0,
                "label": "Eligibility",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 0310564002, //0010032002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options": [
              {
                "index": 0,
                "label": "Prognosis",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 0310564003, //0010032003,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options": [
              {
                "index": 0,
                "label": "Rehab Potential",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 0310564004, //0010032004,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options": [
              {
                "index": 0,
                "label": "DME",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 0310564005, //0010032005,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options": [
              {
                "index": 0,
                "label": "Interventions",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 0310564006, //0010032006,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options": [
              {
                "index": 0,
                "label": "Goals",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 0310564007, //0010032007,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options": [
              {
                "index": 0,
                "label": "Discharge Planning",
              }
            ]
          }
        ],
      },

      {
        'question_type_id': 0310564008,
        "type": "STATIC",
        "title": "<b>Frequency/Duration</b>",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options": [
              {
                "index": 0,
                "label": "PT",
                "value": "",
                "selected": false,
              },

              {
                "index": 1,
                "label": "Request LVN to follow",
                "value": "Request LVN to follow",
                "selected": false,
              },
            ]
          },
          ...List.generate(6, (index) {
            final list = [
              "SN",
              "OT",
              "ST",
              "MSW",
              "HHA",
              "RD",
            ];
            return {
              "question_id": index + 2,
              "type": "STATIC",
              "options": [
                {
                  "index": 0,
                  "label": list[index],
                  "value": "",
                  "selected": false,
                },
                {
                  "index": 1,
                  "label": "Request LVN to follow",
                  "value": "",
                  "selected": false,
                },
              ]
            };
          }),
        ],
      },
    ]
  };

  static Map<String, dynamic> carePlanningCoordination = {
    "template_name": "Physical Therapy Evaluation",
    "cols": 2,
    "title": "Plan/Care Coordination",
    "formId": 31,
    "subFormId": 565,
    'questions': [
      {
        'question_type_id': 0310565001, //0010033001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(
          [
            "Patient, Patient's Representative and Caregiver (if any and as appropriate) agreed to and participated in development/update of the Plan of Care."
          ],
          selectedIndexes: [0],
        ),
      },
      {
        'question_type_id': 0310565002, //0010033002,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
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
        'question_type_id': 0310565003, //0010033003,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(
          [
            "Discharge Plan established/updated with Patient, Patient's Representative (if any) and Caregiver as applicable"
          ],
        ),
      },
      {
        'question_type_id': 0310565004, //0010033004,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Verbal Order Received</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(["Not Received"]),
          },
          {
            "question_id": 2,
            "type": "STATIC",
            "scroll_axis": "HORIZONTAL",
            "title": "MD Name:",
            "options": generateOptions([""]),
          },
          {
            "question_id": 3,
            "type": "TEXTFIELD",
            "title": "Verbal Order for plan of care received from:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""], hints: [" "]),
          },
          {
            "question_id": 4,
            "type": "TEXTFIELD",
            "title": "Other (Specify):",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""], hints: [" "]),
          },
          {
            "question_id": 5,
            "type": "DATE",
            "title": "Date Obtained:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""], hints: [" "]),
          },
          {
            "question_id": 6,
            "type": "TIME",
            "title": "Time Obtained:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""], hints: [" "]),
          },
        ],
      },
      {
        'question_type_id': 0310565005, //0010033005,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "DATE",
            "title": "Date of next physician visit:",
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
        'question_type_id': 0310565006, //0010033006,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
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
    ]
  };

  static Map<String, dynamic> summaryForPhysician = {
    "template_name": "Physical Therapy Evaluation",
    "cols": 2,
    "title": "Summary for Physician",
    "formId": 31,
    "subFormId": 566,
    'questions': [
      {
        'question_type_id': 0310566001, //0651107001,
        "type": "ACTIONBUTTON",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['Generate SBAR']),
      },
      {
        'question_type_id': 0310566002, //0651107001,
        "type": "TEXTAREA",
        "title": "<b>Summary</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 0310566003, //0651105001,
        "type": "UPLOAD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Physician Signature</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(["Upload Signature"])
      },
      {
        'question_type_id': 0310566004, //0651107001,
        "type": "INFO",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "title": " ",
      },
    ]
  };

  static Map<String, dynamic> adlAssessment = {
    "template_name": "Physical Therapy Evaluation",
    "cols": 2,
    "title": "ADLs",
    "formId": 31,
    "subFormId": 561,
    'questions': [
      {
        'question_type_id': 0310561001,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "title":
            "When is the patient dyspneic or noticeably <b>short of breath?</b>",
        "answer_id": 0,
        "question_options": generateOptions([
          'Patient is not short of breath',
          'When walking more than 20 feet, climbing stairs',
          'With moderate exertion (for example, while dressing, using commode or bedpan, walking distances less than 20 feet)',
          'With minimal exertion (for example, while eating, talking, or performing other ADLs) or with agitation',
          ' At rest (during day or night)',
        ]),
      },
      {
        'question_type_id': 0310561002,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "title":
            "<b>Bathing:</b> Current ability to wash entire body safely. <b><u>Excludes</u> grooming (washing face, washing hands, and shampooing hair).</b>",
        "answer_id": 0,
        "question_options": generateOptions([
          'Able to bathe self in shower or tub independently, including getting in and out of tub/shower.',
          'With the use of devices, is able to bathe self in shower or tub independently, including getting in and out of the tub/shower',
          'Able to bathe in shower or tub with the intermittent assistance of another person:<br><br>(a) for intermittent supervision or encouragement or reminders, <u>OR</u><br><br>(b) to get in and out of the shower or tub, <u>OR</u><br><br>(c) for washing difficult to reach areas.',
          'Able to participate in bathing self in shower or tub, but requires presence of another person throughout the bath for assistance or supervision',
          'Unable to use the shower or tub, but able to bathe self independently with or without the use of devices at the sink, in chair, or on commode.',
          'Unable to use the shower or tub, but able to participate in bathing self in bed, at the sink, in bedside chair, or on commode, with the assistance or supervision of another person.',
          'Unable to participate effectively in bathing and is bathed totally by another person.',
        ]),
      },
      {
        'question_type_id': 0310561003,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "title":
            "<b>Toilet Transferring:</b> Current ability to get to and from the toilet or bedside commode safely and transfer on and off toilet/commode.",
        "answer_id": 0,
        "question_options": generateOptions([
          'Able to get to and from the toilet and transfer independently with or without a device.',
          'When reminded, assisted, or supervised by another person, able to get to and from the toilet and transfer.',
          '<u>Unable</u> to get to and from the toilet but is able to use a bedside commode (with or without assistance).',
          '<u>Unable</u> to get to and from the toilet or bedside commode but is able to use a bedpan/urinal independently.',
          'Is totally dependent in toileting.',
        ]),
      },
      {
        'question_type_id': 0310561004,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "title": "<b>Transferring:</b>",
        "description":
            "Current ability to move safely from bed to chair, or ability to turn and position self in bed if patient is bedfast.",
        "answer_id": 0,
        "question_options": generateOptions([
          "Able to independently transfer.",
          "Able to transfer with minimal human assistance or with use of an assistive device.",
          "Able to bear weight and pivot during the transfer process but unable to transfer self.",
          "Unable to transfer self and is unable to bear weight or pivot when transferred by another person.",
          "Bedfast, unable to transfer but is able to turn and position self in bed.",
          "Bedfast, unable to transfer and is unable to turn and position self.",
        ]),
      },
      {
        'question_type_id': 0310561005,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "title": "<b>Ambulation/Locomotion:</b>",
        "description":
            "Current ability to walk safely, once in a standing position, or use a wheelchair, once in a seated position, on a variety of surfaces.",
        "answer_id": 0,
        "question_options": generateOptions([
          "Able to independently walk on even and uneven surfaces and negotiate stairs with or without railings (specifically: needs no human assistance or assistive device).",
          "With the use of a one-handed device (for example, cane, single crutch, hemi-walker), able to independently walk on even and uneven surfaces and negotiate stairs with or without railings.",
          "Requires use of a two-handed device (for example, walker or crutches) to walk alone on a level surface and /or requires human supervision or assistance to negotiate stairs or steps or uneven surfaces.",
          "Able to walk only with the supervision or assistance of another person at all times.",
          "Chairfast, <u>unable</u> to ambulate but is able to wheel self independently.",
          "Chairfast, unable to ambulate and is <u>unable</u> to wheel self.",
          "Bedfast, unable to ambulate or be up in a chair.",
        ]),
      },
    ]
  };
}
