
import '../../generate_options.dart';

class FormDataMedicalSocialServicesDischargeSummaryNonVisit {
  static Map<int, Map<String,dynamic>> medicalSocialServicesDischargeSummaryNonVisitDrawerItems = {
    39: dischargeSummary,
    40: summarySentTo,
  };

  static Map<String,dynamic> summarySentTo = {
    "template_name": "Medical Social Services Discharge Summary (Non-Visit)",
    "cols": 2,
    "title": "Summary Sent To",
    "formId": 22,
    "subFormId": 512,
    'questions': [
      {
        "question_type_id": 220512001,//140438001,
        "dynamic_type": false,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "questions": [
          {
            'question_id': 1,
            "type": "DROPDOWN",
            "title": "Referring Physician:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              ['Option 1', 'Option 2'],
            ),
          },
          ...List.generate(6, (index) {
            final list = [
              "Address:",
              "Zip:",
              "Phone:",
              "City:",
              "Fax:",
              "State:",
            ];
            return {
              'question_id': index + 2,
              "type": "TEXTFIELD",
              "scroll_axis": "HORIZONTAL",
              "title": list[index],
              "options": generateOptions(
                [""],
              ),
            };
          }),
        ]
      },
      {
        "question_type_id": 220512002,//140438002,
        "dynamic_type": false,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "questions": [
          {
            'question_id': 1,
            "type": "DROPDOWN",
            "scroll_axis": "HORIZONTAL",
            "title": "Certifying Physician:",
            "options": generateOptions(
              ['Option 1', 'Option 2'],
            ),
          },
          ...List.generate(6, (index) {
            final list = [
              "Address:",
              "Zip:",
              "Phone:",
              "City:",
              "Fax:",
              "State:",
            ];
            return {
              'question_id': index + 2,
              "type": "TEXTFIELD",
              "scroll_axis": "HORIZONTAL",
              "title": list[index],
              "options": generateOptions(
                [""],
              ),
            };
          }),
        ]
      },
      {
        "question_type_id": 220512003,//140438003,
        "dynamic_type": false,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "questions": [
          {
            'question_id': 1,
            "type": "DROPDOWN",
            "title": "Other Physician:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              ['Option 1', 'Option 2'],
            ),
          },
          ...List.generate(6, (index) {
            final list = [
              "Address:",
              "Zip:",
              "Phone:",
              "City:",
              "Fax:",
              "State:",
            ];
            return {
              'question_id': index + 2,
              "type": "TEXTFIELD",
              "scroll_axis": "HORIZONTAL",
              "title": list[index],
              "options": generateOptions(
                [""],
              ),
            };
          }),
        ]
      },
    ]
  };
  static Map<String,dynamic> dischargeSummary = {
    "template_name": "Medical Social Services Discharge Summary (Non-Visit)",
    "cols": 2,
    "title": "Discharge Summary",
    "formId": 22,
    "subFormId": 511,
    'questions': [
      {
        "question_type_id": 220511001,//140437001,
        "dynamic_type": false,
        "type": "MIX",
        "title": "Patient Name:",
        "has_color": true,
        "question_type": "COMPREHENSIVE",
        "questions": [
          {
            'question_id': 1,
            "type": "TEXTFIELD",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(
              ['First:', 'Last:'],
              addToValues: false,
            ),
          },
          {
            'question_id': 2,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "MR Number:",
            "options": generateOptions(
              [""],
            ),
          },
          {
            'question_id': 3,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "DOB:",
            "options": generateOptions([""]),
          },
          {
            'question_id': 4,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Location Name:",
            "options": generateOptions(
              [""],
            ),
          },
          {
            'question_id': 5,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "Admission Date:",
            "options": generateOptions(
              [""],
            ),
          },
          {
            'question_id': 6,
            "type": "TEXTFIELD",
            "options": generateOptions(
              [
                'Physician responsible for home health plan of care: (Select)',
                'Address: Suite/Apt #:',
                'City:',
                'State:',
                'Zip:',
                'Phone:',
                'Fax:',
              ],
              addToValues: false,
            ),
          },
        ]
      },
      {
        "question_type_id": 220511002,//140437002,
        "dynamic_type": true,
        "type": "TEXTFIELD",
        "title": "<b>Reason for admission to home health/diagnosis</b>",
        "has_color": false,
        "question_type": "COMPREHENSIVE",
        "question_options": generateOptions([""]),
      },
      {
        "question_type_id": 220511003,//180499003,
        "dynamic_type": false,
        "type": "STATIC",
        "title": "<b>Skilled Services Provided</b>",
        "has_color": true,
        "question_type": "COMPREHENSIVE",
        "questions": [
          {
            'question_id': 1,
            "type": "MIX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              ['Skilled Nursing', 'Frequency :  '],
            ),
          },
          {
            'question_id': 2,
            "type": "MIX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              ['Home Health Aide', 'Frequency :  '],
            ),
          },
          {
            'question_id': 3,
            "type": "MIX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              ['Other', 'Frequency :  '],
              textFieldPopup: [0],
            ),
          },
        ],
      },
      {
        "question_type_id": 220511004,//180499004,
        "dynamic_type": false,
        "type": "MIX",
        "has_color": false,
        "question_type": "NON-COMPREHENSIVE",
        "questions": [
          {
            "question_id": 1,
            "type": "DROPDOWN",
            "title": "<b>Reason for Discharge</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              [
                "Discharged with Goals  Met",
                "Discharged to Outpatient Rehabilition",
                "None-Compliance",
                "Unable to Reach/Locate the Patient",
                "Discharged to Another Hospice",
                "No Longer Terminally Ill",
                "Discharged for Cause",
                "Insurance Change",
                "No Longer Homebound",
                "No Further Skilled Care Needed",
                "Maximum Potential Reached",
                "Unable to Obtain Auth",
                "Discharged to Long Term Care Hospital (LTCH)",
                "Discharged to Psychiatric Hospital",
                "Discharged to Inpatient Rehab Facility (IRF)",
                "Discharged to Nursing Facility",
                "Expired at home",
                "Discharged to Hospital",
                "Patient Request/Refused to continue service",
                "Transferred to another HHA",
                "Patient Moved Out of Area",
                "Died At Home",
                "Died in Facility",
                "Discharge due to Stable Condition",
                "Revoked",
                "Died, Location Unknown ",
                "Discharged to Our Hospice",
                "Physician request",
              ],
            ),
          }
        ]
      },
      {
        'question_type_id': 220511005,//140437007,
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
                "label": "Medications",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 220511006,//140437008,
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
                "label": "Advance Directive",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 220511007,//140437009,
        "type": "STATIC",
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
                "label": "Mental Status",
              }
            ]
          }
        ],
      },
      {
        "question_type_id": 220511008,//140437010,
        "dynamic_type": true,
        "type": "CHECKBOX",
        "title": "<b>Functional Ability </b>",
        "options_alignment": "HORIZONTAL",
        "has_color": true,
        "question_type": "NON-COMPREHENSIVE",
        "question_options": generateOptions(
            ["Independent", "Partially Dependent", "Totally Dependent"]),
      },
      {
        'question_type_id': 220511009,//140437011,
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
                "label": "Goals",
              }
            ]
          }
        ],
      },
      {
        "question_type_id": 220511010,//140437012,
        "dynamic_type": false,
        "type": "MIX",
        "title": "<b>Discharge Instructions</b>",
        "has_color": false,
        "question_type": "NON-COMPREHENSIVE",
        "questions": [
          {
            'question_id': 1,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Instructions provided to:",
            "options": generateOptions(
                ['Patient', 'Caregiver/Family (name(s))'],
                textFieldPopup: [1]),
          },
          {
            'question_id': 2,
            "type": "TEXTFIELD",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Instructions provided:",
            "options": generateOptions(
              [""],
            ),
          },
          {
            'question_id': 3,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              [
                'Patient/Caregiver/Family exhibited understanding',
              ],
            ),
          },
        ],
      },
      {
        "question_type_id": 220511011,//140437013,
        "dynamic_type": false,
        "type": "STATIC",
        "title": "<b>Care Coordination with: </b>",
        "has_color": false,
        "question_type": "NON-COMPREHENSIVE",
        "questions": [
          {
            'question_id': 1,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              'Patient',
              'Case Manager',
              'Clinical Manager',
              'SN',
              'PT',
              'PTA',
              'OT',
              'COTA',
              'ST',
              'Aide',
              'MSW',
              'Patient Representative',
              'Facility/Agency',
              'Other',
            ], textFieldPopup: [
              12,
              13
            ]),
          },
          {
            'question_id': 2,
            "type": "DATE",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Coordination Date: ",
            "options": generateOptions([""])
          },
          {
            'question_id': 3,
            "type": "TEXTFIELD",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Time",
            "options": generateOptions([""])
          },
          {
            'question_id': 4,
            "type": "TEXTFIELD",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Coordination details: ",
            "options": generateOptions([""])
          },
        ],
      },
    ]
  };
}
