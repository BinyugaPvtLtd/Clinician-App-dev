import '../../generate_options.dart';

class FormDataHomeHealthAideCarePlan {
  static Map<int, Map<String, dynamic>> drawerItems = {
    46: pertinentInformation,
    48: reportingToSupervisingClinician,
    49: safetyPrecautions,
    50: tasks,
  };
  static Map<String, dynamic> pertinentInformation = {
    "template_name": "Home Health Aide Care Plan",
    "template_code": "",
    "cols": 2,
    "title": "Pertinent Information",
    "formId": 23,
    "subFormId": 513,
    "questions": [
      {
        'question_type_id': 230513001,//0340597001,
        "type": "DATE",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Frequency/Duration</b>",
        "dynamic_type": false,
        "has_color": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "DATE",
            "title": "<b>HHA</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""])
          }
        ]
      },
      {
        'question_type_id': 230513002, //0010032001,
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
                "label": "Advance Directives",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 230513003, //0010032001,
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
                "label": "Allergies",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 230513004, //0010032001,
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
                "label": "Mental Status",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 230513005, //0010032001,
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
                "label": "Nutritional Requirements",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 230513006, //0010032001,
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
                "label": "DME",
              }
            ]
          }
        ],
      },
    ]
  };
  static Map<String, dynamic> reportingToSupervisingClinician = {
    "template_name": "Home Health Aide Care Plan",
    "template_code": "",
    "cols": 2,
    "title": "Report to Supervising Clinician",
    "formId": 23,
    "subFormId": 514,
    "questions": [
      {
        'question_type_id': 230514001,//0340598001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Report Supervisor If:</b>",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "options": generateOptions(['Vital Sign Parameters per POC'])
          },
          ...List.generate(7, (index) {
            final titleList = [
              "Temperature",
              "Pulse",
              "Respirations",
              "Blood Pressure",
              "Intake amount",
              "Output amount",
              "Other measure",
            ];
            return {
              "question_id": index + 2,
              "type": "MIX",
              "options": generateOptions([titleList[index], "Over:", "Under:"],
                  textFieldPopup: index == 6 ? [0] : [])
            };
          })
        ]
      },
      {
        'question_type_id': 230514002,//0340598002,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Report to Supervisor If:</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(['NA'])
          },
          {
            "question_id": 2,
            "type": "MIX",
            "options": generateOptions(['No BM in', "days"])
          },
          {
            "question_id": 3,
            "type": "MIX",
            "options": generateOptions(['Pain above', ""])
          },
          {
            "question_id": 4,
            "type": "MIX",
            "options": generateOptions(
                ['Change in skin: ', "Reddened Area", "Other"],
                textFieldPopup: [2])
          },
          {
            "question_id": 5,
            "type": "MIX",
            "options": generateOptions(
                ['Weight', "Gain", "Loss", "lb.", "(Time Period)"])
          },
          {
            "question_id": 6,
            "type": "CHECKBOX",
            "options": generateOptions(['Other'])
          },
        ]
      },
    ]
  };
  static Map<String, dynamic> safetyPrecautions = {
    "template_name": "Home Health Aide Care Plan",
    "template_code": "",
    "cols": 2,
    "title": "Safety Precautions",
    "formId": 23,
    "subFormId": 515,
    'questions': [
      {
        "question_type_id": 230515001, //571063002,
        "type": "STATIC",
        "dynamic_type": false,
        "has_color": true,
        "question_type": "COMPREHENSIVE",
        "title": "<b>Safety Precautions</b>",
        "question_options": generateOptions([
          "Fall precautions",
          "Side rails up",
          "Hip precautions",
          "Bleeding precautions",
          "Other",
          "Ambulate only with assistance",
          "Swallowing precautions",
          "Seizure precautions",
          "Prone to fractures",
        ], textFieldPopup: [
          4,
          6
        ])
      },
      {
        'question_type_id': 230515002, //0010032001,
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
      },
      {
        "question_type_id": 230515003, //571063002,
        "type": "CHECKBOX",
        "dynamic_type": true,
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Special Instructions</b>",
        "question_options": generateOptions([
          "Amputee/ Prosthesis (specify)",
          "Special equipment (specify)",
          "Oxygen use (specify)",
          "Weight bearing restrictions (specify)",
          "Other",
        ], textFieldPopup: [
          0,
          1,
          2,
          3,
          4,
        ])
      },
      {
        'question_type_id': 230515004, //0010032001,
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
                "label": "Activities Permitted",
              }
            ]
          }
        ],
      },
    ]
  };

  static Map<String, dynamic> tasks = {
    "template_name": "Home Health Aide Care Plan",
    "template_code": "",
    "cols": 2,
    "title": "Tasks",
    "formId": 23,
    "subFormId": 1145,
    'questions': [
      {
        "question_type_id": 0231145001,
        "type": "INFO",
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": true,
        "title": "<b>Select desired tasks, indicate frequency and assistance required if applicable</b>",
        "answer_id": 0,
      },
      {
        "question_type_id": 0231145002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "title": "<b>Vital Signs/Measures</b>",
        "answer_id": 0,
        "questions": [
          ...List.generate(9, (index) {
            final titleList = [
              "Temperature",
              "Pulse",
              "Respirations",
              "Blood Pressure",
              "Pain Rating",
              "Weight",
              "Measure intake amounts",
              "Measure output amounts",
              "Other",
            ];
            return {
              "question_id": index + 1,
              "type": "MIX",
              "title": titleList[index],
              "options": generateOptions(
                [
                  "",
                  "",
                  "",
                ],
                textFieldPopup: index == 8 ? [0] : [],
              ),
            };
          })
        ],
      },
      {
        "question_type_id": 0231145003,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "title": "<b>Personal Care</b>",
        "answer_id": 0,
        "questions": [
          ...List.generate(
            14,
            (index) {
              final titleList = [
                "Bath:",
                "Shower:",
                "Oral Care",
                "Skin Care",
                "Check pressure areas",
                "Hair Care",
                "Shampoo",
                "Peri Care",
                "Foot Care",
                "Clean/file nails",
                "Assist with dressing",
                "Apply elastic stockings",
                "Shave with electric razor",
                "Other",
              ];
              return {
                "question_id": index + 1,
                "type": "MIX",
                "title": titleList[index],
                "options": generateOptions(
                  index == 0
                      ? [
                          "",
                          "",
                          "",
                          "Chair",
                          "Tub",
                          "Bed:",
                          "Partial",
                          "Complete",
                        ]
                      : index == 1
                          ? [
                              "",
                              "",
                              "",
                              "Use shower chair",
                            ]
                          : index == 3
                              ? [
                                  "",
                                  "",
                                  "",
                                  "Moisturize",
                                ]
                              : [
                                  "",
                                  "",
                                  "",
                                ],
                  textFieldPopup: index == 13 ? [0] : [],
                ),
              };
            },
          )
        ],
      },
      {
        "question_type_id": 0231145004,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "title": "<b>Activity</b>",
        "answer_id": 0,
        "questions": [
          ...List.generate(6, (index) {
            final titleList = [
              "Assist With Ambulance",
              "Transfer assist:",
              "Exercise per:",
              "Reposition every:",
              "ROM",
              "Other",
            ];
            return {
              "question_id": index + 1,
              "type": "MIX",
              "title": titleList[index],
              "options": generateOptions(
                [
                  "",
                  "",
                  "",
                  if (index == 1) ...[
                    "Chair",
                    "Bed",
                    "Commode",
                    "Shower",
                    "Tub",
                    "Use Hoyer Lift",
                  ],
                  if (index == 2) ...[
                    "PT",
                    "OT",
                    "SLP",
                  ],
                  if (index == 3) "",
                  if (index == 4) ...[
                    "Active",
                    "Passive",
                    "Active",
                    "Passive",
                    "Active",
                    "Passive",
                  ]
                ],
                textFieldPopup: index == 5 ? [0] : [],
              ),
            };
          })
        ],
      },
      {
        "question_type_id": 0231145005,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "title": "<b>Elimination</b>",
        "answer_id": 0,
        "questions": [
          ...List.generate(7, (index) {
            final titleList = [
              "Date of last BM",
              "Assist with toileting",
              "Bedpan/Urinal",
              "Catheter Care:",
              "Empty urine bag",
              "Ostomy Care",
              "Other",
            ];
            return {
              "question_id": index + 1,
              "type": "MIX",
              "title": titleList[index],
              "options": generateOptions(
                [
                  "",
                  "",
                  "",
                  if (index == 3) ...[
                    "External",
                    "Urethral",
                    "Suprapubic",
                  ]
                ],
                textFieldPopup: index == 6 ? [0] : [],
              ),
            };
          })
        ],
      },
      {
        "question_type_id": 0231145006,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "title": "<b>Nutrition/Diet</b>",
        "answer_id": 0,
        "questions": [
          ...List.generate(5, (index) {
            final titleList = [
              "Prepare meals",
              "Prepare snacks",
              "Assist with feeding",
              "Fluids:",
              "Other",
            ];
            return {
              "question_id": index + 1,
              "type": "MIX",
              "title": titleList[index],
              "options": generateOptions(
                [
                  "",
                  "",
                  "",
                  if (index == 3) ...[
                    "Limit",
                    "Encourage",
                  ]
                ],
                textFieldPopup: index == 4 ? [0] : [],
              ),
            };
          })
        ],
      },
      {
        "question_type_id": 0231145007,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "title": "<b>Environmental</b>",
        "answer_id": 0,
        "questions": [
          ...List.generate(5, (index) {
            final titleList = [
              "Tidy/Clean:",
              "Laundry",
              "Change bed linen",
              "Equipment care",
              "Other",
            ];
            return {
              "question_id": index + 1,
              "type": "MIX",
              "title": titleList[index],
              "options": generateOptions(
                [
                  "",
                  "",
                  "",
                  if (index == 0) ...[
                    "Bathroom",
                    "Bedroom",
                    "Living Room",
                    "Kitchen",
                  ]
                ],
                textFieldPopup: index == 4 ? [0] : [],
              ),
            };
          })
        ],
      },
      {
        "question_type_id": 0231145008,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "title": "<b>Medications</b>",
        "answer_id": 0,
        "questions": [
          ...List.generate(
            2,
            (index) {
              final titleList = [
                "Assist with self administration",
                "Medication reminder",
              ];
              return {
                "question_id": index + 1,
                "type": "MIX",
                "title": titleList[index],
                "options": generateOptions(
                  [
                    "",
                    "",
                    "",
                  ],
                ),
              };
            },
          )
        ],
      },
    ]
  };
}
