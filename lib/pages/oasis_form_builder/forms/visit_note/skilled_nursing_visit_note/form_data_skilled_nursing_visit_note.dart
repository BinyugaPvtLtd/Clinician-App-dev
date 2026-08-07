import '../../generate_options.dart';

class FormDataSkilledNursingVisitNote {
  static Map<int, Map<String, dynamic>> drawerItems = {
    4: patientHistory,
    3: clinicalRecordItems,
    8: vitalSigns,
    9: pain,
    12: neurologicalCognitive,
    15: respiratory,
    16: cardioVascular,
    17: genitourinary,
    18: gastrointestinalNutritionEndocrine,
    19: integumentary,
    21: musculoskeletal,
    26: infusionLabDrawn,
    29: interventionEducationProvided,
    30: assessmentSummary,
    31: supplies,
    33: carePlanningCoordination,
    38: supervision,
  };
  static Map<String, dynamic> patientHistory = {
    "template_name": "Skilled Nursing Visit Note",
    "cols": 2,
    "title": "Patient History & Signature",
    "formId": 36,
    "subFormId": 602,
    "questions": [
      {
        'question_type_id': 0360602001, //0651105001,
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
        'question_type_id': 0360602002, //0651105002,
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
        ], textFieldPopup: [
          1
        ])
      },
      {
        'question_type_id': 0360602003, //0651105003,
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
        ], textFieldPopup: [
          1
        ])
      },
      {
        'question_type_id': 0360602004, //0651105003,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Signs or symptoms or new diagnosis of infection since last visit?</b>",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "No",
          "Yes",
        ], textFieldPopup: [
          1
        ])
      },
    ]
  };

  static Map<String, dynamic> clinicalRecordItems = {
    "template_name": "Skilled Nursing Visit Note",
    "cols": 2,
    "title": "Clinical Record Items",
    "formId": 36,
    "subFormId": 603,
    "questions": [
      {
        'question_type_id': 0360603001, //0651106001,
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
        'question_type_id': 0360603002, //0651106002,
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


  static Map<String, dynamic> pain = {
    "template_name": "Skilled Nursing Visit Note",
    "cols": 2,
    "title": "Pain",
    "formId": 36,
    "subFormId": 605,
    "questions": [
      {
        'question_type_id': 0360605001, //571045001,
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
        'question_type_id': 0360605002, //571045002,
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
        'question_type_id': 0360605003, //30079003,
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
        'question_type_id': 0360605004, //571045004,
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
        'question_type_id': 0360605005, //571045008,
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
        'question_type_id': 0360605006, //571045009,
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
        'question_type_id': 0360605007, //571045010,
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
        'question_type_id': 0360605008, //571045011,
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
        'question_type_id': 0360605009, //571045012,
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
        'question_type_id': 0360605010, //571045013,
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
        'question_type_id': 0360605011, //571045014,
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

  static Map<String, dynamic> vitalSigns = {
    "template_name": "Skilled Nursing Visit Note",
    "cols": 2,
    "title": "Vital Signs, Height & Weight",
    "formId": 36,
    "subFormId": 604,
    'questions': [
      {
        'question_type_id': 0360604001, //30080001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>VITAL SIGNS</b>",
        "code": "",
        "description": "",
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
            "scroll_axis": 'HORIZONTAL',
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
              {"index": 0, "label": '', "selected": false,}
            ]
          },
        ]
      },
      {
        'question_type_id': 0360604002, //571046002,
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
        'question_type_id': 0360604003,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Height and Weight - While measuring, if the number is X.1- X.4 round down; X.5 or greater round up</b>",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "type": 'TEXTFIELD',
            'question_id': 1,
            "options_alignment": "HORIZONTAL",
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false}
            ]
          },
          {
            "type": 'TEXTFIELD',
            'question_id': 2,
            "options_alignment": "HORIZONTAL",
            "selected": false,
            "options": [
              {"index": 0, "label": '', "selected": false}
            ]
          },
          {
            "type": 'CHECKBOX',
            'question_id': 3,
            "options_alignment": "HORIZONTAL",
            "selected": false,
            "options": [
              {
                "index": 0,
                "label": '<b>Not Measured This Visit</b>',
                "selected": false
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 0360604004,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>BMI</b>",
        "code": "",
        "description": "",
        "scroll_axis": "HORIZONTAL",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          {"index": 0, "label": '', "value": ''}
        ]
      },
    ]
  };

  static Map<String, dynamic> neurologicalCognitive = {
    "template_name": "Skilled Nursing Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Neurological/Cognitive",
    "formId": 36,
    "subFormId": 606,
    "questions": [
      {
        'question_type_id': 0360606001, //10012005,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Neurological Status</b>",
        "code": "",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "type": 'TEXTFIELD',
            "question_id": 1,
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "title": "Pupillary Reaction",
            "options": [
              {"index": 0, "value": '', "label": 'R:', "selected": false},
            ]
          },
          {
            "type": 'TEXTFIELD',
            "question_id": 2,
            "group_options": true,
            "scroll_axis": "VERTICAL",
            "options_alignment": "VERTICAL",
            "title": "",
            "options": [
              {"index": 0, "value": '', "label": 'L:', "selected": false}
            ]
          },
          {
            "type": 'RADIO',
            "question_id": 3,
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "title": "Hand dominance:",
            "options": [
              {"index": 0, "value": 'R:', "label": 'R:', "selected": false},
              {"index": 1, "value": 'L:', "label": 'L:', "selected": false}
            ]
          },
          {
            "type": 'CHECKBOX',
            "question_id": 4,
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "title": "Grip strength:",
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = ['Strong', 'Weak', 'Equal', 'Unequal (specify)'];
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
            "type": 'CHECKBOX',
            "question_id": 5,
            "group_options": true,
            "options_alignment": "HORIZONTAL",
            "title": "",
            "options": [
              {
                "index": 0,
                "value": 'No Deficits',
                "label": 'No Deficits',
                "selected": false
              }
            ]
          },
          {
            "type": 'CHECKBOX',
            "question_id": 6,
            "group_options": true,
            "options_alignment": "HORIZONTAL",
            "title": "",
            "options": [
              ...List.generate(
                6,
                (index) {
                  var list = [
                    'Loss of balance',
                    'Vertigo',
                    'Spasms',
                    'Seizures/Tremors',
                    'Facial droop',
                    'Numbness/Tingling'
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
            "type": 'CHECKBOX',
            "question_id": 7,
            "group_options": true,
            "options_alignment": "HORIZONTAL",
            "title": "",
            "options": [
              {
                "index": 0,
                "value": 'Headache (frequency/duration)',
                "label": 'Headache (frequency/duration)',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              }
            ]
          },
          {
            "type": 'CHECKBOX',
            "question_id": 8,
            "group_options": true,
            "options_alignment": "HORIZONTAL",
            "title": "",
            "options": [
              {
                "index": 0,
                "value": 'Speech disturbance',
                "label": 'Speech disturbance',
                "selected": false
              }
            ]
          },
          {
            "type": 'CHECKBOX',
            "question_id": 9,
            "group_options": true,
            "options_alignment": "HORIZONTAL",
            "title": "",
            "options": [
              ...List.generate(
                3,
                (index) {
                  var list = [
                    'Weakness/paralysis:',
                    'R',
                    'L',
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
            "type": 'TEXTFIELD',
            "question_id": 10,
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "title": "Location:",
            "options": [
              {"index": 0, "value": '', "label": '', "selected": false},
            ]
          },
          {
            "type": 'CHECKBOX',
            "question_id": 11,
            "group_options": true,
            "options_alignment": "HORIZONTAL",
            "title": "",
            "options": [
              {
                "index": 0,
                "value": 'Other',
                "label": 'Other',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 0360606002,
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
    ]
  };

  static Map<String, dynamic> respiratory = {
    "template_name": "Skilled Nursing Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Respiratory",
    "formId": 36,
    "subFormId": 607,
    "questions": [
      {
        'question_type_id': 0360607001, //10015005,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Respiratory Status</b>",
        "code": "",
        "description": "",
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
                'Cough:',
                'Productive',
                'Dry',
                'Chronic',
                'Orthopnea',
                'Hemoptysis',
                'Cyanosis',
                'Sputum (color)',
                'Other',
              ];
              return {
                "index": index,
                "label": list[index],
                "value": '',
                "selected": false,
                if (index == 7 || index == 8) "popup_code": "TEXTFIELDPOPUP"
              };
            },
          )
        ]
      },
      {
        'question_type_id': 0360607002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Oxygen Use</b>",
        "code": "",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": '',
                "value": '',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 2,
            "type": "INFO",
            "title": "L/min",
            "group_options": true,
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'NA',
                "value": 'NA',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(4, (index) {
              final options = [
                "Nasal Cannula",
                "Mask",
                "PRN",
                "Continuous",
              ];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 4,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(2, (index) {
              final options = ["CPAP", "BiPAP"];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
        ]
      },
      {
        'question_type_id': 0360607003, //10015004,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "",
        "code": "",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Lung Sounds</b>",
            "group_options": true,
            "scroll_axis": 'HORIZONTAL',
            "options": [
              {
                "index": 0,
                "label": 'All clear and present',
                "value": 'All clear and present',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 2,
            "type": "INFO",
            "title": "<b>Lung Sounds</b>",
            "group_options": true,
            "options": [
              ...List.generate(
                5,
                (index) {
                  var list = [
                    'R Upper',
                    'R Middle',
                    'R Lower',
                    'L Upper',
                    'L Lower',
                  ];
                  return {
                    "index": 0,
                    "label": '<b>${list[index]}</b>',
                  };
                },
              )
            ]
          },
          ...List.generate(
            5,
            (index) {
              var list = [
                'Diminished',
                'Absent',
                'Crackles',
                'Rhonchi',
                'Wheezing'
              ];
              return {
                "question_id": index,
                "type": "CHECKBOX",
                "title": list[index],
                "group_options": true,
                "options_alignment": "HORIZONTAL",
                "scroll_axis": "HORIZONTAL",
                "options": [
                  ...List.generate(
                    5,
                    (index) {
                      return {
                        "index": index,
                        "label": '',
                        "value": '',
                        "selected": false
                      };
                    },
                  )
                ]
              };
            },
          )
        ]
      },
      {
        'question_type_id': 0360607004, //10015006,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "",
        "code": "",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": '<b>Tracheostomy</b>',
            "group_options": true,
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {"index": 0, "value": "", "label": "NA", "selected": false}
            ]
          },
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "title": '',
            "group_options": true,
            "options_alignment": "HORIZONTAL",
            // "scroll_axis": "HORIZONTAL",
            "options": [
              {"index": 0, "value": "", "label": "", "selected": false}
            ]
          },
        ]
      }
    ]
  };

  static Map<String, dynamic> cardioVascular = {
    "template_name": "Skilled Nursing Visit Note",
    "cols": 2,
    "title": "Cardiovascular",
    "formId": 36,
    "subFormId": 608,
    "questions": [
      {
        'question_type_id': 0360608001, //10016002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Cardiovascular Status</b>",
        "code": "",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(2, (index) {
              final options = [
                "Normal heart sounds",
                "Abnormal heart sounds",
              ];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
                if (index == 1) "popup_code": "TEXTFIELDPOPUP"
              };
            })
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(2, (index) {
              final options = [
                "Chest pain",
                "Fatigues Easily",
              ];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Arrhythmia',
                "value": 'Arrhythmia',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              },
            ]
          },
          {
            "question_id": 4,
            "type": "CHECKBOX",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Capillary Refill:',
                "value": 'Capillary Refill:',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 5,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(2, (index) {
              final options = [
                "< 3 Sec",
                "> 3 Sec",
              ];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 6,
            "type": "CHECKBOX",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Compression Stockings',
                "value": 'Compression Stockings',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 7,
            "type": "CHECKBOX",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Pedal pulses: ',
                "value": 'Pedal pulses: ',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 8,
            "type": "TEXTFIELD",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(2, (index) {
              final options = [
                "R:",
                "L:",
              ];
              return {
                "index": index,
                "label": options[index],
                "value": '',
                "selected": false,
              };
            })
          },
          {
            "question_id": 9,
            "type": "CHECKBOX",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Edema:',
                "value": 'Edema:',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 10,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(4, (index) {
              final options = ["Pedal", "R", "L", "Dependent"];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 11,
            "type": "CHECKBOX",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Right ankle pitting edema:',
                "value": 'Right ankle pitting edema:',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 12,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(4, (index) {
              final options = ["+1", "+2", "+3", "+4"];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 13,
            "type": "CHECKBOX",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Right calf pitting edema:',
                "value": 'Right calf pitting edema:',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 14,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(4, (index) {
              final options = ["+1", "+2", "+3", "+4"];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 15,
            "type": "CHECKBOX",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Left ankle pitting edema:',
                "value": 'Left ankle pitting edema:',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 16,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(4, (index) {
              final options = ["+1", "+2", "+3", "+4"];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 17,
            "type": "CHECKBOX",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Left calf pitting edema:',
                "value": 'Left calf pitting edema:',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 18,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(4, (index) {
              final options = ["+1", "+2", "+3", "+4"];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 19,
            "type": "CHECKBOX",
            "title": "",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Other',
                "value": 'Other',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              },
            ]
          },
        ]
      },
      {
        'question_type_id': 0360608002, //10016002,
        "type": "INFO",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "title": " ",
        "answer_id": 0,
      },
    ]
  };

  static Map<String, dynamic> genitourinary = {
    "template_name": "Skilled Nursing Visit Note",
    "cols": 2,
    "title": "Genitourinary",
    "formId": 36,
    "subFormId": 609,
    "questions": [
      {
        'question_type_id': 0360609001, //10017004,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "",
        "code": "",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Genitourinary Status</b>",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(8, (index) {
              final options = [
                "Voiding without Problems",
                "Frequency",
                "Urgency",
                "Pain",
                "Burning",
                "Foul odor",
                "Anuria",
                "Reports active UTI"
              ];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "<b>Urine Color</b>",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(7, (index) {
              final options = [
                "Yellow",
                "Clear",
                "Cloudy",
                "Red/Pink",
                "Dark Yellow",
                "Brown",
                "Other"
              ];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
                if (index == 6) "popup_code": "TEXTFIELDPOPUP"
              };
            })
          },
        ]
      },
      {
        'question_type_id': 0360609002, //10017005,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "",
        "code": "",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "INFO",
            "title": "<b>Catheter</b>",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'NA',
                "value": 'NA',
                "selected": false,
              }
            ]
          },
          // --
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Foley size:',
                "value": 'Foley size:',
                "selected": false,
              }
            ]
          },
          {
            "question_id": 4,
            "type": "TEXTFIELD",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": '',
                "value": '',
                "selected": false,
              }
            ]
          },
          // --
          {
            "question_id": 5,
            "type": "DATE",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": '',
                "value": '',
                "selected": false,
              }
            ]
          },
          //
          {
            "question_id": 6,
            "type": "TEXTFIELD",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": '',
                "value": '',
                "selected": false,
              }
            ]
          },
          {
            "question_id": 7,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Irrigation:',
                "value": 'Irrigation:',
                "selected": false,
              }
            ]
          },
          {
            "question_id": 8,
            "type": "TEXTFIELD",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": '',
                "value": '',
                "selected": false,
              }
            ]
          },
          // ---
          {
            "question_id": 9,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "VERTICAL",
            "group_options": true,
            "options": List.generate(2, (index) {
              final options = [
                "Self Catheterization <i>(Cath size, frequency)</i>",
                "Other",
              ];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              };
            })
          },
        ]
      },
    ]
  };

  static Map<String, dynamic> gastrointestinalNutritionEndocrine = {
    "template_name": "Skilled Nursing Visit Note",
    "cols": 2,
    "title": "Gastrointestinal/Nutrition/Endocrine",
    "formId": 36,
    "subFormId": 610,
    'questions': [
      {
        'question_type_id': 0360610001, //10018002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Gastrointestinal Status</b>",
        "code": "",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "DATE",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Last BM',
                "value": '',
                "selected": false,
              }
            ]
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "BM consistency:",
            "code": "",
            "description": "",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = ['Soft', 'Hard', 'Formed', 'Mucous'];
                  return {
                    "index": index,
                    "label": list[index],
                    "value": "",
                    "selected": false
                  };
                },
              ),
            ]
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "title": "Bowel Sounds:",
            "code": "",
            "description": "",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = ['Normal', 'Hyperactive', 'Diminished', 'Absent'];
                  return {
                    "index": index,
                    "label": list[index],
                    "value": "",
                    "selected": false
                  };
                },
              ),
            ]
          },
          {
            "question_id": 4,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(8, (index) {
              final options = [
                "Constipation",
                "Diarrhea",
                "Incontinence",
                "Abdominal pain/tenderness",
                "Abdominal distention",
                "Indigestion",
                "Nausea",
                "Vomiting"
              ];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 5,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Ostomy (type)',
                "value": '',
                "selected": false,
              }
            ]
          },
          {
            "question_id": 6,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(4, (index) {
              final options = ["Colostomy", "Ileostomy", "Urostomy", "Other"];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
                if (index == 3) "popup_code": "TEXTFIELDPOPUP"
              };
            })
          },
          {
            "question_id": 7,
            "type": "CHECKBOX",
            "title": "Stoma:",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(3, (index) {
              final options = ["Pink", "Red", "Moist"];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 8,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(2, (index) {
              final options = ["Self care", "Needs assistance"];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          },
          {
            "question_id": 9,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Other',
                "value": '',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 0360610002, //10018005,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Appetite</b>",
        "code": "",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(
              4,
              (index) {
                var list = ["Good", "Fair", "Poor", "Anorexic"];
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
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Difficulty swallowing',
                "value": '',
                "selected": false
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 0360610003,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "",
        "code": "",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Enteral Feeding</b>",
            "code": "",
            "description": "",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {"index": 0, "label": 'NA', "value": '', "selected": false}
            ]
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "Type/Amount:",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "options": [
              {"index": 0, "label": '', "value": '', "selected": false}
            ]
          },
          {
            "question_id": 3,
            "type": "DATE",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Insertion Date:',
                "value": '',
                "selected": false
              }
            ]
          },
          {
            "question_id": 4,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Placement verified',
                "value": '',
                "selected": false
              }
            ]
          },
          {
            "question_id": 5,
            "type": "TEXTFIELD",
            "title": "Residual amount:",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "options": [
              {"index": 0, "label": '', "value": '', "selected": false}
            ]
          },
        ]
      },
      {
        'question_type_id': 0360610004,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Endocrine Status</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(["NA"])
          },
          {
            "question_id": 2,
            "type": "RADIO",
            "title": "Blood glucose monitoring performed by:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(["Patient", "No"], textFieldPopup: [1])
          },
          {
            "question_id": 3,
            "type": "RADIO",
            "title": "Any reported/observed hyper/hypoglycemic symptoms?",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(["Yes", "No"], textFieldPopup: [0])
          },
          {
            "question_id": 3,
            "type": "RADIO",
            "title": "Any diabetic foot inspection findings/changes?",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(["Yes", "No"], textFieldPopup: [0])
          }
        ]
      },
    ]
  };

  static Map<String, dynamic> musculoskeletal = {
    "template_name": "Skilled Nursing Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Musculoskeletal",
    "formId": 36,
    "subFormId": 612,
    "questions": [
      {
        'question_type_id': 0360612001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "title": "<b>Musculoskeletal Status</b>",
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions([
          "Atrophy",
          "Decreased ROM",
          "Paraplegia",
          "Swollen/painful joints",
          "Hemiplegia",
          "Paresthesia",
          "Quadriplegia",
          "Contractures",
          "Abnormal Gait",
          "Abnormal balance Weakness",
          "Other",
        ],textFieldPopup: [10])
      },
      {
        'question_type_id': 0360612002,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "group_options": true,
        "dynamic_type": false,
        "title": "<b>MD - Ordered Restrictions</b>",
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "questions": [
          {
            "type": 'CHECKBOX',
            "question_id": 1,
            "group_options": false,
            "options": [
              {
                "index": 0,
                "label": "No Weightbearing Restrictions",
                "value": "No Weightbearing Restrictions",
                "selected": false,
              }
            ]
          },
          {
            "type": 'CHECKBOX',
            "question_id": 2,
            "group_options": false,
            "options": List.generate(5, (index) {
              final list = ["As Tolerated (WBAT)", "LLE", "RLE", "LUE", "RUE"];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
              };
            })
          },
          {
            "type": 'CHECKBOX',
            "question_id": 3,
            "group_options": false,
            "options": List.generate(3, (index) {
              final list = [
                "Toe Touch (TTWB)",
                "LLE",
                "RLE",
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
              };
            })
          },
          {
            "type": 'CHECKBOX',
            "question_id": 4,
            "group_options": false,
            "options": List.generate(5, (index) {
              final list = ["Partial (PWB)", "LLE", "RLE", "LUE", "RUE"];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
              };
            })
          },
          {
            "type": 'CHECKBOX',
            "question_id": 5,
            "group_options": false,
            "options": List.generate(5, (index) {
              final list = [
                "No Weightbearing (NWB):",
                "LLE",
                "RLE",
                "LUE",
                "RUE"
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
              };
            })
          },
        ]
      },
    ]
  };

  static Map<String, dynamic> infusionLabDrawn = {
    "template_name": "Skilled Nursing Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Infusion/Lab Draw",
    "formId": 36,
    "subFormId": 613,
    'questions': [
      {
        'question_type_id': 0360613001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": "This page is not applicable",
            "selected": false,
          }
        ]
      },
      {
        'question_type_id': 0360613002,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Lab Draws<b>",
            "options": [
              {
                "index": 0,
                "label": "NA",
                "selected": false,
              }
            ]
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": " Blood draw site:",
            "options": [
              {
                "index": 0,
                "value": "",
                "hint": " ",
              }
            ]
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "title": " Lab drawn:",
            "options": List.generate(4, (index) {
              final list = [
                "CBC",
                "Chem 7",
                "PT/INR",
                "Other",
              ];
              return {
                "index": index,
                "label": list[index],
                "selected": index == 3 ? true : false,
                if (index == 3) "popup_code": "TEXTFIELDPOPUP",
              };
            })
          }
        ]
      },
      {
        'question_type_id': 0360613003,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b> Venous Access Devices<b>",
            "options": [
              {
                "index": 0,
                "label": "NA",
                "selected": false,
              }
            ]
          },
          {
            "question_id": 2,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "Insertion Date:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 3,
            "type": "STATIC",
            "group_options": false,
            "options": List.generate(9, (index) {
              final list = [
                "Peripheral line",
                "Midline catheter",
                "Central line",
                "PICC",
                "Port",
                "Groshong",
                "Non-Groshong",
                "Tunneled",
                "Non-Tunneled",
              ];
              return {
                "index": index,
                "label": list[index],
                "selected": index == 3 ? true : false,
              };
            }),
          },
          {
            "question_id": 4,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Size/gauge/length:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 5,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Single lumen",
              "Double lumen",
              "Triple lumen",
            ]),
          },
          {
            "question_id": 6,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "External Cath Length:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 7,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": " Insertion Site:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 8,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Mid arm circumference:",
            "options": [
              {"index": 0, "value": "", "hint": "cm"}
            ]
          },
          {
            "question_id": 9,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Dressing Type:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 10,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "Last performed:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 11,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Performed by:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
        ]
      },
      {
        'question_type_id': 0360613004,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Infusion Therapy<b>",
            "options": [
              {
                "index": 0,
                "label": "NA",
                "selected": false,
              }
            ]
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "title": "Type of infusion therapy:",
            "group_options": false,
            "options": generateOptions([
              "Antibiotics",
              "Pain Control",
              "Other",
            ], textFieldPopup: [
              2
            ]),
          },
          {
            "question_id": 3,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Cap change frequency:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 4,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "Last performed:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 5,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Performed by:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 6,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Catheter flush frequency:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 7,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "Last performed:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 8,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Performed by:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 9,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Tubing change details:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 10,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Infusion/therapy administered this visit:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 11,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Administration/Pump details:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
        ]
      },
      {
        'question_type_id': 0360613005,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "title": "<b>Additional Comments:</b>",
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": "",
            "value": "",
          }
        ]
      },
    ]
  };

  static Map<String, dynamic> integumentary = {
    "template_name": "Skilled Nursing Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Integumentary/Wound Care",
    "formId": 36,
    "subFormId": 611,
    'questions': [
      {
        'question_type_id': 0360611001,
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
          {
            "question_id": 4,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Wound(s) Identified?",
            "group_options": true,
            "options": List.generate(2, (index) {
              final labelList = [
                "No",
                "Yes (complete wound information below)",
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
        'question_type_id': 0360611002,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
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
        'question_type_id': 0360611003,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Drag and drop a label to the appropriate wound location</b>",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 0,
            "type": "Dragg",
            "options": [
              {"index": 0, "value": "", "label": "1", "selected": false}
            ],
          }
        ]
      },
      {
        'question_type_id': 0360611004,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Pressure relief device(s) in use</b>",
            "scroll_axis": "HORIZONTAL",
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
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "options": List.generate(4, (index) {
              final list = [
                "Mattress",
                "Overlay",
                "WC Cushion",
                "Other",
              ];
              return {
                "index": index,
                "value": list[index],
                "label": list[index],
                "selected": false,
                if (index == 3) "popup_code": "TEXTFIELDPOPUP",
              };
            }),
          }
        ]
      },
      {
        'question_type_id': 0360611005,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Pressure Injury Risk</b>",
            "scroll_axis":"HORIZONTAL",
            "options": generateOptions(['Not assessed this visit'])
          },
          {
            "question_id": 2,
            "type": "STATIC",
            "options": [
              {
                "index": 0,
                "value": "Braden Scale:",
                "label": "Braden Scale:",
                "selected": false,
              },
              {
                "index": 1,
                "value": "",
                "label": "Score:",
              },
              {
                "index": 2,
                "value": "",
                "label": "Interpretation:",
              }
            ]
          },
          {
            "type": "STATIC",
            "question_id": 3,
            "options": [
              {
                "index": 0,
                "value": "Other Scale:",
                "label": "Other Scale:",
                "selected": false,
              },
              {
                "index": 1,
                "value": "",
                "label": "Score:",
              },
              {
                "index": 2,
                "value": "",
                "label": "Interpretation:",
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 0360611006,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "title": "<b>Wound#1</b>",
        "questions": [
          {
            "question_id": 1,
            "type": "ADDWOUNDIMAGE",
            "title": "<b>Uploaded</b>",
            "scroll_axis": "HORIZONTAL",
            "options": [
                  
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
            "type": "DROPDOWN",
            "title": "Type:",
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options": List.generate(9, (index) {
              final list = [
                "Skin Lesion",
                "Skin Tear",
                "Pressure Ulcer/Injury",
                "Surgical Wound",
                "Diabetic Ulcer",
                "Venous Ulcer",
                "Arterial Ulcer",
                "Trauma Wound",
                "Other",
              ];
              return {
                "index": index,
                "label": list[index],
                "selected": false,
              };
            }),
          },
          {
            "question_id": 4,
            "type": "DROPDOWN",
            "title": "Wound Status:",
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options": List.generate(2, (index) {
              final list = [
                "Open",
                "Closed",
              ];
              return {
                "index": index,
                "label": list[index],
                "selected": false,
              };
            }),
          },
          {
            "question_id": 5,
            "type": "DROPDOWN",
            "title": "Stage:",
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options": List.generate(7, (index) {
              final list = [
                "Healed/ Resurfaced Pressure",
                "Stage 1 Pressure Injury",
                "Stage 2 Pressure Ulcer/ Injury",
                "Stage 3 Pressure Ulcer/ Injury",
                "Stage 4 Pressure Ulcer/ Injury",
                "Unstageable Pressure Ulcer/ Injury",
                "Deep Tissue Injury",
              ];
              return {
                "index": index,
                "label": list[index],
                "selected": false,
              };
            }),
          },
          {
            "question_id": 6,
            "type": "TEXTFIELD",
            "options": [
              {
                "index": 0,
                "label": "Length:",
                "hint": "cm",
                "value": "",
              },
              {
                "index": 1,
                "label": "Width:",
                "hint": "cm",
                "value": "",
              },
              {
                "index": 2,
                "label": "Sq. cm:",
                "hint": "cm",
                "value": "",
              },
              {
                "index": 3,
                "label": "Depth:",
                "hint": "cm",
                "value": "",
              },
              {
                "index": 4,
                "label": "Undermining",
                "value": "",
              },
              {
                "index": 5,
                "label": "Tunneling",
                "value": "",
              },
            ]
          },
          {
            "question_id": 7,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "title": "Periwound Skin",
            "options": List.generate(10, (index) {
              final list = [
                "Normal ",
                "Pale",
                "Maceration",
                "Excoriation",
                "Red",
                "Purple",
                "Warm",
                "Edema",
                "Cool",
                "Other",
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
                if (index == 9) "popup_code": "TEXTFIELDPOPUP",
              };
            }),
          },
          {
            "question_id": 8,
            "type": "DROPDOWN",
            "title": "Wound Bed Color:",
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options": List.generate(7, (index) {
              final list = [
                "Closed/ resurface",
                "White",
                "Gray",
                "Pink",
                "Red",
                "Tan",
                "Black",
              ];
              return {
                "index": index,
                "label": list[index],
                "selected": false,
              };
            }),
          },
          {
            "question_id": 9,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "title": "Periwound Skin",
            "options": List.generate(8, (index) {
              final list = [
                "Bloody",
                "Granular",
                "Sloughing",
                "Weeping",
                "Necrotic",
                "Healthy",
                "Eschar",
                "Other",
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
                if (index == 7) "popup_code": "TEXTFIELDPOPUP",
              };
            }),
          },
          {
            "question_id": 10,
            "type": "DROPDOWN",
            "title": "Drainage Type:",
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options": List.generate(6, (index) {
              final list = [
                "None",
                "Bloody",
                "Serosanguineous",
                "Serous",
                "purulent",
                "Other:",
              ];
              return {
                "index": index,
                "label": list[index],
                "selected": false,
              };
            }),
          },
          {
            "question_id": 11,
            "type": "DROPDOWN",
            "title": "Drainage Amount:",
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options": List.generate(5, (index) {
              final list = [
                "None",
                "Scant",
                "Small",
                "Moderate",
                "Large",
              ];
              return {
                "index": index,
                "label": list[index],
                "selected": false,
              };
            }),
          },
          {
            "question_id": 12,
            "type": "DROPDOWN",
            "title": "Drainage Odor:",
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options": List.generate(4, (index) {
              final list = [
                "None",
                "Sweet",
                "Foul",
                "Other",
              ];
              return {
                "index": index,
                "label": list[index],
                "selected": false,
              };
            }),
          },
          {
            "question_id": 13,
            "type": "CHECKBOX",
            "options": [
              {
                "index": 0,
                "value": "",
                "label": "Patient Tolerated Wound Care Well",
                "selected": false,
              },
            ]
          },
        ]
      },
    ]
  };

  static Map<String, dynamic> interventionEducationProvided = {
    "template_name": "Skilled Nursing Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Interventions/Education Provided",
    "formId": 36,
    "subFormId": 614,
    'questions': [
      {
        "question_type_id": 0360614001, //571063002,
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
              "group_options": true,
              "options": index == 1 || index == 2
                  ? generateOptions(["<b>Met</b>", "<b>Not Met</b>"])
                  : generateOptions(["<b>Provided</b>", "<b>Not Provided</b>"],
                      textFieldPopup: [0]),
            };
          })
        ]
      },
    ]
  };

  static Map<String, dynamic> assessmentSummary = {
    "template_name": "Skilled Nursing Visit Note",
    "cols": 2,
    "title": "Assessment Summary",
    "formId": 36,
    "subFormId": 615,
    'questions': [
      {
        'question_type_id': 0360615001, //0651107001,
        "type": "ACTIONBUTTON",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['Generate Summary']),
      },
      {
        'question_type_id': 0360615002, //0651107001,
        "type": "TEXTAREA",
        "title": "<b>Assessment</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 0360615003, //,140437007,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
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
        'question_type_id': 0360615004, //0651107004,
        "type": "TEXTAREA",
        "title": "<b>Ongoing skilled need</b>",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
    ]
  };

  static Map<String, dynamic> supplies = {
    "template_name": "Skilled Nursing Visit Note",
    "template_code": "",
    "cols": 2,
    "title": "Supplies",
    "formId": 36,
    "subFormId": 616,
    'questions': [
      {
        'question_type_id': 0360616001,
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
                "label": "Supplies Issued/Used this visit:",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 0360616002,
        "type": "ACTIONBUTTON",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": "Order Supplies",
            "value": "",
          }
        ],
      },
    ]
  };

  static Map<String, dynamic> carePlanningCoordination = {
    "template_name": "Skilled Nursing Visit Note",
    "cols": 2,
    "title": "Care Planning/Coordination",
    "formId": 36,
    "subFormId": 617,
    'questions': [
      {
        'question_type_id': 0360617001, //0651109003,
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
        ], textFieldPopup: [
          4
        ]),
      },
      {
        'question_type_id': 0360617002, //0651109005,
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
    ]
  };

  static Map<String, dynamic> supervision = {
    "template_name": "Skilled Nursing Visit Note",
    "cols": 1,
    "title": "Supervision",
    "formId": 36,
    "subFormId": 618,
    'questions': [
      {
        "question_type_id": 0360618001, //571065001,
        "dynamic_type": true,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "options": generateOptions(
          [
            "This page is not applicable",
          ],
        ),
      },
      {
        "question_type_id": 0360618002, //571065002,
        "dynamic_type": false,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "questions": [
          {
            'question_id': 1,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Supervisory visit for:",
            "options": generateOptions(
              ['LVN', 'HHA'],
            ),
          },
          {
            'question_id': 2,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Present on this visit?",
            "options": generateOptions(
              ['No', 'Yes'],
            ),
          },
          {
            'question_id': 3,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Patient/caregiver satisfied with care?",
            "options": generateOptions(['Yes', 'No (specify details)'],
                textFieldPopup: [1]),
          },
          {
            'question_id': 4,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Establishes good interpersonal relationships?",
            "options": generateOptions(['Yes', 'No (specify details)'],
                textFieldPopup: [1]),
          },
          {
            'question_id': 5,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Demonstrating competency with assigned tasks?",
            "options": generateOptions(['Yes', 'No (specify details)'],
                textFieldPopup: [1]),
          },
          {
            'question_id': 6,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Following care plan?",
            "options": generateOptions(['Yes', 'No (specify details)'],
                textFieldPopup: [1]),
          },
          {
            'question_id': 7,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Following infection control policies procedures?",
            "options": generateOptions(['Yes', 'No (specify details)'],
                textFieldPopup: [1]),
          },
          {
            'question_id': 8,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Reports changes in patient’s condition to supervisor?",
            "options": generateOptions(['Yes', 'No (specify details)'],
                textFieldPopup: [1]),
          },
          {
            'question_id': 9,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Honors patient's rights?",
            "options": generateOptions(['Yes', 'No (specify details)'],
                textFieldPopup: [1]),
          },
          {
            'question_id': 10,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Patient’s needs being met with current care plan?",
            "options": generateOptions(['Yes', 'No (specify details)'],
                textFieldPopup: [1]),
          },
          {
            'question_id': 11,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Patient/caregiver agree with changes to care plan?",
            "options": generateOptions(
              ['Yes', 'No', 'NA, no changes to plan'],
            ),
          },
          {
            'question_id': 12,
            "type": "TEXTFIELD",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title":
                "Indicate details of any follow up actions and additional instructions given to caregiver as applicable",
            "options": generateOptions(
              [''],
            ),
          },
          {
            'question_id': 13,
            "type": "TEXTFIELD",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Name:",
            "options": generateOptions(
              [''],
            ),
          },
        ]
      }
    ]
  };
}
