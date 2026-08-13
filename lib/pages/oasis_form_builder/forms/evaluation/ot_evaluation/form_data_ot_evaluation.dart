import '../../generate_options.dart';

class FormDataOtEvaluation {
  static Map<int, Map<String,dynamic>> drawerItems = {
    4: patientHistory,
    3: clinicalRecordItems,
    41: subjective,
    9: pain,
    8: vitalSignsHeight,
    19: integumentary,
    45: objective,
    30: assessment,
    32: planOfCare,
    33: carePlanningCoordination,
    51: summaryForPhysician,
    43: testsScales,
    21: musculoskeletal,
    42: functionalAssessment,
    12: neurologicalCongnitive,
    44: priorLevelOfFunction,
    68: adlAssessment,
  };

  static Map<String, dynamic> patientHistory = {
    "template_name": "Occupational Therapy Evaluation",
    "cols": 2,
    "title": "Patient History & Signature",
    "formId": 32,
    "subFormId": 567,
    "questions": [
      {
        'question_type_id': 320567001,//400654001,
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
        'question_type_id': 320567002,//400654002,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Pertinent diagnoses and reason for home care:</b>",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
      {
        'question_type_id': 320567003,//400654003,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Past medical history:</b>",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
      {
        'question_type_id': 320567004, //0651105002,
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
        'question_type_id': 320567005, //0651105003,
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
    "template_name": "Occupational Therapy Evaluation",
    "cols": 2,
    "title": "Clinical Record Items",
    "formId": 32,
    "subFormId": 568,
    "questions": [
      {
        'question_type_id': 320568001, //0651106001,
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
        'question_type_id': 320568002, //0651106002,
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
    "template_name": "Occupational Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Subjective",
    "formId": 32,
    "subFormId": 569,
    "questions": [
      {
        'question_type_id': 320569001,//520909001,
        "type": "TEXTAREA",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Subjective</b>",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          {"index": 0, "value": "", "label": "", "selected": false}
        ]
      },
      {
        'question_type_id': 320569002,//520909002,
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

  static Map<String,dynamic> pain = {
    "template_name": "Occupational Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Pain",
    "formId": 32,
    "subFormId": 570,
    "questions": [
      {
        'question_type_id': 320570001,//520910001,
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
        'question_type_id': 320570002,//520910002,
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
        'question_type_id': 320570003,//520910003,
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
        'question_type_id': 320570004,//520910004,
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
        'question_type_id': 320570005,//520910005,
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
        'question_type_id': 320570006,//520910006,
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
        'question_type_id': 320570007,//520910007,
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
        'question_type_id': 320570008,//520910008,
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
        'question_type_id': 320570009,//520910009,
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
        'question_type_id': 320570010,//520910010,
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
        'question_type_id': 320570011,//520910011,
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

  static Map<String,dynamic> vitalSignsHeight = {
    "template_name": "Occupational Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Vital signs",
    "formId": 32,
    "subFormId": 571,
    'questions': [
      {
        'question_type_id': 320571001,//520911001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>VITAL SIGNS</b>",
        "group_options": false,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "type": 'TEXTFIELD',
            'question_id': 1,
            "options_alignment": "HORIZONTAL",
            "title": '<b>Body Temperature<b>',
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
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false},
            ]
          },
          {
            "type": 'TEXTFIELD',
            'question_id': 4,
            "options_alignment": "HORIZONTAL",
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false},
            ]
          },
          {
            "type": 'DROPDOWN',
            'question_id': 5,
            "scroll_axis": 'HORIZONTAL',
            "title": 'Position:',
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
            "scroll_axis": 'HORIZONTAL',
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
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false}
            ]
          },
          {
            "type": 'RADIO',
            'question_id': 8,
            "options_alignment": "HORIZONTAL",
            "scroll_axis": 'HORIZONTAL',
            "title": 'Heart Rhythm:',
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
            "scroll_axis": 'HORIZONTAL',
            "title": 'Heart Rate Location:',
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
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false}
            ]
          },
          {
            "type": 'RADIO',
            'question_id': 11,
            "options_alignment": "HORIZONTAL",
            "scroll_axis": 'HORIZONTAL',
            "title": 'Respiratory Rhythm:',
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
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false}
            ]
          },
          {
            "type": 'RADIO',
            'question_id': 13,
            "options_alignment": "HORIZONTAL",
            "scroll_axis": 'HORIZONTAL',
            "title": 'Pulse Ox Location:',
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
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false,"popup_code":"TEXTFIELDPOPUP"}
            ]
          },
        ]
      },
      {
        'question_type_id': 320571002,//520911002,
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
        'question_type_id': 320571003,//520911003,
        "type": "INFO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "",
        "code": "",
        "description": "",
        "scroll_axis": "HORIZONTAL",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
      },
    ]
  };

  static Map<String,dynamic> integumentary = {
    "template_name": "Occupational Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Integumentary Status",
    "formId": 32,
    "subFormId": 572,
    'questions': [
      {
        'question_type_id': 320572001,//520918001,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Integumentary Status</b>",
        "dynamic_type": false,
        "has_color": false,
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
        "question_type_id": 320572002,//520918002,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "options_alignment": "HORIZONTAL",
        "scroll_axis": "HORIZONTAL",
        "title": "<b>Wound(s) Identified?</b>",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "options": generateOptions(["No","Yes"],textFieldPopup: [1]),
      },
      {
        'question_type_id': 320572003,//520918003,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "No surgical wounds",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "value": "",
                "label": "",
                "selected": false,
              }
            ]
          },
          {
            "question_id": 2,
            "type": "INFO",
            "title":
                "<b>Surgical wound</b> (complete for closed surgical wounds only)",
            // "scroll_axis": "HORIZONTAL",
            "group_options": true,
          },
          {
            "question_id": 3,
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
            "question_id": 4,
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
            "question_id": 5,
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
        'question_type_id': 320572004,//520918004,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "title": "<b>Additional Comments:</b>",
        "answer_id": 0,
        "options": [
          {"index": 0, "value": "", "label": "", "selected": false}
        ]
      },
    ]
  };

  static Map<String, dynamic> objective = {
    "template_name": "Occupational Therapy Evaluation",
    "cols": 2,
    "title": " Objective",
    "formId": 32,
    "subFormId": 579,
    'questions': [
      {
        'question_type_id': 320579001, //0010029001,
        "type": "TEXTFIELD",
        "title": "<b>Interventions/Education Provided this visit:</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 320579002,
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
        'question_type_id': 320579003, //0010029002,
        "type": "TEXTFIELD",
        "title": "<b>Response to interventions/education:</b>",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
    ]
  };

  static Map<String,dynamic> assessment = {
    "template_name": "Occupational Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Assessment",
    "formId": 32,
    "subFormId": 580,
    'questions': [
      {
        'question_type_id': 320580001,//520928001,
        "type": "TEXTAREA",
        "title": "<b>Assessment</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 320580002,//520928002,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String,dynamic> planOfCare = {
    "template_name": "Occupational Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Plan Of Care",
    "formId": 32,
    "subFormId": 581,
    'questions': [
      {
        'question_type_id': 320581001,//520929001,
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
        'question_type_id': 320581002,//520929002,
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
                "label": "DME/Supplies",
              }
            ]
          }
        ],
      },
      
      {
        'question_type_id': 320581003,//520929004,
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
        'question_type_id': 320581004,//520929005,
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
                "label": "Activities Permitted",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 320581005,//520929006,
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
                "label": "Functional Limitations",
              }
            ]
          }
        ],
      },{
        'question_type_id': 320581006,//520929006,
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
      },{
        'question_type_id': 320581007,//520929006,
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
        'question_type_id': 320581008,//520929007,
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
        'question_type_id': 320581009,
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
                "label": "OT",
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
              "PT",
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
    "template_name": "Occupational Therapy Evaluation",
    "cols": 2,
    "title": "Plan/Care Coordination",
    "formId": 32,
    "subFormId": 582,
    'questions': [
      {
        'question_type_id': 320582001, //0010033001,
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
        'question_type_id': 320582002, //0010033002,
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
        'question_type_id': 320582003, //0010033003,
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
        'question_type_id': 320582004, //0010033004,
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
        'question_type_id': 320582005, //0010033005,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
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
        'question_type_id': 320582006, //0010033006,
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
    "template_name": "Occupational Therapy Evaluation",
    "cols": 2,
    "title": "Summary for Physician",
    "formId": 32,
    "subFormId": 583,
    "questions": [
      {
        'question_type_id': 320583001, //0651105002,
        "type": "ACTIONBUTTON",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(["Generate SBAR"])
      },
      {
        'question_type_id': 320583002, //0651105002,
        "type": "TEXTAREA",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Summary</b>",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
      {
        'question_type_id': 320583003, //0651105001,
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
        'question_type_id': 320583004, //0651105003,
        "type": "INFO",
        "question_type": "NON-COMPREHENSIVE",
        "title": " ",
        "dynamic_type": true,
        "has_color": false,
      },
    ]
  };

  static Map<String, dynamic> testsScales = {
    "template_name": "Occupational Therapy Evaluation",
    "template_code": "",
    "cols": 1,
    "title": "Tests/Scales",
    "formId": 32,
    "subFormId": 577,
    'questions': [
      {
        "question_type_id": 320577001,//0080238001,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          ...List.generate(5, (index) {
            final titleList = [
              "Barthel",
              "Timed Up and Go (TUG)",
              "30 Second Sit to Stand",
              "Katz Index of Independence in ADL's",
              "Fall Efficacy Scale",
            ];
            return {
              "question_id": index + 1,
              "type": "TEXTFIELD",
              "title": titleList[index],
              "options": generateOptions(["", ""]),
            };
          }),
          ...List.generate(2, (index) {
            return {
              "question_id": index + 6,
              "type": "TEXTFIELD",
              "options":
              generateOptions(["Other:", "", ""], addToValues: false),
            };
          }),
        ]
      },
    ]
  };

  static Map<String, dynamic> musculoskeletal = {
    "template_name": "Occupational Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Musculoskeletal Status",
    "formId": 32,
    "subFormId": 575,
    "questions": [
      {
        "question_type_id": 320575001,//0080236001,
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
            "title": "<b>Additional impairment tests/ comments:</b>",
            "scroll_axis": "HORIZONTAL",
            "type": "STATIC",
            "options": generateOptions(
              [""],
            ),
          }
        ]
      },
      {
        'question_type_id': 320575002,//0080236002,
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
        'question_type_id': 320575003,//0080236003,
        "type": "STATIC",
        "has_color": false,
        "question_type": "COMPREHENSIVE",
        "group_options": true,
        "dynamic_type": false,
        "title": "<b>Sensation</b>",
        "answer_id": 0,
        "questions": [
          ...List.generate(
            5,
                (index) {
              var list = [
                'Light Touch',
                'Sharp/Dull',
                'Hot/Cold',
                'Proprioception',
                'Stereognosis'
              ];
              return {
                'question_id': index + 1,
                "type": "RADIO",
                "scroll_axis": "HORIZONTAL",
                "options_alignment": "HORIZONTAL",
                "group_options": true,
                "title": list[index],
                "options": [
                  {
                    "index": 0,
                    "label": "Intact",
                    "value": "Intact",
                    "selected": false
                  },
                  {
                    "index": 1,
                    "label": "Impaired",
                    "value": "Impaired",
                    "selected": false
                  },
                  {"index": 2, "label": "NT", "value": "NT", "selected": false},
                ]
              };
            },
          ),
          ...List.generate(
            5,
                (index) {
              return {
                'question_id': index + 6,
                "type": "TEXTFIELD",
                "scroll_axis": "HORIZONTAL",
                "group_options": true,
                "title": "Location:",
                "options": [
                  {"index": 0, "label": "", "value": "", "selected": false},
                ]
              };
            },
          ),
          {
            'question_id': 11,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "title": "Describe impairments:",
            "options": [
              {"index": 0, "label": "", "value": ""}
            ]
          },
        ]
      },
      {
        'question_type_id': 320575004,//0080236004,
        "type": "CHECKBOX",
        "has_color": false,
        "question_type": "COMPREHENSIVE",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "title": "<b>Perceptual Impairments</b>",
        "answer_id": 0,
        "options": generateOptions(['NT', 'Impaired'],textFieldPopup: [1])
      },
      {
        'question_type_id': 320575005,//0080236005,
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
        'question_type_id': 320575006,//0080236006,
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
      {
        'question_type_id': 320575007,//0080236007,
        "type": "CHECKBOX",
        "has_color": false,
        "question_type": "NON-COMPREHENSIVE",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "title": "<b>Muscle Tone</b>",
        "answer_id": 0,
        "options": generateOptions(['NT', 'Impaired'],textFieldPopup: [1])
      },
    ]
  };

  static Map<String, dynamic> functionalAssessment = {
    "template_name": "Occupational Therapy Evaluation",
    "template_code": "",
    "cols": 1,
    "title": "Functional Status",
    "formId": 32,
    "subFormId": 576,
    'questions': [
      {
        "question_type_id": 320576001,//0080237001,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          ...List.generate(49, (index) {
            final titleList = [
              "Feed Self",
              "Oral Hygiene",
              "Toileting Hygiene",
              "Shower/bathe self",
              "Upper body dressing",
              "Lower body dressing",
              "Putting on/ taking off footwear",
              "Roll left and right on bed",
              "Sit to lying on bed",
              "Lying to sitting on side of bed",
              "Sit to stand",
              "Chair/bed to chair transfer",
              "Picking up small object from floor",
              "Wheelchair/Scooter use - indicate manual or motorized",
              "Wheel 50 feet with 2 turns",
              "Ambulate",
              "Cook meals",
              "Write/sign name",
              "Housekeeping",
              "Phone Use",
              "Medication Management",
              "Orthotic Prosthetic Management",
              "Manipulation of Fasteners",
              "Other:",
            ];
            return {
              "question_id": index + 1,
              "title": index == 48 ? "Other:" : titleList[(index / 2).floor()],
              "type": index == 48 ? "TEXTFIELD:" : "DROPDOWN",
              "options": generateOptions(index == 48
                  ? [""]
                  : titleList[(index / 2).floor()]
                  .contains("Wheelchair/Scooter use")
                  ? ["Manual", "Motorized"]
                  : [
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
            "question_id": 50,
            "type": "TEXTFIELD",
            "title": "<b>Device Used/Additional Comments:</b>",
            "options": generateOptions(
              [''],hints:[" "],
            ),
          }
        ]
      },
      {
        "question_type_id": 320576002,//0080237002,
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": true,
        "type": "CHECKBOX",
        "title": "<b>Environmental/safety findings that might impact plan of care</b>",
        "options_alignment": "HORIZONTAL",
        "question_options": generateOptions(
          [
            "None",
            "Describe Findings",
          ],
          textFieldPopup: [1],
        ),
      },
      {
        "question_type_id": 320576003,//0080237003,
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": true,
        "type": "ACTIONBUTTON",
        "question_options": generateOptions(
          [
            "Generate DME Order",
          ],
        ),
      }
    ]
  };

  static Map<String, dynamic> neurologicalCongnitive = {
    "template_name": "Occupational Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Cognitive/Neurological Status",
    "formId": 32,
    "subFormId": 573,
    "questions": [
      {
        'question_type_id': 320573001,//420683001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Cognitive Assessment</b>",
        "code": "",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          ...List.generate(
            10,
                (index) {
              var list = [
                'Short Term Memory',
                'Long Term Memory',
                'Arousal',
                'Orientation',
                'Attention Span',
                'Repetition',
                'Sequencing',
                'Safety Awareness',
                'Judgement',
                'Ability to express needs'
              ];
              return {
                "type": 'DROPDOWN',
                "question_id": index + 1,
                "group_options": true,
                "scroll_axis": "HORIZONTAL",
                // "options_alignment": "HORIZONTAL",
                "title": list[index],
                "options": generateOptions([
                  "Intact",
                  "Minimal Impairment",
                  "Moderately Impaired",
                  "Severely Impaired",
                  "Unable to test/NA",
                ])
              };
            },
          )
        ]
      },
      {
        'question_type_id': 320573002,//420683002,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Cognitive Status</b>",
        "code": "",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
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
              "selected": false
            };
          })
        ]
      },
      {
        'question_type_id': 320573003,//420683003,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Neurological Status</b>",
        "code": "",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": generateOptions([
          'No Deficits',
          'Describe Deficits',
        ],textFieldPopup: [1])
      },
    ]
  };

  static Map<String, dynamic> priorLevelOfFunction = {
    "template_name": "Occupational Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Prior Level of Function",
    "formId": 32,
    "subFormId": 574,
    'questions': [
      {
        'question_type_id': 320574001, //0020056001,
        "type": "TEXTAREA",
        "title": "<b>PRIOR LEVEL OF FUNCTION</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 320574002,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String, dynamic> adlAssessment = {
    "template_name": "Occupational Therapy Evaluation",
    "cols": 2,
    "title": "ADLs",
    "formId": 32,
    "subFormId": 578,
    'questions': [
      {
        'question_type_id': 320578001,
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
        'question_type_id': 320578002,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "title": "<b>Grooming:</b>",
        "description":
        "Current ability to tend safely to personal hygiene needs (specifically: washing face and hands, hair care, shaving or make up, teeth or denture care, or fingernail care).",
        "answer_id": 0,
        "question_options": generateOptions([
          "Able to groom self unaided, with or without the use of assistive devices or adapted methods.",
          "Grooming utensils must be placed within reach before able to complete grooming activities.",
          "Someone must assist the patient to groom self.",
          "Patient depends entirely upon someone else for grooming needs.",
        ]),
      },
      {
        'question_type_id': 320578003,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "title":
        "Current <b>Ability to Dress <u>Upper</u> Body </b>safely (with or without dressing aids) including undergarments, pullovers, front-opening shirts and blouses, managing zippers, buttons, and snaps:",
        "answer_id": 0,
        "question_options": generateOptions([
          'Able to get clothes out of closets and drawers, put them on and remove them from the upper body without assistance.',
          'Able to dress upper body without assistance if clothing is laid out or handed to the patient.',
          'Someone must help the patient put on upper body clothing.',
          'Patient depends entirely upon another person to dress the upper body.',
        ]),
      },
      {
        'question_type_id': 320578004,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "title":
        "Current <b>Ability to Dress <u>Lower</u> Body</b> safely (with or without dressing aids) including undergarments, slacks, socks or nylons, shoes:",
        "answer_id": 0,
        "question_options": generateOptions([
          'Able to obtain, put on, and remove clothing and shoes without assistance.',
          'Able to dress lower body without assistance if clothing and shoes are laid out or handed to the patient.',
          'Someone must help the patient put on undergarments, slacks, socks or nylons, and shoes.',
          'Patient depends entirely upon another person to dress lower body.',
        ]),
      },
      {
        'question_type_id': 320578005,
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
        'question_type_id': 320578006,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
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
        'question_type_id': 320578007,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "title": "<b>Toileting Hygiene:</b>",
        "description":
        "Current ability to maintain perineal hygiene safely, adjust clothes and/or incontinence pads before and after using toilet, commode, bedpan, urinal. If managing ostomy, includes cleaning area around stoma, but not managing equipment.",
        "answer_id": 0,
        "question_options": generateOptions([
          "Able to manage toileting hygiene and clothing management without assistance.",
          "Able to manage toileting hygiene and clothing management without assistance if supplies/implements are laid out for the patient.",
          "Someone must help the patient to maintain toileting hygiene and/or adjust clothing.",
          "Patient depends entirely upon another person to maintain toileting hygiene.",
        ]),
      },
      {
        'question_type_id': 320578008,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "title": "<b> Feeding or Eating:</b>",
        "description":
        "Current ability to feed self meals and snacks safely. Note: This refers only to the process of <u>eating</u>, <u>chewing</u>, and <u>swallowing</u>, not <u>preparing</u> the food to be eaten.",
        "answer_id": 0,
        "question_options": generateOptions([
          "Able to independently feed self.",
          "Able to feed self independently but requires <br>(a) meal set-up; <u>OR</u> <br> (b) intermittent assistance or supervision from another person; <u>OR</u><br>(c) a liquid, pureed or ground meat diet.",
          "<u>Unable</u> to feed self and must be assisted or supervised throughout the meal/snack.",
          "Able to take in nutrients orally and receives supplemental nutrients through a nasogastric tube or gastrostomy",
          "<u>Unable</u> to take in nutrients orally and is fed nutrients through a nasogastric tube or gastrostomy.",
          "Unable to take in nutrients orally or by tube feeding.",
        ]),
      },
    ]
  };

}
