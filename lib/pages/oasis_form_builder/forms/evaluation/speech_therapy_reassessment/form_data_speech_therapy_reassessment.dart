import '../../generate_options.dart';

class FormDataSpeechTherapyReassessment {
  static Map<int, Map<String, dynamic>> drawerItems = {
    4: patientHistory,
    3: clinicalRecordItems,
    41: subjective,
    8: vitalSigns,
    9: pain,
    29: interventionEducationProvided,
    30: assessmentSummary,
    38: superVision,
    33: carePlanningCoordination,
    51: summaryForPhysician,
    42: functionalAssessment,
  };
  static Map<String, dynamic> patientHistory = {
    "template_name": "Speech Therapy Reassessment",
    "cols": 2,
    "title": "Patient History & Signature",
    "formId": 40,
    "subFormId": 654,
    "questions": [
      {
        'question_type_id': 400654001, //0651105001,
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
        'question_type_id': 400654002, //0651105002,
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
        'question_type_id': 400654003, //0651105003,
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
    ]
  };

  static Map<String, dynamic> clinicalRecordItems = {
    "template_name": "Speech Therapy Reassessment",
    "cols": 2,
    "title": "Clinical Record Items",
    "formId": 40,
    "subFormId": 655,
    "questions": [
      {
        'question_type_id': 400655001, //0651106001,
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
        'question_type_id': 400655002, //0651106002,
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
    "template_name": "Speech Therapy Reassessment",
    "template_code": "",
    "cols": 2,
    "title": "Subjective",
    "formId": 40,
    "subFormId": 656,
    'questions': [
      {
        'question_type_id': 400656001, //571044001,
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
        'question_type_id': 400656002, //571044002,
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
    "template_name": "Speech Therapy Reassessment",
    "cols": 2,
    "title": "Vital Signs",
    "formId": 40,
    "subFormId": 658,
    'questions': [
      {
        'question_type_id': 400658001, //30080001,
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
              {
                "index": 0,
                "label": '',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 400658002, //571046002,
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
        'question_type_id': 400658003, //571046002,
        "type": "INFO",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
      },
    ]
  };

  static Map<String, dynamic> pain = {
    "template_name": "Speech Therapy Reassessment",
    "cols": 2,
    "title": "Pain",
    "formId": 40,
    "subFormId": 657,
    "questions": [
      {
        'question_type_id': 400657001, //571045001,
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
        'question_type_id': 400657002, //571045002,
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
        'question_type_id': 400657003, //30079003,
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
        'question_type_id': 400657004, //571045004,
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
        'question_type_id': 400657005, //571045008,
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
        'question_type_id': 400657006, //571045009,
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
        'question_type_id': 400657007, //571045010,
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
        'question_type_id': 400657008, //571045011,
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
        'question_type_id': 400657009, //571045012,
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
        'question_type_id': 400657010, //571045013,
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
        'question_type_id': 400657011, //571045014,
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

  static Map<String, dynamic> interventionEducationProvided = {
    "template_name": "Speech Therapy Reassessment",
    "template_code": "",
    "cols": 2,
    "title": "Objective",
    "formId": 40,
    "subFormId": 660,
    'questions': [
      {
        "question_type_id": 400660001, //510898001,
        "type": "STATIC",
        "dynamic_type": false,
        "question_type": "COMPREHENSIVE", "draw_box": false,
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
      }
    ]
  };

  static Map<String, dynamic> assessmentSummary = {
    "template_name": "Speech Therapy Reassessment",
    "cols": 2,
    "title": "Assessment",
    "formId": 40,
    "subFormId": 661,
    'questions': [
      {
        'question_type_id': 400661001, //0651107001,
        "type": "TEXTAREA",
        "title": "<b>Assessment</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 400661002, //510901001,
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

  static Map<String, dynamic> superVision = {
    "template_name": "Speech Therapy Reassessment",
    "template_code": "",
    "cols": 1,
    "title": "Supervision",
    "formId": 40,
    "subFormId": 663,
    'questions': [
      {
        'question_type_id': 400663001, //510903001,
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
        'question_type_id': 400663002, //510903002,
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

  static Map<String, dynamic> carePlanningCoordination = {
    "template_name": "Speech Therapy Reassessment",
    "cols": 2,
    "title": "Plan/Care Coordination",
    "formId": 40,
    "subFormId": 662,
    'questions': [
      {
        'question_type_id': 400662001, //0010032008,
        "type": "STATIC",
        "title": "<b>Frequency/Duration</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          ...List.generate(7, (index) {
            final list = [
              "<b>ST</b>",
              "<b>SN</b>",
              "<b>PT</b>",
              "<b>OT</b>",
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
        'question_type_id': 400662002, //0060178001,
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
        'question_type_id': 400662003, //0060178002,
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
        'question_type_id': 400662004, //0060178004,
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
        'question_type_id': 400662005, //0060178005,
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
        'question_type_id': 400662006, //510901001,
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
        'question_type_id': 400662007, //0060178003,
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
        'question_type_id': 400662008, //0060178006,
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
    ]
  };

  static Map<String, dynamic> summaryForPhysician = {
    "template_name": "Speech Therapy Reassessment",
    "cols": 2,
    "title": "Summary for Physician",
    "formId": 40,
    "subFormId": 664,
    'questions': [
      {
        'question_type_id': 400664001, //0651107001,
        "type": "ACTIONBUTTON",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['Generate SBAR']),
      },
      {
        'question_type_id': 400664002, //0651107001,
        "type": "TEXTAREA",
        "title": "<b>Summary</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 400664003, //0651105001,
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

  static Map<String, dynamic> functionalAssessment = {
    "template_name": "Speech Therapy Reassessment",
    "template_code": "",
    "cols": 1,
    "title": "Functional Status",
    "formId": 40,
    "subFormId": 659,
    'questions': [
      {
        "question_type_id": 400659001, //0500867001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Oral Motor</b>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 2,
            "type": "DIVIDER",
          },
          ...List.generate(8, (index) {
            final titleList = [
              "Facial Symmetry",
              "Tongue",
              "Oral Cavity",
              "Dentition",
              "Velum",
              "Hearing Screen",
              "Hearing is adequate for one-on-one conversation",
              "Patient requires compensatory strategies for adequate hearing (auditory amplifier/ louder/presentation/graphic or gestural prompts)",
            ];
            return {
              "question_id": index + 3,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
        ]
      },
      {
        "question_type_id": 400659002, //0500867002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Clinical Assessment of Swallowing</b>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 2,
            "type": "DIVIDER",
          },
          ...List.generate(12, (index) {
            final titleList = [
              "Bolus Acceptance",
              "Containment in Oral Cavity",
              "Mastication",
              "Bolus Formation",
              "Bolus Propulsion",
              "Swallow Intiation",
              "Clearing of Oral Cavity",
              "Laryngeal Elevation",
              "S/S Aspiration",
              "Self Monitoring",
              "Self Feeding",
              "Recommended Diet Textures:",
            ];
            return {
              "question_id": index + 3,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
        ]
      },
      {
        "question_type_id": 400659003, //0500867002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Receptive Language: Spoken</b>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 2,
            "type": "DIVIDER",
          },
          ...List.generate(12, (index) {
            final titleList = [
              "Objective Identification",
              "Body Parts",
              "ADL Items",
              "Name",
              "Function",
              "Swallow Intiation",
              "Clearing of Oral Cavity",
              "Laryngeal Elevation",
              "S/S Aspiration",
              "Self Monitoring",
              "Self Feeding",
              "Recommended Diet Textures:",
            ];
            return {
              "question_id": index + 3,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 15,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Yes/No Questions</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 16,
            "type": "DIVIDER",
          },
          ...List.generate(3, (index) {
            final titleList = [
              "Personal",
              "Simple",
              "Multi-Unit",
            ];
            return {
              "question_id": index + 17,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 20,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Commands</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 21,
            "type": "DIVIDER",
          },
          ...List.generate(3, (index) {
            final titleList = [
              "1 Step",
              "2 Step",
              "3 step",
            ];
            return {
              "question_id": index + 22,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 25,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Narrative Discourse</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 26,
            "type": "DIVIDER",
          },
          ...List.generate(3, (index) {
            final titleList = [
              "Paragraph",
              "Social Conversation",
              "Complex Conversation",
            ];
            return {
              "question_id": index + 27,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
        ]
      },
      {
        "question_type_id": 400659004, //0500867004,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Receptive Language: Written</b>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 2,
            "type": "DIVIDER",
          },
          ...List.generate(6, (index) {
            final titleList = [
              "Matching",
              "Letter",
              "Word",
              "Sentence",
              "Paragraph",
              "RIL awareness",
            ];
            return {
              "question_id": index + 3,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
        ]
      },
      {
        "question_type_id": 400659005, //0500867005,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Expressive Language: Spoken</b>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 2,
            "type": "DIVIDER",
          },
          ...List.generate(3, (index) {
            final titleList = [
              "Gestural",
              "Yes/ No Responses",
              "Automatic Sequence",
            ];
            return {
              "question_id": index + 3,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 6,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Repetition</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 7,
            "type": "DIVIDER",
          },
          ...List.generate(3, (index) {
            final titleList = [
              "Single Word",
              "Phrase",
              "Sentence",
            ];
            return {
              "question_id": index + 8,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 11,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Naming</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 12,
            "type": "DIVIDER",
          },
          ...List.generate(3, (index) {
            final titleList = [
              "Body Parts",
              "Responsive",
              "Confrontational",
            ];
            return {
              "question_id": index + 13,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 16,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Spontaneous Production</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 17,
            "type": "DIVIDER",
          },
          ...List.generate(5, (index) {
            final titleList = [
              "Sentence Completion",
              "Spontaneous/ Functional Words",
              "Sentence Formulation",
              "Social Conversation",
              "Social Conversation",
            ];
            return {
              "question_id": index + 18,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
        ]
      },
      {
        "question_type_id": 400659006, //0500867006,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Diadochokinesis</b>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 2,
            "type": "DIVIDER",
          },
          ...List.generate(10, (index) {
            final titleList = [
              "Words",
              "Ph rases",
              "Sentences",
              "Conversation",
              "Voice",
              "Quality",
              "Pitch",
              "Intensity",
              "Prosody",
              "Respiratory Control",
            ];
            return {
              "question_id": index + 3,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
        ]
      },
      {
        "question_type_id": 400659007, //0500867007,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Expressive Language: Written</b>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 2,
            "type": "DIVIDER",
          },
          ...List.generate(6, (index) {
            final titleList = [
              "Biographical Information",
              "Copying",
              "Words",
              "Phrases",
              "Sentences",
              "Functional Correspondence",
            ];
            return {
              "question_id": index + 3,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
        ]
      },
      {
        "question_type_id": 400659008, //0500867008,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Cognitive/Linguistic</b>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 2,
            "type": "DIVIDER",
          },
          ...List.generate(5, (index) {
            final titleList = [
              "Orientation",
              "Personal",
              "Spatial",
              "Temporal",
              "Situational",
            ];
            return {
              "question_id": index + 3,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 8,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Memory</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 9,
            "type": "DIVIDER",
          },
          ...List.generate(9, (index) {
            final titleList = [
              "Procedural",
              "Semantic",
              "Episodic",
              "Working",
              "Prospective",
              "Immediate",
              "Short Term",
              "Long Term",
              "Remote",
            ];
            return {
              "question_id": index + 10,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 19,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Attention</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 20,
            "type": "DIVIDER",
          },
          ...List.generate(5, (index) {
            final titleList = [
              "Sustained",
              "Selective",
              "Divided",
              "Alternating",
              "Attention to detail",
            ];
            return {
              "question_id": index + 11,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 26,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Thought Organization</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 27,
            "type": "DIVIDER",
          },
          ...List.generate(3, (index) {
            final titleList = [
              "Divergent Categorization",
              "Convergent Categorization",
              "Drawing Conclusions Sequencing",
            ];
            return {
              "question_id": index + 28,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 31,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Problem Solving</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 32,
            "type": "DIVIDER",
          },
          ...List.generate(3, (index) {
            final titleList = [
              "Simple",
              "Multifactoral",
              "Temporal",
            ];
            return {
              "question_id": index + 33,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 36,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Functional Math</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 37,
            "type": "DIVIDER",
          },
          ...List.generate(2, (index) {
            final titleList = [
              "Verbal",
              "Written",
            ];
            return {
              "question_id": index + 38,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
          {
            "question_id": 36,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Pragmatics</i>",
            "options": generateOptions(['Not Tested']),
          },
        ]
      },
      {
        "question_type_id": 400659009, //0500867009,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Executive Function</b>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 2,
            "type": "DIVIDER",
          },
          ...List.generate(5, (index) {
            final titleList = [
              "Initiation",
              "Inhibition",
              "Time Management",
              "Planning/Organizing",
              "Mental Flexibility",
            ];
            return {
              "question_id": index + 3,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
        ]
      },
      {
        "question_type_id": 400659010, //0500867010,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Motor Speech</b>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 2,
            "type": "DIVIDER",
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<i>Repetition</i>",
            "options": generateOptions(['Not Tested']),
          },
          {
            "question_id": 4,
            "type": "DIVIDER",
          },
          ...List.generate(5, (index) {
            final titleList = [
              "Monosyllabic Words",
              "Polysyllabic Words",
              "Words of Increasing Length",
              "Phrases",
              "Sentences",
            ];
            return {
              "question_id": index + 5,
              "title": titleList[index],
              "type": "DROPDOWN",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([
                "Within Functional Limits",
                "Minimal 10% loss",
                "Mild 25% loss",
                "Mod 26-50% loss",
                "Mod-Severe 51-75% loss",
                "Severe 76-99% loss",
                "Profound 100% loss",
                "Not Tested",
              ]),
            };
          }),
        ]
      },
      {
        "question_type_id": 400659011, //0500867011,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Comments</b>",
        "dynamic_type": true,
        "question_options": generateOptions([""]),
      },
    ]
  };
}
