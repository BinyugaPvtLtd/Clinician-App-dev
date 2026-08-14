import '../../generate_options.dart';

class FormDataStEvaluation {
  static Map<int, Map<String,dynamic>> drawerItems = {
    4: patientHistory,
    3: clinicalRecordItems,
    41: subjective,
    9: pain,
    8: vitalSignsHeight,
    12: neurologicalCongnitive,
    19: integumentary,
    22: functionalStatus,
    45: objective,
    30: assessment,
    32: planOfCare,
    33: carePlanningCoordination,
    51: summaryForPhysician,
  };

  static Map<String, dynamic> patientHistory = {
    "template_name": "Speech Therapy Evaluation",
    "cols": 2,
    "title": "Patient History & Signature",
    "formId": 33,
    "subFormId": 584,
    "questions": [
      {
        'question_type_id': 330584001,//400654001,
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
        'question_type_id': 330584002,//400654002,
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
        'question_type_id': 330584003,//400654003,
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
        'question_type_id': 330584004, //0651105002,
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
        'question_type_id': 330584005, //0651105003,
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
    "template_name": "Speech Therapy Evaluation",
    "cols": 2,
    "title": "Clinical Record Items",
    "formId": 33,
    "subFormId": 585,
    "questions": [
      {
        'question_type_id': 330585001, //0651106001,
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
        'question_type_id': 330585002, //0651106002,
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

  static Map<String,dynamic> subjective = {
    "template_name": "Speech Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Subjective",
    "formId": 33,
    "subFormId": 586,
    "questions": [
      {
        'question_type_id': 330586001,//520909001,
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
        'question_type_id': 330586002,//520909002,
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
    "template_name": "Speech Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Pain",
    "formId": 33,
    "subFormId": 587,
    "questions": [
      {
        'question_type_id': 330587001,//520910001,
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
        'question_type_id': 330587002,//520910002,
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
        'question_type_id': 330587003,//520910003,
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
        'question_type_id': 330587004,//520910004,
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
        'question_type_id': 330587005,//520910005,
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
        'question_type_id': 330587006,//520910006,
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
        'question_type_id': 330587007,//520910007,
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
        'question_type_id': 330587008,//520910008,
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
        'question_type_id': 330587009,//520910009,
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
        'question_type_id': 330587010,//520910010,
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
        'question_type_id': 330587011,//520910011,
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
    "template_name": "Speech Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Vital Signs",
    "formId": 33,
    "subFormId": 588,
    'questions': [
      {
        'question_type_id': 330588001,//520911001,
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
        'question_type_id': 330588002,//520911002,
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
        'question_type_id': 330588003,//520911003,
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

  static Map<String,dynamic> neurologicalCongnitive = {
    "template_name": "Speech Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Cognitive/Neurological",
    "formId": 33,
    "subFormId": 590,
    "questions": [
      {
        'question_type_id': 330590001,//520914001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
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
        'question_type_id': 330590002,//520914002,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Neurological Status</b>",
        "options_alignment": "HORIZONTAL",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(
          ["No Deficits", "Describe Deficits"],
          textFieldPopup: [1],
        ),
      },
    ]
  };

  static Map<String,dynamic> integumentary = {
    "template_name": "Speech Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Integumentary Status",
    "formId": 33,
    "subFormId": 589,
    'questions': [
      {
        'question_type_id': 330589001,//520918001,
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
        "question_type_id": 330589002,//520918002,
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
        'question_type_id': 330589003,//520918003,
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
        'question_type_id': 330589004,//520918004,
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

  static Map<String,dynamic> functionalStatus = {
    "template_name": "Speech Therapy Evaluation",
    "template_code": "",
    "cols": 1,
    "title": "Functional Status",
    "formId": 33,
    "subFormId": 591,
    'questions': [
      {
        "question_type_id": 330591001,//0500867001,
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
        "question_type_id": 330591002,//0500867002,
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
        "question_type_id": 330591003,//0500867002,
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
        "question_type_id": 330591004,//0500867004,
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
        "question_type_id": 330591005,//0500867005,
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
        "question_type_id": 330591006,//0500867006,
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
        "question_type_id": 330591007,//0500867007,
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
        "question_type_id": 330591008,//0500867008,
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
        "question_type_id": 330591009,//0500867009,
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
        "question_type_id": 330591010,//0500867010,
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
        "question_type_id": 330591011,//0500867011,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Comments</b>",
        "dynamic_type": true,
        "question_options": generateOptions([""]),
      },
    ]
  };

  static Map<String,dynamic> objective = {
    "template_name": "Speech Therapy Evaluation",
    "cols": 2,
    "title": "Objective",
    "formId": 33,
    "subFormId": 592,
    'questions': [
      {
        'question_type_id': 330592001,//520927001,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "title": "<b>Interventions/Education Provided:</b>",
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 330592002,//520927002,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "title": "<b>Response to interventions/education:</b>",
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
    ]
  };

  static Map<String,dynamic> assessment = {
    "template_name": "Speech Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Assessment",
    "formId": 33,
    "subFormId": 593,
    'questions': [
      {
        'question_type_id': 330593001,//520928001,
        "type": "TEXTAREA",
        "title": "<b>Assessment</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 330593002,//520928002,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String,dynamic> planOfCare = {
    "template_name": "Speech Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Plan Of Care",
    "formId": 33,
    "subFormId": 594,
    'questions': [
      {
        'question_type_id': 330594001,//520929001,
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
        'question_type_id': 330594002,//520929002,
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
        'question_type_id': 330594003,//520929003,
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
        'question_type_id': 330594004,//520929004,
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
        'question_type_id': 330594005,//520929005,
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
                "label": "Functional Limitation",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 330594006,//520929006,
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
        'question_type_id': 330594007,//520929006,
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
        'question_type_id': 330594008,//520929007,
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
        'question_type_id': 330594009,
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
                "label": "ST",
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
              "OT",
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

  static Map<String,dynamic> carePlanningCoordination = {
    "template_name": "Speech Therapy Evaluation",
    "template_code": "",
    "cols": 2,
    "title": "Care Planning/Coordination",
    "formId": 33,
    "subFormId": 595,
    'questions': [
      {
        'question_type_id': 330595001,//520930001,
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
        'question_type_id': 330595002,//520930002,
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
        'question_type_id': 330595003,//520930003,
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
        'question_type_id': 330595004,//520930004,
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
            "title": "Other (<i>Specify</i>):",
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
        'question_type_id': 330595005,//520930005,
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
        'question_type_id': 330595006,//520930006,
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
    "template_name": "Speech Therapy Evaluation",
    "cols": 2,
    "title": "Summary for Physician",
    "formId": 33,
    "subFormId": 596,
    "questions": [
      {
        'question_type_id': 330596001, //0651105002,
        "type": "ACTIONBUTTON",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(["Generate SBAR"])
      },
      {
        'question_type_id': 330596002, //0651105002,
        "type": "TEXTAREA",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Summary</b>",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
      {
        'question_type_id': 330596003, //0651105001,
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
        'question_type_id': 330596004, //0651105003,
        "type": "INFO",
        "question_type": "NON-COMPREHENSIVE",
        "title": " ",
        "dynamic_type": true,
        "has_color": false,
      },
    ]
  };
}
