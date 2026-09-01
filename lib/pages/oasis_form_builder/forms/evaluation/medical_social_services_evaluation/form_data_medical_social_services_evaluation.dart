import '../../generate_options.dart';

class FormDataMedicalSocialServicesEvaluation {
  static Map<int, Map<String, dynamic>> drawerItems = {
    4: patientHistory,
    3: clinicalRecordItems,
    52: clinicalFindings,
    33: carePlanningCoordination,
    51: summaryForPhysician,
    53: livingSituations,
    54: healthStatus,
    55: psychosocialStatus,
    56: financialStatus,
  };

  static Map<String, dynamic> patientHistory = {
    "template_name": "Medical Social Services Evaluation",
    "cols": 2,
    "title": "Patient History & Signature",
    "formId": 71,
    "subFormId": 1125,
    "questions": [
      {
        'question_type_id': 711125001, //0651105001,
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
        'question_type_id': 711125002, //0651105002,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Pertinent diagnoses and reason for social services</b>",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
      {
        'question_type_id': 711125003, //0651105002,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Past medical history</b>",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
      {
        'question_type_id': 711125004, //0651105002,
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
        'question_type_id': 711125005, //0651105003,
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
    "template_name": "Medical Social Services Evaluation",
    "cols": 2,
    "title": "Clinical Record Items",
    "formId": 71,
    "subFormId": 1126,
    "questions": [
      {
        'question_type_id': 711126001, //0651106001,
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
        'question_type_id': 711126002, //0651106002,
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

  static Map<String, dynamic> clinicalFindings = {
    "template_name": "Medical Social Services Evaluation",
    "cols": 2,
    "title": "Clinical Findings/Interventions",
    "formId": 71,
    "subFormId": 1131,
    'questions': [
      {
        'question_type_id': 711131001,
        "type": "STATIC",
        "title": "<b>Problems Identified</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "options": generateOptions([
              "Patient needs a meal prepared or delivered daily",
              "Patient needs transportation assistance to medical care",
              "Patient needs assistance with housekeeping/shopping",
            ])
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Patient needs assistance to obtain:",
              "Medication",
              "Supplies",
              "In-home care equipment",
              "Life-line",
              "Food",
              "Disabled decal",
              "Other",
            ],textFieldPopup: [7])
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "options": generateOptions([
              "Patient needs assistance with medical/ insurance forms",
              "Patient needs daily contact to check on him/her",
              "Medical costs straining financial resources",
            ])
          },
          {
            "question_id": 4,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Patient needs assistance applying for:",
              "SSI",
              "Medicaid",
              "Food Stamps",
              "Emergency assistance",
              "Energy Assistance",
              "Other",
            ],textFieldPopup: [6])
          },
          {
            "question_id": 5,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Patient needs placement in:",
              "Assisted care",
              "SNF",
              "Other",
            ],textFieldPopup: [3])
          },
          {
            "question_id": 6,
            "type": "CHECKBOX",
            "options": generateOptions([
              "Private help needed at home",
              "Counseling needed",
              "Personal care needed after discharge",
              "Respite needed",
              "Other",
            ],textFieldPopup: [4])
          },
        ]
      },
      {
        'question_type_id': 711131002, //0651105002,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Clinical Findings/Assessment/Interventions Provided:</b>",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
      {
        'question_type_id': 711131003,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Patient/Family Goals</b>",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
    ]
  };

  static Map<String, dynamic> carePlanningCoordination = {
    "template_name": "Medical Social Services Evaluation",
    "cols": 2,
    "title": "Care Planning/Coordination",
    "formId": 71,
    "subFormId": 1132,
    'questions': [
      {
        'question_type_id': 711132001, //0060178001,
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
        'question_type_id': 711132002, //0060178002,
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
        'question_type_id': 711132003, //0060178003,
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
        'question_type_id': 711132004, //0060178004,
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
        'question_type_id': 711132005, //0060178005,
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
        'question_type_id': 711132006, //0060178006,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "options_alignment": "HORIZONTAL",
        "title": "<b>Plans for next visit</b>",
        "answer_id": 0,
        "question_options": generateOptions([
          "Assessment",
          "Teaching",
          "Treatments/procedures/therapy",
          "Other",
          "Preparation for discharge",
          "Evaluation only, no further visits",
        ], selectedIndexes: [
          1,
          3
        ], textFieldPopup: [
          0,
          1,
          2,
          3,
          4
        ]),
      },
    ]
  };

  static Map<String, dynamic> summaryForPhysician = {
    "template_name": "Medical Social Services Evaluation",
    "cols": 2,
    "title": "Summary for Physician",
    "formId": 71,
    "subFormId": 1133,
    'questions': [
      {
        'question_type_id': 711133001, //0651107001,
        "type": "ACTIONBUTTON",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['Generate SBAR']),
      },
      {
        'question_type_id': 711133002, //0651107001,
        "type": "TEXTAREA",
        "title": "<b>Summary</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 711133003, //0651105001,
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

  static Map<String, dynamic> livingSituations = {
    "template_name": "Medical Social Services Evaluation",
    "cols": 2,
    "title": "Living Situations",
    "formId": 71,
    "subFormId": 1127,
    'questions': [
      {
        'question_type_id': 711127001,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Housing</b>",
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "Type:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Public",
              "Subsidized",
              "House",
              "Retirement Home",
              "Mobile Home",
              "Apartment",
              "Group Home",
              "Other",
            ],textFieldPopup: [7])
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "Condition:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Adequate",
              "Inadequate",
              "Isolated",
              "Problems/Safety Hazards",
            ],)
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "options": generateOptions([
              "Services provided by housing",
            ],textFieldPopup: [0])
          }
        ]
      },
      {
        'question_type_id': 711127002,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Patient lives with</b>",
        "options_alignment": "HORIZONTAL",
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "question_options": generateOptions(
          [
            "Spouse",
            "Alone",
            "Power of Attorney",
            "Guardian",
            "Other",
          ],textFieldPopup: [4]
        ),
      },
      {
        'question_type_id': 711127003,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Patient relies on others</b>",
        "options_alignment": "HORIZONTAL",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(
          [
            "To obtain food",
            "To obtain medication",
            "For housekeeping",
            "To prepare meals",
            "To handle finances",
            "To transport patient to medical care",
          ],
        ),
      },
      {
        'question_type_id': 711127004,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Current Living Situation/Support System</b>",
        "description": "Describe relationships/communications/interactions with family/caregiver/significant other, etc.",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
      {
        'question_type_id': 711127005,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>The care the patient receives at home is</b>",
        "options_alignment": "HORIZONTAL",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(
          [
            "Good",
            "Adequate",
            "Marginal",
            "Inadequate",
          ],
        ),
      },
      {
        'question_type_id': 711127006,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "<b>Based on patient's present situation and support within the home, the patient</b>",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "does",
              "does not",
            ],)
          },
          {
            "question_id": 2,
            "type": "INFO",
            "title": "<b>in the opinion of this worker, appear to be a candidate for alternate placement.</b>",
            "options": generateOptions([
              "",
            ],)
          }
        ]
      },
      {
        'question_type_id': 711127007,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "<b>The</b>",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "Patient",
              "Spouse",
              "Family member(s)",
            ],)
          },
          {
            "question_id": 2,
            "type": "RADIO",
            "title": "",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "does",
              "does not",
            ],)
          },
          {
            "question_id": 3,
            "type": "INFO",
            "title": "<b>want to consider placement at this time.</b>",
            "options": generateOptions([
              "",
            ],)
          }
        ]
      },
      {
        'question_type_id': 711127008,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Church Affiliation/Other group support</b>",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
      {
        'question_type_id': 711127009,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Environment Factors</b>",
        "description": "Describes those factors that impede the POC from being effectively implemented, i.e., transportation, safety, etc.",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
    ]
  };

  static Map<String, dynamic> healthStatus = {
    "template_name": "Medical Social Services Evaluation",
    "cols": 2,
    "title": "Health Status",
    "formId": 71,
    "subFormId": 1128,
    'questions': [
      {
        'question_type_id': 711128001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Assistance Needed</b>",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(
          [
            "Total care",
            "Assistance with toilet",
            "Assistance with feeding",
            "Assistance with personal care & hygiene needs",
            "Requires physical assistance to transfer",
            "Other",
            "None of the above ",
          ],
          textFieldPopup: [5],
        ),
      },
      {
        'question_type_id': 711128002,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Ambulatory Status</b>",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Ambulatory",
              "Chairbound",
              "Bedbound",
            ],)
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "Prior functional status",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              ""
            ],)
          },
        ]
      },
      {
        'question_type_id': 711128003,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Sensory Status</b>",
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "Hearing:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Good",
              "Average",
              "Fair",
              "Poor",
              "Deaf",
              "Other",
            ],textFieldPopup: [5])
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "Vision:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Good",
              "Average",
              "Fair",
              "Poor",
              "Legally Blind",
              "Other",
            ],textFieldPopup: [5])
          },
        ]
      },
      {
        'question_type_id': 711128004,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Health Factors</b>",
        "description": "Describe those factors that impede the POC from being effectively implemented, i.e. vision, hearing, nutrition, etc.",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
    ]
  };

  static Map<String, dynamic> psychosocialStatus = {
    "template_name": "Medical Social Services Evaluation",
    "cols": 2,
    "title": "Psychosocial Status",
    "formId": 71,
    "subFormId": 1129,
    'questions': [
      {
        'question_type_id': 711129001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Emotional Status</b>",
        "options_alignment": "HORIZONTAL",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(
          [
            "Stable",
            "Sad",
            "Angry",
            "Tearful",
            "Anxious",
            "Stressed",
            "Lack of hope",
            "Unknown",
            "Feeling of Helplessness",
            "Withdrawal",
            "Fearful",
            "Other",
          ],
          textFieldPopup: [11],
        ),
      },
      {
        'question_type_id': 711129002,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Communication Skills</b>",
        "options_alignment": "HORIZONTAL",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(
          [
            "Good",
            "Average",
            "Poor",
            "Non-Verbal",
            "Non-English speaking",
          ],
        ),
      },
      {
        'question_type_id': 711129003,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Psychosocial</b>",
        "description": "Describe mental status, coping ability, attitude, safety prognosis and implications, etc.",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
      {
        'question_type_id': 711129004,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Primary Language</b>",
        "options_alignment": "HORIZONTAL",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(
          [
            "English",
            "Spanish",
            "Tagalog",
            "Cantonese",
            "Mandarin",
            "Vietnamese",
            "Hmong",
            "Arabic",
            "Farsi",
            "Other",
          ],
          textFieldPopup: [9],
        ),
      },
    ]
  };

  static Map<String, dynamic> financialStatus = {
    "template_name": "Medical Social Services Evaluation",
    "cols": 2,
    "title": "Financial Status",
    "formId": 71,
    "subFormId": 1130,
    'questions': [
      {
        'question_type_id': 711130001,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Financial Status</b>",
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "Patient has adequate resources to meet expenses:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ],)
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "Instructions: If answer is Yes go to the next section.",
            "options": generateOptions([
              "Income:",
              "Source:",
            ], addToValues: false,)
          },
          {
            "question_id": 3,
            "type": "RADIO",
            "title": "Patient wishes to apply for assistance:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ],)
          },
          {
            "question_id": 4,
            "type": "TEXTFIELD",
            "title": "Instructions: If answer is Yes please complete below and the Financial Resources section.",
            "options": generateOptions([
              "Other health Ins./Meds covered Ins.",
              "Spouse's SSN:",
              "Spouse's Medicaid#:",
              "Patient's SSN#:",
              "Patient's Medicaid#:",
            ], addToValues: false,)
          },
        ]
      },
      {
        'question_type_id': 711130002,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Financial Status</b>",
        "description": "Describe resources, income, assets/ expenses, etc. that impede the POC from being effectively implemented",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([
          "",
        ])
      },
      {
        'question_type_id': 711130003,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "<b>Financial Resources</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ],textFieldPopup: [0])
          },
          {
            "question_id": 2,
            "type": "RADIO",
            "title": "VA Eligibility",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ],)
          },
          {
            "question_id": 3,
            "type": "RADIO",
            "title": "Owns Home",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ],)
          },
          {
            "question_id": 4,
            "type": "RADIO",
            "title": "VA Eligibility",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ],)
          },
          {
            "question_id": 5,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Other property",
            ],textFieldPopup: [0])
          },
          {
            "question_id": 6,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "VA Service #:",
            "options": generateOptions([
              "",
            ],)
          },
          {
            "question_id": 7,
            "type": "CHECKBOX",
            "title": "Patient able to purchase services",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "Willing to purchase",
              "Assests",
            ],)
          },
          {
            "question_id": 8,
            "type": "RADIO",
            "title": " ",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ],textFieldPopup: [0])
          },
          {
            "question_id": 9,
            "type": "TEXTFIELD",
            "options": generateOptions([
              "Other Assistance receiving:",
              "Meets eligibility for:",
            ], addToValues: false,)
          },
        ]
      },
    ]
  };
}
