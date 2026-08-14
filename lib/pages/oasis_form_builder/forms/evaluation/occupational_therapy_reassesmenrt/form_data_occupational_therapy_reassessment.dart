import '../../generate_options.dart';

class FormDataOccupationalTherapyReassessment {
  static Map<int, Map<String, dynamic>> drawerItems = {
    4: patientHistory,
    3: clinicalRecordItems,
    41: subjective,
    8: vitalSigns,
    9: pain,
    30: assessmentSummary,
    45: objective,
    38: superVision,
    33: carePlanningCoordination,
    51: summaryForPhysician,
    43: testsScales,
    21: musculoskeletal,
    42: functionalAssessment,
    12: neurologicalCongnitive,
  };
  static Map<String, dynamic> patientHistory = {
    "template_name": "Occupational Therapy Reassessment",
    "cols": 2,
    "title": "Patient History & Signature",
    "formId": 42,
    "subFormId": 678,
    "questions": [
      {
        'question_type_id': 420678001,//0651105001,
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
        'question_type_id': 420678002, //0651105002,
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
        'question_type_id': 420678003, //0651105003,
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
    "template_name": "Occupational Therapy Reassessment",
    "cols": 2,
    "title": "Clinical Record Items",
    "formId": 42,
    "subFormId": 679,
    "questions": [
      {
        'question_type_id': 420679001, //0651106001,
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
        'question_type_id': 420679002, //0651106002,
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
    "template_name": "Occupational Therapy Reassessment",
    "template_code": "",
    "cols": 2,
    "title": "Subjective",
    "formId": 42,
    "subFormId": 680,
    'questions': [
      {
        'question_type_id': 420680001,//571044001,
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
        'question_type_id': 420680002,//571044002,
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

  static Map<String, dynamic> vitalSigns = {
    "template_name": "Occupational Therapy Reassessment",
    "cols": 2,
    "title": "Vital Signs",
    "formId": 42,
    "subFormId": 682,
    'questions': [
      {
        'question_type_id': 420682001, //30080001,
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
              {"index": 0, "label": '', "selected": false,"popup_code":"TEXTFIELDPOPUP"}
            ]
          },
        ]
      },
      {
        'question_type_id': 420682002, //571046002,
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
    ]
  };

  static Map<String, dynamic> pain = {
    "template_name": "Occupational Therapy Reassessment",
    "cols": 2,
    "title": "Pain",
    "formId": 42,
    "subFormId": 681,
    "questions": [
      {
        'question_type_id': 420681001, //571045001,
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
        'question_type_id': 420681002, //571045002,
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
        'question_type_id': 420681003, //30079003,
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
        'question_type_id': 420681004, //571045004,
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
        'question_type_id': 420681005, //571045008,
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
        'question_type_id': 420681006, //571045009,
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
        'question_type_id': 420681007, //571045010,
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
        'question_type_id': 420681008, //571045011,
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
        'question_type_id': 420681009, //571045012,
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
        'question_type_id': 420681010, //571045013,
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
        'question_type_id': 420681011, //571045014,
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

  static Map<String, dynamic> assessmentSummary = {
    "template_name": "Occupational Therapy Reassessment",
    "cols": 2,
    "title": "Assessment",
    "formId": 42,
    "subFormId": 688,
    'questions': [
      {
        'question_type_id': 420688001, //0651107001,
        "type": "TEXTAREA",
        "title": "<b>Assessment</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 420688002,//510901001,
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
    ]
  };

  static Map<String, dynamic> objective = {
    "template_name": "Occupational Therapy Reassessment",
    "cols": 2,
    "title": " Objective",
    "formId": 42,
    "subFormId": 687,
    'questions': [
      {
        "question_type_id": 0420687001,
        "type": "STATIC",
        "dynamic_type": false,
        "question_type": "COMPREHENSIVE",
        "draw_box": false,
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
        'question_type_id': 0420687002,
        "type": "ACTIONBUTTON",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['Exercise Flowsheet']),
      },
    ]
  };

  static Map<String, dynamic> superVision = {
    "template_name": "Occupational Therapy Reassessment",
    "template_code": "",
    "cols": 1,
    "title": "Supervision",
    "formId": 42,
    "subFormId": 690,
    'questions': [
      {
        'question_type_id': 420690001,//510903001,
        "type": "CHECKBOX",
        "code": "",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          {
            "index": 0,
            "value": "This page is not applicable",
            "label": "This page is not applicable",
          }
        ]
      },
      {
        'question_type_id': 420690002,//510903002,
        "type": "STATIC",
        "code": "",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            'question_id': 1,
            "type": "RADIO",
            "code": "",
            "title": "Supervisory visit for:",
            "description": "",
            "dynamic_type": true,
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "answer_id": 0,
            "options": [
              {"index": 0, "value": "LVN", "label": "LVN", "selected": false},
              {"index": 1, "value": "HHA", "label": "HHA", "selected": false}
            ]
          },
          {
            'question_id': 2,
            "type": "RADIO",
            "code": "",
            "title": "Present on this visit?",
            "description": "",
            "dynamic_type": true,
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "answer_id": 0,
            "options": [
              {"index": 0, "value": "No", "label": "No", "selected": false},
              {"index": 1, "value": "Yes", "label": "Yes", "selected": false}
            ]
          },
          ...List.generate(
            8,
                (index) {
              var list = [
                'Patient/caregiver satisfied with care?',
                'Establishes good interpersonal relationships?',
                'Demonstrating competency with assigned tasks?',
                'Following care plan?',
                'Following infection control policies procedures?',
                'Reports changes in patient’s condition to supervisor?',
                'Honors patient\'s rights?',
                'Patient’s needs being met with current care plan?'
              ];
              return {
                'question_id': index + 3,
                "type": "RADIO",
                "code": "",
                "title": list[index],
                "description": "",
                "dynamic_type": true,
                "answer_id": 0,
                "scroll_axis": "HORIZONTAL",
                "options_alignment": "HORIZONTAL",
                "options": [
                  {
                    "index": 0,
                    "value": "Yes",
                    "label": "Yes",
                    "selected": false
                  },
                  {
                    "index": 1,
                    "value": "No (specify details)",
                    "label": "No (specify details)",
                    "selected": false
                  },
                ]
              };
            },
          ),
          {
            'question_id': 11,
            "type": "RADIO",
            "code": "",
            "title": "Present on this visit?",
            "description": "",
            "dynamic_type": true,
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "answer_id": 0,
            "options": [
              {"index": 0, "value": "Yes", "label": "Yes", "selected": false},
              {"index": 1, "value": "No", "label": "No", "selected": false},
              {
                "index": 2,
                "value": "NA, no changes to plan",
                "label": "NA, no changes to plan",
                "selected": false
              },
            ]
          },
          {
            'question_id': 12,
            "type": "TEXTFIELD",
            "code": "",
            "title":
            "Indicate details of any follow up actions and additional instructions given to caregiver as applicable",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "description": "",
            "dynamic_type": true,
            "answer_id": 0,
            "options": [
              {"index": 0, "value": "", "label": "", "selected": false},
            ]
          },
          {
            'question_id': 13,
            "type": "TEXTFIELD",
            "code": "",
            "title": "Name:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "description": "",
            "dynamic_type": true,
            "answer_id": 0,
            "options": [
              {"index": 0, "value": "", "label": "", "selected": false},
            ]
          },
        ]
      }
    ]
  };

  static Map<String,dynamic> carePlanningCoordination = {
    "template_name": "Occupational Therapy Reassessment",
    "cols": 2,
    "title": "Plan Care Coordination",
    "formId": 42,
    "subFormId": 689,
    'questions': [
      {
        'question_type_id': 420689001,//530955008,
        "type": "STATIC",
        "title": "<b>Frequency/Duration</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          // ...List.generate(7, (index) {
          //   return {
          //      "question_id": 1,
          //   "type": "STATIC",
          //   "options_alignment":"horizontal",
          //   };
          // },),
          // {
          //   "question_id": 1,
          //   "type": "STATIC",
          //   "options": [
          //     {
          //       "index": 0,
          //       "label": "SN",
          //       "value": "SN",
          //       "selected": false,
          //     },
          //     {
          //       "index": 1,
          //       "label": "2x4",
          //       "value": "",
          //       "selected": false,
          //     },
          //     {
          //       "index": 2,
          //       "label": "1x4",
          //       "value": "",
          //       "selected": false,
          //     },
          //     {
          //       "index": 3,
          //       "label": "Request LVN to follow",
          //       "value": "Request LVN to follow",
          //       "selected": false,
          //     },
          //   ]
          // },
          ...List.generate(7, (index) {
            final list = [
              "<b>SN</b>",
              "<b>PT</b>",
              "<b>OT</b>",
              "<b>ST</b>",
              "<b>MSW</b>",
              "<b>HHA</b>",
              "<b>RD</b>",
            ];
            return {
              "question_id": index + 1,
              "type": "CHECKBOX",
              "options": [
                {
                  "index": 0,
                  "label": list[index],
                  "value": list[index],
                  "selected": false,
                },
                if (index == 0)
                  {
                    "index": 1,
                    "label": '<b>Request COTA to follow</b>',
                    "value": 'Request COTA to follow',
                    "selected": false,
                  },
              ]
            };
          }),
          ...List.generate(7, (index) {
            return {
              "question_id": index + 8,
              "type": "DATE",
              "options": [
                {
                  "index": 0,
                  "label": '',
                  "value": '',
                  "selected": false,
                },
              ]
            };
          }),
        ],
      },
      {
        'question_type_id': 420689002,//0060178001,
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
        'question_type_id': 420689003,//0060178002,
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
              1,
              4,
              7
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
        'question_type_id': 420689004,//0060178004,
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
        'question_type_id': 420689005,//0060178005,
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
        'question_type_id': 420689006,//530955007,
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
                "label": "Discharge Planning",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 420689007,//0060178003,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(
          [
            "Discharge Plan established/updated with Patient, Patient's Representative (if any) and Caregiver as applicable"
          ],
        ),
      },
      {
        'question_type_id': 420689008,//0060178006,
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
    "template_name": "Occupational Therapy Reassessment",
    "cols": 2,
    "title": "Summary for Physician",
    "formId": 42,
    "subFormId": 691,
    'questions': [
      {
        'question_type_id': 420691001, //0651107001,
        "type": "ACTIONBUTTON",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['Generate SBAR']),
      },
      {
        'question_type_id': 420691002, //0651107001,
        "type": "TEXTAREA",
        "title": "<b>Summary</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 420691003, //0651105001,
        "type": "UPLOAD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Physician Signature</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(["Upload Signature"])
      },
    ]
  };

  static Map<String, dynamic> testsScales = {
    "template_name": "Occupational Therapy Reassessment",
    "template_code": "",
    "cols": 1,
    "title": "Tests/Scales",
    "formId": 42,
    "subFormId": 686,
    'questions': [
      {
        "question_type_id": 420686001,//0080238001,
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
    "template_name": "Occupational Therapy Reassessment",
    "template_code": "",
    "cols": 2,
    "title": "Musculoskeletal Status",
    "formId": 42,
    "subFormId": 684,
    "questions": [
      {
        "question_type_id": 420684001,//0080236001,
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
        'question_type_id': 420684002,//0080236002,
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
        'question_type_id': 420684003,//0080236003,
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
        'question_type_id': 420684004,//0080236004,
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
        'question_type_id': 420684005,//0080236005,
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
        'question_type_id': 420684006,//0080236006,
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
        'question_type_id': 420684007,//0080236007,
        "type": "CHECKBOX",
        "has_color": false,
        "question_type": "NON-COMPREHENSIVE",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "title": "<b>Muscle Tone</b>",
        "answer_id": 0,
        "options": generateOptions(['NT', 'Impaired'])
      },
    ]
  };

  static Map<String, dynamic> functionalAssessment = {
    "template_name": "Occupational Therapy Reassessment",
    "template_code": "",
    "cols": 1,
    "title": "Functional Status",
    "formId": 42,
    "subFormId": 685,
    'questions': [
      {
        "question_type_id": 420685001,//0080237001,
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
        "question_type_id": 420685002,//0080237002,
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
        "question_type_id": 420685003,//0080237003,
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
    "template_name": "Occupational Therapy Reassessment",
    "template_code": "",
    "cols": 2,
    "title": "Cognitive/Neurological Status",
    "formId": 42,
    "subFormId": 683,
    "questions": [

      {
        'question_type_id': 0420683001,//420683001,
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
        'question_type_id': 420683002,
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
        'question_type_id': 420683003,
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
}
