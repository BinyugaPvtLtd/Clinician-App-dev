import '../generate_options.dart';

class FormDataPTRecert {
  static Map<int, Map<String,dynamic>> ptRecertDrawerItems = {
    2: administrativeInfoForm,
    3: clinicalRecordItems,
    4: patientHistory,
    //5: livingArrangements,
    7: safetyHazardEmergencyPlan,
    8: vitalSignsHeight,
    9: pain,
    12: neurologicalCognitive,
    14: behaviorRiskFactor,
    15: respiratory,
    18: gastrointestinalNutritionEndocrine,
    19: integumentary,
    21: musculoskeletal,
    22: functionalStatus,
    23: functionalAbilitiesAndGoals,
    24: fallRiskTherapyNeed,
    25: medications,
    28: rehospitalizationRisk,
    30: assessmentSummary,
    32: planOfCare,
    33: carePlanningCoordination,
    34: diagnosisCodes,
    38: supervision,
    41: subjective,
    42: functionalAssessment,
    43: testsScales,
    45: objective,
  };
  static Map<String,dynamic> administrativeInfoForm = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Administrative Information",
    "formId": 48,
    "subFormId": 776,
    "questions": [
      {
        'question_type_id': 0480776001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": false,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 1,
        "questions": [
          {
            "type": "INFO",
            "code": "M0010",
            "question_id": 1,
            "title": "<b>CMS Certification Number:</b>",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "description": '2359850'
          },
          {
            "type": "TEXTFIELD",
            "code": "M0014",
            "question_id": 2,
            "title": "<b>Branch State:</b>",
            "options_alignment": "VERTICAL",
            "scroll_axis": "HORIZONTAL",
            "description": '',
            "options": [
              {"index": 0, "label": "", "value": "", "selected": false},
            ]
          },
          {
            "type": "TEXTFIELD",
            "code": "M0016",
            "question_id": 3,
            "title": "<b>Branch ID Number:</b>",
            "options_alignment": "VERTICAL",
            "scroll_axis": "HORIZONTAL",
            "description": '',
            "options": [
              {"index": 0, "label": "", "value": "", "selected": false},
            ]
          },
          {
            "type": "TEXTFIELD",
            "code": "M0018",
            "question_id": 4,
            "title":
                "<b>National Provider Identifier (NPI)</b> for the attending physician who has signed the plan of care:",
            "options_alignment": "VERTICAL",
            "description": '',
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
                "selected": false,
                "hint": " "
              },
            ]
          },
          {
            "type": "CHECKBOX",
            "code": "M0018",
            "title": "",
            "options_alignment": "VERTICAL",
            "description": '',
            "question_id": 5,
            "options": [
              {
                "index": 0,
                "label": '<b>UK - Unknown or Not Available</b>',
                "value": "UK - Unknown or Not Available",
                "selected": false
              }
            ]
          },
          {
            "type": "TEXTFIELD",
            "code": "",
            "question_id": 6,
            "title": "<b>Primary Referring Physician I.D.: </b>",
            "options_alignment": "VERTICAL",
            "description": '',
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
                "selected": false,
                "hint": " "
              },
            ]
          },
          {
            "type": "CHECKBOX",
            "code": "",
            "title": "",
            "question_id": 7,
            "options_alignment": "VERTICAL",
            "description": '',
            "options": [
              {
                'index': 0,
                "label": '<b>UK - Unknown or Not Available</b>',
                "value": "UK - Unknown or Not Available",
                "selected": false
              }
            ]
          },
          {
            "type": "TEXTFIELD",
            "code": "",
            "title": "<b>Physician Signing Plan of Care:</b>",
            "options_alignment": "VERTICAL",
            "description": '',
            "question_id": 8,
            "options": List.generate(
              7,
              (index) {
                List<String> list = [
                  "Last:",
                  "First:",
                  "Phone:",
                  "Address:",
                  "City:",
                  "State:",
                  "Zip Code:"
                ];
                return {
                  "index": index,
                  "label": '<b>${list[index]}</b>',
                  "value": ""
                };
              },
            )
          },
          {
            "type": "TEXTFIELD",
            "code": "",
            "title": "<b>Other Physician:</b>",
            "options_alignment": "VERTICAL",
            "description": '',
            "question_id": 9,
            "options": List.generate(
              7,
              (index) {
                List<String> list = [
                  "Last:",
                  "First:",
                  "Phone:",
                  "Address:",
                  "City:",
                  "State:",
                  "Zip Code:"
                ];
                return {
                  "index": index,
                  "label": '<b>${list[index]}</b>',
                  "value": ""
                };
              },
            )
          },
          {
            "type": "TEXTFIELD",
            "code": "M0020",
            "question_id": 10,
            "title": "<b>Patient ID Number:</b>",
            "options_alignment": "VERTICAL",
            "scroll_axis": "HORIZONTAL",
            "description": '',
            "options": [
              {"index": 0, "label": "", "value": "", "selected": false},
            ]
          },
          {
            "type": "STATIC",
            "code": "M0030",
            "question_id": 11,
            "title": "<b>Start of Care Date:</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "description": '',
            "flag": ['*', 'P', '!', 'CC'],
            "options": generateOptions([""]),
          },
          {
            "type": "STATIC",
            "code": "M0032",
            "question_id": 12,
            "title": "<b>Resumption of Care Date:</b>",
            "options_alignment": "HORIZONTAL",
            "description": '',
            "flag": ['*', 'P', '!', 'CC'],
            "options": [
              {
                'index': 0,
                "value": 'NA - Not Applicable',
                "label": '<b>NA - Not Applicable</b>',
                "selected": false
              },
              {
                'index': 1,
                "value": '',
                "label": '',
              }
            ]
          },
          {
            "type": "TEXTFIELD",
            "code": "M0040",
            "question_id": 13,
            "title": "<b>Patient Name:</b>",
            "options_alignment": "HORIZONTAL",
            "description": '',
            "options": [
              {"index": 0, "label": "First:", "value": "", "selected": false},
              {"index": 1, "label": "MI:", "value": "", "selected": false},
            ]
          },
          {
            "type": "TEXTFIELD",
            "code": "",
            "question_id": 14,
            "title": "",
            "options_alignment": "HORIZONTAL",
            "description": '',
            "options": [
              {"index": 0, "label": "Last:", "value": "", "selected": false},
              {"index": 1, "label": "Suffix:", "value": "", "selected": false},
            ]
          },
          {
            "type": "TEXTFIELD",
            "code": "",
            "title": "",
            "options_alignment": "VERTICAL",
            "description": '',
            "question_id": 15,
            "options": List.generate(
              5,
              (index) {
                List<String> list = [
                  "Patient Phone:",
                  "Address:",
                  "Street:",
                  "Suite/Apt #:",
                  "City:",
                ];
                return {"index": index, "label": list[index], "value": ""};
              },
            )
          },
          {
            "type": "TEXTFIELD",
            "code": "M0050",
            "question_id": 16,
            "title": "<b>Patient State of Residence:</b>",
            "options_alignment": "VERTICAL",
            "scroll_axis": "HORIZONTAL",
            "description": '',
            "options": [
              {"index": 0, "label": "", "value": "", "selected": false},
            ]
          },
          {
            "type": "TEXTFIELD",
            "code": "M0060",
            "question_id": 17,
            "title": "<b>Patient ZIP Code:</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "VERTICAL",
            "description": '',
            "options": [
              {"index": 0, "label": "", "value": "", "selected": false},
            ]
          },
          {
            "type": "STATIC",
            "code": "M0063",
            "question_id": 18,
            "title": "<b>Medicare Number:</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "VERTICAL",
            "group_options": true,
            "options": generateOptions(
                ["", "<b>NA - No Medicare (including suffix)</b>"]),
          },
          {
            "type": "STATIC",
            "code": "M0064",
            "question_id": 19,
            "title": "<b>Social Security Number:</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "VERTICAL",
            "description": '',
            "group_options": true,
            "options":
                generateOptions(["", "<b>UK - Unknown or Not Available</b>"]),
          },
          {
            "type": "STATIC",
            "code": "M0065",
            "question_id": 20,
            "title": "<b>Medicaid Number: </b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "VERTICAL",
            "description": '',
            "group_options": true,
            "options": generateOptions(["", "<b>NA - No Medicaid</b>"]),
          },
          {
            "type": "DATE",
            "code": "M0066",
            "question_id": 21,
            "title": "<b>Birth Date:</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "VERTICAL",
            "description": '',
            "options": [
              {"index": 0, "label": "", "value": "", "selected": false},
            ]
          },
          {
            "type": "RADIO",
            "code": "M0069",
            "question_id": 22,
            "title": "<b>Gender: </b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "<b>1 - Male</b>",
                "value": "1 - Male",
                "selected": false
              },
              {
                "index": 1,
                "label": "<b>2 - Female</b>",
                "value": "2 - Female",
                "selected": false
              },
            ]
          }
        ]
      },
      {
        "question_type_id": 0480776002,
        "title": "<b>Discipline of Person Completing Assessment:</b>",
        "code": 'M0080',
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        'options_alignment': 'HORIZONTAL',
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "description": "",
        "options": [
          ...List.generate(
            4,
            (index) {
              var list = [
                '1 - RN',
                '2 - PT',
                '3 - SLP/ST',
                '4 - OT',
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
              };
            },
          )
        ]
      },
      {
        "question_type_id": 0480776003, //571041003,
        "title": "<b>Date Assessment Completed: </b>",
        "code": 'M0090',
        "type": "DATE",
        "question_type": "NON-COMPREHENSIVE",
        'options_alignment': 'HORIZONTAL',
        'scroll_axis': 'HORIZONTAL',
        "dynamic_type": true,
        "has_color": false,
        "description": "",
        "options": generateOptions([""]),
      },
      {
        "question_type_id": 0480776004, //571041004,
        "title":
            "<b>This Assessment is Currently Being Completed for the Following Reason:</b>",
        "code": 'M0100',
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "flag": ['*', 'P', 'O', 'V', '!', 'CC'],
        "description": "<b><u>Follow-up:</u></b>",
        "options": [
          ...List.generate(
            2,
            (index) {
              var list = [
                '4 - Recertification (follow-up) reassessment',
                '5 - Other follow-up',
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
              };
            },
          )
        ]
      },
      {
        "question_type_id": 0480776005, //571041005,
        "code": 'M0150',
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "title":
            "<b>Current Payment Sources for Home Care: ( Mark all that apply. )</b>",
        "options": [
          ...List.generate(
            13,
            (index) {
              var list = [
                '0 - None; no charge for current services',
                '1 - Medicare (traditional fee-for-service)',
                '2 - Medicare (HMO/managed care/Advantage plan)',
                '3 - Medicaid (traditional fee-for-service)',
                '4 - Medicaid (HMO/managed care)',
                '5 - Workers\' compensation',
                '6 - Title programs (for example, Title III, V, or XX)',
                '7 - Other government (for example, TriCare, VA)',
                '8 - Private insurance',
                '9 - Private HMO/managed care',
                '10 - Self-pay',
                '11 - Other (specify)',
                'UK - Unknown'
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
                if (index == 11) "popup_code": 'TEXTFIELDPOPUP'
              };
            },
          )
        ]
      },
      {
        "question_type_id": 0480776006, //571041005,
        "code": 'M0110',
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "title":
            "<b>Episode Timing: </b>Is the Medicare home health payment episode for which this assessment will define a case mix group an \"early\" episode or a \"later\" episode in the patient's current sequence of adjacent Medicare home health payment episodes?",
        "question_options": generateOptions([
          "1 - Early",
          "2 - Later",
          "UK - Unknown",
          "NA - Not Applicable: No Medicare case mix group to be defined by this assessment",
        ])
      },
    ]
  };
  static Map<String,dynamic> clinicalRecordItems = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Clinical Record Items & Patient Signature",
    "formId": 48,
    "subFormId": 777,
    "questions": [
      {
        "type": 'UPLOAD',
        "question_type_id": 0480777001, //571040001,
        "title": "<b>Patient Signature</b>",
        "code": '',
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "options_alignment": "VERTICAL",
        "options": [
          {
            "index": 0,
            "label": "Upload Signature",
            "value": "",
            "selected": false,
            "popup_code": "SIGNATUREPOPUP"
          },
        ]
      },
      {
        'question_type_id': 0480777002, //571040002,
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
        'question_type_id': 0480777003, //571040003,
        "type": "TEXTAREA",
        "question_type": "COMPREHENSIVE",
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
      {
        'question_type_id': 0480777004, //571040004,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Any MD/ER visits/hospitalization since last visit?</b>",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": 'No',
            "value": 'No',
          },
          {
            "index": 1,
            "label": 'Yes',
            "value": 'Yes',
          }
        ]
      },
      {
        'question_type_id': 0480777005, //571040005,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Any medication changes since last visit?</b>",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": 'No',
            "value": 'No',
          },
          {
            "index": 1,
            "label": 'Yes',
            "value": 'Yes',
          }
        ]
      },
    ]
  };

  static Map<String,dynamic> patientHistory = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 1,
    "title": "Immunizations/Care Management",
    "formId": 48,
    "subFormId": 778,
    "questions": [
      {
        'question_type_id': 0480778001,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "group_options": true,
        "dynamic_type": true,
        "title": "<b>Immunizations</b>",
        "description": "Any changes in immunizations?",
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions(
          ["No", "Yes (Explain)"],
          textFieldPopup: [1],
        ),
      },
      {
        'question_type_id': 0480778002,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "group_options": true,
        "dynamic_type": true,
        "title": "<b>Care Management</b>",
        "description":
            "Any changes in primary caregiver(s) or responsibilities?",
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions(
          ["No", "Yes (Explain)"],
          textFieldPopup: [1],
        ),
      }
    ]
  };

  static Map<String,dynamic> livingArrangements = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Living Arrangements",
    "formId": 48,
    "subFormId": 779,
    "questions": [
      {
        'question_type_id': 0480779001,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "title": "<b>Marital Status</b>",
        "scroll_axis": "HORIZONTAL",
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "options": List.generate(5, (index) {
          var list = [
            'Married',
            'Divorced',
            'Widowed',
            'Single',
            'Separated',
          ];
          return {
            "index": index,
            "label": list[index],
            "value": list[index],
            "selected": false
          };
        })
      },
      {
        'question_type_id': 0480779002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Patient Living Situation:</b> Which of the following best describes the patient's residential circumstance and availability of assistance? <b>(Check one box only.)</b>",
        "code": "M1100",
        "description": "<b>Availability of Assistance</b>",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "type": 'TABLE',
            "question_id": 1,
            "group_options": true,
            "options": List.generate(15, (index) {
              return {
                "index": index,
                "label": (index + 1).toString().padLeft(2, '0'),
                "value": (index + 1).toString().padLeft(2, '0'),
                "selected": false
              };
            })
          },
        ]
      },
      {
        'question_type_id': 0480779003,
        "type": "",
        "question_type": "COMPREHENSIVE",
        "title": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "type": 'RADIO',
            "question_id": 1,
            "group_options": true,
            "title": "Patient lives in:",
            "options": List.generate(3, (index) {
              final list = [
                "Own home/apartment",
                "Someone else's home",
                "Facility (specify)",
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
                if (index == 2) "popup_code": "TEXTFIELDPOPUP"
              };
            })
          },
          {
            "type": 'CHECKBOX',
            "question_id": 2,
            "group_options": false,
            "options": List.generate(2, (index) {
              final list = [
                "Patient lives with others",
                "Living situation that may impact Plan of Care",
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              };
            })
          },
        ]
      },
      {
        'question_type_id': 0480779004,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Emergency contact person outside of the home:<b>",
        "options_alignment": "VERTICAL",
        "description": "",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 4,
        'questions': [
          {
            "type": 'TEXTFIELD',
            "question_id": 1,
            "title": "Name:",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
              },
            ]
          },
          {
            "type": 'TEXTFIELD',
            "question_id": 2,
            "title": "Phone:",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
              },
            ]
          },
          {
            "type": 'TEXTFIELD',
            "question_id": 3,
            "title": "Comments:",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
              },
            ]
          },
        ]
      },
      {
        'question_type_id': 0480779005,
        "type": "",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Patient Representative</b>",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "type": 'CHECKBOX',
            "question_id": 1,
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": "Patient has not selected a Representative",
                "value": "Patient has not selected a Representative",
                "selected": false
              }
            ]
          },
          {
            "type": 'TEXTFIELD',
            "question_id": 2,
            "title": "Representative Name:",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
              },
            ]
          },
          {
            "type": 'TEXTFIELD',
            "question_id": 3,
            "title": "Representative Phone:",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
              },
            ]
          },
          {
            "type": 'TEXTFIELD',
            "question_id": 4,
            "title": "Representative Address:",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
              },
            ]
          },
          {
            "type": 'DROPDOWN',
            "question_id": 5,
            "title": "Relationship:",
            "scroll_axis": "HORIZONTAL",
            "options": List.generate(12, (index) {
              final list = [
                "Aunt/Uncle",
                "Child",
                "cousin",
                "Friend",
                "Guardian",
                "In-Law",
                "Niece/Nephew",
                "Other",
                "Parent",
                "Power of Attorney",
                "Sibling",
                "Spouse",
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": index == 0 ? true : false,
              };
            }),
          },
          {
            "type": 'DROPDOWN',
            "question_id": 6,
            "title": "Relationship type:",
            "scroll_axis": "HORIZONTAL",
            "options": List.generate(2, (index) {
              final list = [
                "Patient Selected Representative",
                "Legal Representation",
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
              };
            }),
          },
          {
            "type": 'DROPDOWN',
            "question_id": 7,
            "title": "Relationship role:",
            "scroll_axis": "HORIZONTAL",
            "options": List.generate(4, (index) {
              final list = [
                "Plan of Care decisions",
                "Household management assistance",
                "Financial decisions",
                "Health Care decisions",
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
              };
            }),
          },
          {
            "type": 'TEXTFIELD',
            "question_id": 8,
            "title": "Patient Representative primary language:",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
              },
            ]
          },
          {
            "type": 'TEXTFIELD',
            "question_id": 9,
            "title": "Printed Name of Authorized Representative:",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
              },
            ]
          },
          {
            "type": 'TEXTFIELD',
            "question_id": 10,
            "title":
                "Additional Representatives (contact information, type, role, language):",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
              },
            ]
          },
        ]
      },
    ]
  };

  static Map<String,dynamic> assistance = {
    "template_name": "OASIS PT RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Assistance",
    "formId": 48,
    "subFormId": 780,
    "questions": [
      {
        'question_type_id': 0480780001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Types and Sources of Assistance:</b> Determine the ability and willingness of non-agency caregivers (such as family members, friends, or privately paid caregivers) to provide assistance for the following activities, if assistance is needed. Excludes all care by your agency staff. ",
        "code": "M2102",
        "description": "<b>Availability of Assistance</b>",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "flag": ['!'],
        "questions": [
          {
            "type": 'RADIO',
            "question_id": 1,
            "group_options": true,
            "options": List.generate(4, (index) {
              return {
                "index": index,
                "label": (index >= 2 ? index + 1 : index).toString(),
                "value": index.toString(),
                "selected": false
              };
            })
          },
        ]
      },
      {
        'question_type_id': 0480780002,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Patient is </b>",
        "code": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          {
            "index": 0,
            "label": 'Ready to learn and make changes to improve health status',
            "value": 'Ready to learn and make changes to improve health status',
            "selected": false
          },
          {
            "index":1 ,
            "label": 'Having difficulty coping (explain)',
            "value": 'Having difficulty coping (explain)',
            "selected": false,
            "popup_code": "TEXTFIELDPOPUP"
          },
        ]
      },
      {
        'question_type_id': 0480780003,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Patient able to handle personal finances: </b>",
        "code": "",
        "description": "",
        "scroll_axis": "HORIZONTAL",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          {"index": 0, "label": 'Yes', "value": 'Yes', "selected": false},
          {"index": 0, "label": 'No', "value": 'No', "selected": false},
        ]
      },
      {
        'question_type_id': 0480780004,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Primary Caregiver</b>",
        "code": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": false,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "type": 'CHECKBOX',
            "question_id": 0,
            "options_alignment": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "value": 'Patient does not have a primary caregiver: ',
                "label": 'Patient does not have a primary caregiver: ',
                "selected": false,
              }
            ]
          },
          ...List.generate(
            5,
            (index) {
              var list = [
                'Primary Caregiver Name:',
                'Primary Caregiver Phone:',
                'Primary Caregiver Address:',
                'Relationship:',
                'Primary Caregiver\'s primary language:',
              ];
              return {
                "type": index == 3 ? 'DROPDOWN' : 'TEXTFIELD',
                "question_id": index + 1,
                "title": '<b>${list[index]}</b>',
                "options_alignment": "HORIZONTAL",
                "scroll_axis": "HORIZONTAL",
                "options": index != 3
                    ? [
                        {
                          "index": index,
                          "value": '',
                          "label": '',
                          "selected": false
                        }
                      ]
                    : List.generate(
                        13,
                        (index) {
                          var list = [
                            'Aunt/Uncle',
                            'Child',
                            'Cousin',
                            'Friend',
                            'GrandParent',
                            'Guardian',
                            'In-Law',
                            'Niece/Nephew',
                            'Other',
                            'Parent',
                            'Power of Attorney',
                            'Sibling',
                            'Spouse'
                          ];
                          return {
                            "index": index,
                            "label": list[index],
                            "value": list[index],
                            "selected": false
                          };
                        },
                      )
              };
            },
          )
        ]
      },
      {
        'question_type_id': 0480780005,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Caregiver is</b>",
        "code": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          {
            "index": 0,
            "label": 'Ready to learn and make changes to improve health status',
            "value": 'Ready to learn and make changes to improve health status',
            "selected": false
          },
          {
            "index":1 ,
            "label": 'Having difficulty coping (explain)',
            "value": 'Having difficulty coping (explain)',
            "selected": false,
            "popup_code": "TEXTFIELDPOPUP"
          },
        ]
      },
      {
        'question_type_id': 0480780006,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Primary Caregiver able/willing to assist with the following care:</b> (Select all that apply):",
        "code": "",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "type": 'CHECKBOX',
            "question_id": 1,
            "title": "",
            "group_options": false,
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": [
              ...List.generate(
                6,
                (index) {
                  var list = [
                    'Medication/tx assistance',
                    'ADLs',
                    'Shopping',
                    'Financial',
                    'Home maintenance',
                    'Other'
                  ];
                  return {
                    "index": index,
                    "value": list[index],
                    "label": list[index],
                    "selected": false,
                  };
                },
              ),
            ]
          },
          ...List.generate(
            2,
            (index) {
              var list = [
                'Primary Caregiver availability/schedule:',
                'Additional caregivers (contact information, relationship, assistance, availability/schedule):',
              ];
              return {
                "type": 'TEXTFIELD',
                "question_id": index + 6,
                "title": list[index],
                "options_alignment": "HORIZONTAL",
                "scroll_axis": "HORIZONTAL",
                "options": [
                  {"index": index, "value": '', "label": '', "selected": false}
                ]
              };
            },
          )
        ]
      },
    ]
  };

  static Map<String,dynamic> safetyHazardEmergencyPlan = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Safety Hazards/Emergency Plan",
    "formId": 48,
    "subFormId": 781,
    "questions": [
      {
        'question_type_id': 0480781001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Environmental safety hazards (select all that apply)</b>",
        "code": "",
        "description": "",
        // "scroll_axis": "HORIZONTAL",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "options": List.generate(
          17,
          (index) {
            var list = [
              'No hazards identified',
              'Pets',
              'Inadequate heating/cooling/electricity',
              'Inadequate sanitation/plumbing',
              'Inadequate lighting',
              'Inadequate safe food storage',
              'Inadequate medication storage/labeling',
              'Environment cluttered, pathways obstructed',
              'Floor coverings unsecured/in disrepair',
              'Stairs unsafe/no railings',
              'Oxygen in use',
              'Bathroom lacks grab bars/non-skid surfaces',
              'Insect/rodent infestation',
              'No phone available/unable to use phone',
              'Smoke detectors missing or not working',
              'Smoking observed or smoking items found in the home.',
              'Other (specify)'
            ];
            return {
              "index": index,
              "label": list[index],
              "value": list[index],
              "selected": false,
              if (index == 16) "popup_code": "TEXTFIELDPOPUP"
            };
          },
        )
      },
      {
        'question_type_id': 0480781002,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Emergency planning/fire safety</b>",
        "code": "",
        "description": "",
        "scroll_axis": "VERTICAL",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": List.generate(
          9,
          (index) {
            var list = [
              'Fire extinguishers present',
              'Smoke detectors on all levels of home',
              'Smoke detectors maintained',
              'More than one exit',
              'Plan for exit',
              'Plan for power failure',
              'Plan for natural disaster',
              'Oxygen: signs posted, observes safety measures',
              'Plan for backup oxygen'
            ];
            return {
              "type": 'RADIO',
              'question_id': index,
              "index": index,
              "title": list[index],
              "scroll_axis": 'HORIZONTAL',
              "options_alignment": "HORIZONTAL",
              "selected": false,
              'options': [
                ...List.generate(
                  [7, 8].contains(index) ? 3 : 2,
                  (inx) {
                    if ([7, 8].contains(index)) {
                      return {
                        "index": inx,
                        "value": inx == 0
                            ? 'NA'
                            : inx == 1
                                ? 'Yes'
                                : 'No',
                        "label": inx == 0
                            ? 'NA'
                            : inx == 1
                                ? 'Yes'
                                : 'No',
                        'selected': false
                      };
                    }
                    return {
                      "index": inx,
                      "value": inx == 0 ? 'Yes' : 'No',
                      "label": inx == 0 ? 'Yes' : 'No',
                      'selected': false
                    };
                  },
                )
              ]
            };
          },
        )
      },
      {
        'question_type_id': 0480781003, //0010032001,
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
                "label": "Safety Measures",
              }
            ]
          }
        ],
      },
    ]
  };

  static Map<String,dynamic> subjective = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Subjective",
    "formId": 48,
    "subFormId": 782,
    'questions': [
      {
        'question_type_id': 0480782001,
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
        'question_type_id': 0480782002,
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
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Pain",
    "formId": 48,
    "subFormId": 783,
    "questions": [
      {
        'question_type_id': 0480783001,
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
        'question_type_id': 0480783002,
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
        'question_type_id': 0480783003,
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
        'question_type_id': 0480783004,
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
        'question_type_id': 0480783005,
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
        'question_type_id': 0480783006,
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
        'question_type_id': 0480783007,
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
        'question_type_id': 0480783008,
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
        'question_type_id': 0480783009,
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
        'question_type_id': 0480783010,
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
        'question_type_id': 0480783011,
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
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Vital Signs,Height & Weight",
    "formId": 48,
    "subFormId": 784,
    'questions': [
      {
        'question_type_id': 0480784001,
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
        'question_type_id': 0480784002,
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
        'question_type_id': 0480784003,
        "type": "INFO",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
      },
    ]
  };

  static Map<String,dynamic> hearingSpeechVision = {
    "template_name": "OASIS PT RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Hearing/Speech/Vision",
    "formId": 2,
    "subFormId": 45,
    "questions": [
      {
        'question_type_id': 0020045001,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Hearing</b>",
        "code": "B0200",
        "description":
            '''<b>Ability to hear</b> (with hearing aid or hearing appliances if normally used)''',
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          ...List.generate(
            5,
            (index) {
              var list = [
                '0.<b>Adequate</b>— no difficulty in normal conversation, social interaction, listening to TV',
                '1.<b>Minimal difficulty</b>— difficulty in some environments (e.g., when person speaks softly, or setting is noisy)',
                '2.<b>Moderate difficulty</b>— speaker has to increase volume and speak distinctly',
                '3.<b>Highly impaired</b>— absence of useful hearing',
                '— Not assessed / no information',
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
        'question_type_id': 0020045002,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Vision</b>",
        "code": "B1000",
        "description":
            '''<b>Ability to see in adequate light</b> (with glasses or other visual appliances)''',
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          ...List.generate(
            6,
            (index) {
              var list = [
                '0.<b>Adequate</b>— sees fine detail, such as regular print in newspapers/books',
                '1.<b>Impaired</b>— sees large print, but not regular print in newspapers/books',
                '2.<b>Moderately impaired</b>— limited vision; not able to see newspaper headlines but can identify objects',
                '3.<b>Highly impaired</b>— object identification in question, but eyes appear to follow objects',
                '4.<b>Severely impaired</b>— no vision or sees only light, colors or shapes; eyes do not appear to follow objects',
                '— Not assessed / no information',
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
        'question_type_id': 0020045003,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Health Literacy <i>(From Creative Commons ©)</i></b>",
        "code": "B1300",
        "description":
            '''How often do you need to have someone help you when you read instructions, pamphlets, or other written material from your doctor or pharmacy?''',
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "options_alignment": "VERTICAL",
            "type": "OPTION",
            "group_options": true,
            "title": '',
            "options": List.generate(
              7,
              (index) {
                var list = [
                  '0.<b>Never</b>',
                  '1.<b>Rarely</b>',
                  '2.<b>Sometimes</b>',
                  '3.<b>Often</b>',
                  '4.<b>Always</b>',
                  '7.<b>Patient declines to respond</b>',
                  '8.<b>Patient unable to respond</b>',
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
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "title":
                '<i>The Single Item Literacy Screener is licensed under a Creative Commons Attribution Noncommercial 4.0 International License.</i>',
            "options": []
          },
        ]
      },
      {
        'question_type_id': 0020045004,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Ears/Nose/Throat/Mouth</b>",
        "code": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "options_alignment": "HORIZONTAL",
            "type": "CHECKBOX",
            "title": '',
            "options": [
              {
                "index": 0,
                "value": 'No deficits',
                "label": 'No deficits',
                "selected": false
              }
            ]
          },
          ...List.generate(
            3,
            (index) {
              var list = [
                'Hearing Loss:',
                'Hearing aides:',
                'Ear Pain:',
              ];
              return {
                "question_id": index + 2,
                "options_alignment": "HORIZONTAL",
                "type": "CHECKBOX",
                "title": '',
                "options": [
                  ...List.generate(
                    3,
                    (inx) {
                      var lst = [list[index], 'R', 'L'];
                      return {
                        "index": inx,
                        "value": lst[inx],
                        "label": lst[inx],
                        "selected": false
                      };
                    },
                  ),
                ]
              };
            },
          ),
          {
            "question_id": 5,
            "options_alignment": "VERTICAL",
            "type": "CHECKBOX",
            "title": '',
            "options": [
              ...List.generate(
                3,
                (inx) {
                  var lst = [
                    'Nasal congestion/sinus problems',
                    'Loss of Smell',
                    'Chewing problems'
                  ];
                  return {
                    "index": inx,
                    "value": lst[inx],
                    "label": lst[inx],
                    "selected": false
                  };
                },
              ),
            ]
          },
          {
            "question_id": 6,
            "options_alignment": "VERTICAL",
            "type": "CHECKBOX",
            "title": '',
            "options": [
              {
                "index": 0,
                "value": 'Tinnitus',
                "label": 'Tinnitus',
                "selected": false
              }
            ]
          },
          {
            "question_id": 7,
            "options_alignment": "HORIZONTAL",
            "type": "CHECKBOX",
            "title": '',
            "options": [
              ...List.generate(
                2,
                (inx) {
                  var lst = [
                    'Hoarseness',
                    'Sore Throat',
                  ];
                  return {
                    "index": inx,
                    "value": lst[inx],
                    "label": lst[inx],
                    "selected": false
                  };
                },
              ),
            ]
          },
          {
            "question_id": 8,
            "options_alignment": "HORIZONTAL",
            "type": "CHECKBOX",
            "title": '',
            "options": [
              ...List.generate(
                4,
                (inx) {
                  var lst = ['Dentures', 'Upper', 'Lower', 'Partial'];
                  return {
                    "index": inx,
                    "value": lst[inx],
                    "label": lst[inx],
                    "selected": false
                  };
                },
              ),
            ]
          },
          {
            "question_id": 9,
            "options_alignment": "VERTICAL",
            "type": "CHECKBOX",
            "title": '',
            "options": [
              {
                "index": 0,
                "value": 'Other',
                "label": 'Other',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              }
            ]
          }
        ]
      },
      {
        'question_type_id': 0020045005,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Vision</b>",
        "code": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "options_alignment": "HORIZONTAL",
            "type": "CHECKBOX",
            "title": '',
            "options": [
              {
                "index": 0,
                "value": 'No deficits',
                "label": 'No deficits',
                "selected": false
              }
            ]
          },
          ...List.generate(
            4,
            (index) {
              var list = [
                'Glasses',
                'Contacts:',
                'Cataracts:',
                'Glaucoma',
              ];
              return {
                "question_id": index + 2,
                "options_alignment": "HORIZONTAL",
                "type": "CHECKBOX",
                "title": '',
                "options": [
                  ...List.generate(
                    index == 0 ? 1 : 3,
                    (inx) {
                      var lst = [list[index], 'R', 'L'];
                      return {
                        "index": inx,
                        "value": lst[inx],
                        "label": lst[inx],
                        "selected": false
                      };
                    },
                  ),
                ]
              };
            },
          ),
          ...List.generate(
            4,
            (index) {
              var list = [
                'Macular Degeneration:',
                'Blurred vision',
                'Legally blind:',
                'Cataract surgery:',
              ];
              return {
                "question_id": index + 5,
                "options_alignment": "HORIZONTAL",
                "type": "CHECKBOX",
                "title": '',
                "options": [
                  ...List.generate(
                    3,
                    (inx) {
                      var lst = [list[index], 'R', 'L'];
                      return {
                        "index": inx,
                        "value": lst[inx],
                        "label": lst[inx],
                        "selected": false
                      };
                    },
                  ),
                ]
              };
            },
          ),
          {
            "question_id": 10,
            "options_alignment": "VERTICAL",
            "type": "CHECKBOX",
            "title": '',
            "options": [
              {
                "index": 0,
                "value": 'Other',
                "label": 'Other',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              }
            ]
          }
        ]
      },
      {
        'question_type_id': 0020045006,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "Learning Barrier(s)",
        "code": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "options_alignment": "HORIZONTAL",
            "type": "CHECKBOX",
            "title": '',
            "options": [
              {
                "index": 0,
                "value": 'None identified',
                "label": 'None identified',
                "selected": false
              }
            ]
          },
          {
            "question_id": 2,
            "options_alignment": "HORIZONTAL",
            "type": "CHECKBOX",
            "title": '',
            "options": [
              ...List.generate(
                9,
                (inx) {
                  var lst = [
                    'Reading/Writing',
                    'Language',
                    'Mental',
                    'Functional',
                    'Psychosocial',
                    'Physical',
                    'Vision',
                    'Hearing',
                    'Other'
                  ];
                  return {
                    "index": inx,
                    "value": lst[inx],
                    "label": lst[inx],
                    "selected": false,
                    if (inx == 8) "popup_code": "TEXTFIELDPOPUP"
                  };
                },
              ),
            ]
          }
        ]
      }
    ]
  };

  static Map<String,dynamic> bims = {
    "template_name": "OASIS PT RECERT",
    "template_code": "",
    "cols": 1,
    "title": "BIMS",
    "formId": 2,
    "subFormId": 46,
    "questions": [
      {
        'question_type_id': 0020046001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Should Brief Interview for Mental Status (C0200-C0500) be Conducted?</b>",
        "code": "C0100",
        "description": "Attempt to conduct interview with all patients.",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "options_alignment": "VERTICAL",
            "type": "OPTION",
            "group_options": true,
            "title": '',
            "options": [
              ...List.generate(
                3,
                (index) {
                  var list = [
                    '0.  <b>No</b> (patient is rarely/never understood)',
                    '1.  <b>Yes</b> → Continue to C0200, Repetition of Three Words',
                    '-  Not Assessed/No Information',
                  ];
                  return {
                    "index": index,
                    "value": list[index],
                    "label": list[index],
                    "selected": false,
                    "hint": index == 0
                        ? '→Skip BIMS - C0200, C0300, C0400, & C0500 '
                        : " ",
                  };
                },
              )
            ]
          },
          {
            "question_id": 1,
            "options_alignment": "VERTICAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": 'Additional details - should BIMS be conducted:',
            "options": [
              {"index": 0, "value": ''}
            ]
          }
        ]
      },
      {
        'question_type_id': 0020046002,
        "type": "INFO",
        "question_type": "COMPREHENSIVE",
        "title": '<b>Brief Interview for Mental Status (BIMS)</b>',
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
      },
      {
        'question_type_id': 0020046003,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Repetition of Three Words</b>",
        "code": "C0200",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "group_options": true,
            "title":
                'Ask patient: <i>“I am going to say three words for you to remember. Please repeat the words after I have said all three. The words are: <b>sock, blue, and bed.</b> Now tell me the three words."</i>.',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          {
            "question_id": 2,
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "group_options": true,
            "title": '<b>Number of words repeated after first attempt</b>',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          {
            "question_id": 3,
            "options_alignment": "VERTICAL",
            "type": "OPTION",
            "group_options": true,
            "title": '',
            "options": [
              ...List.generate(
                5,
                (index) {
                  var list = [
                    '0.  <b>None</b>',
                    '1.  <b>One</b>',
                    '2.  <b>Two</b>',
                    '3.  <b>Three</b>',
                    '-  Not Assessed/No Information',
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
            "question_id": 4,
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "group_options": true,
            "title":
                '''After the patient's first attempt, repeat the words using cues (<i>“sock, something to wear; blue, a color; bed, a piece of furniture”</i>). You may repeat the words up to two more times.''',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          {
            "question_id": 5,
            "options_alignment": "VERTICAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": 'Additional details - repetition of three words:',
            "options": [
              {"index": 0, "value": ''}
            ]
          }
        ]
      },
      {
        'question_type_id': 0020046004,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Temporal Orientation</b> (Orientation to year, month, and day)",
        "code": "C0300",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          // a.
          {
            "question_id": 1,
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "group_options": true,
            "title":
                'Ask patient: <i>“Please tell me what year it is right now.”</i>',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          {
            "question_id": 2,
            "options_alignment": "VERTICAL",
            "type": "OPTION",
            "group_options": true,
            "title": 'A. <b>Able to report correct year</b>',
            "options": [
              ...List.generate(
                5,
                (index) {
                  var list = [
                    '0.  <b>Missed by > 5 years</b> or no answer',
                    '1.  <b>Missed by 2-5 years</b>',
                    '2.  <b>Missed by 1 year</b>',
                    '3.  <b>Correct</b>',
                    '-  Not Assessed/No Information',
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
            "question_id": 3,
            "options_alignment": "VERTICAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": 'Additional details - ability to report correct year:',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          // b.
          {
            "question_id": 4,
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "group_options": true,
            "title": 'Ask patient: <i>"What month are we in right now?"</i>',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          {
            "question_id": 5,
            "options_alignment": "VERTICAL",
            "type": "OPTION",
            "group_options": true,
            "title": 'B. <b>Able to report correct month</b>',
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = [
                    '0.  <b>Missed by > 1 month</b> or no answer',
                    '1.  <b>Missed by 6 days to 1 month</b>',
                    '2.  <b>Accurate within 5 days</b>',
                    '-  Not Assessed/No Information',
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
            "question_id": 6,
            "options_alignment": "VERTICAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": 'Additional details - ability to report correct month:',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          // c.
          {
            "question_id": 7,
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "group_options": true,
            "title": 'Ask patient: <i>"What day of the week is today?"</i>',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          {
            "question_id": 8,
            "options_alignment": "VERTICAL",
            "type": "OPTION",
            "group_options": true,
            "title": 'C. <b>Able to report correct day of the week</b>',
            "options": [
              ...List.generate(
                3,
                (index) {
                  var list = [
                    '0.  <b>Incorrect</b> or no answer',
                    '1.  <b>Correct</b>',
                    '-  Not Assessed/No Information',
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
            "question_id": 9,
            "options_alignment": "VERTICAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title":
                'Additional details - ability to report correct day of the week:',
            "options": [
              {"index": 0, "value": ''}
            ]
          }
        ]
      },
      {
        'question_type_id': 0020046005,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Recall</b>",
        "code": "C0400",
        "description":
            '''<p>Ask patient: <i>“Let's go back to an earlier question. What were those three words that I asked you to repeat?</i></p>
            
           If unable to remember a word, give cue (something to wear; a color; a piece of furniture) for that word.''',
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          // a.
          {
            "question_id": 1,
            "options_alignment": "VERTICAL",
            "type": "OPTION",
            "group_options": true,
            "title": 'A. <b>Able to recall “sock”</b>',
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = [
                    '0.  <b>No</b> - could not recall',
                    '1.  <b>Yes, after cueing </b>(“something to wear”) ',
                    '2.  <b>Yes, no cue required</b>',
                    '-  Not Assessed/No Information',
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
            "question_id": 2,
            "options_alignment": "VERTICAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": 'Additional details - ability to recall "sock":',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          // b.
          {
            "question_id": 3,
            "options_alignment": "VERTICAL",
            "type": "OPTION",
            "group_options": true,
            "title": 'B. <b>Able to recall “blue”</b>',
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = [
                    '0.  <b>No</b> - could not recall',
                    '1.  <b>Yes, after cueing </b>(“a color”) ',
                    '2.  <b>Yes, no cue required</b>',
                    '-  Not Assessed/No Information',
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
            "question_id": 5,
            "options_alignment": "VERTICAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": 'Additional details - ability to recall "blue":',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          // c.
          {
            "question_id": 6,
            "options_alignment": "VERTICAL",
            "type": "OPTION",
            "group_options": true,
            "title": 'C. <b>Able to recall “bed”</b>',
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = [
                    '0.  <b>No</b> - could not recall',
                    '1.  <b>Yes, after cueing</b>("a piece of furniture")',
                    '2. <b>Yes, no cue required</b>',
                    '-  Not Assessed/No Information',
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
            "question_id": 7,
            "options_alignment": "VERTICAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": 'Additional details - ability to recall "bed":',
            "options": [
              {"index": 0, "value": ''}
            ]
          }
        ]
      },
      {
        'question_type_id': 0020046006,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "",
        "code": "",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "options_alignment": "VERTICAL",
            "scroll_axis": "HORIZONTAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": 'Calculation of any SELECTED NUMERIC VALUE fields:',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          {
            "question_id": 2,
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "group_options": true,
            "title":
                '(If this value is the correct answer for C0500, enter it in the "Enter Score" field below)',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          {
            "question_id": 3,
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "group_options": true,
            "title":
                '<b>NOTE - This calculation may not be the correct answer to C0500. Review the OASIS E guidance manual for scoring instructions. Based on clinical interactions and results, some scoring scenarios may require a "-" dash or a score of "99" be entered in C0500.</b>',
            "options": [
              {"index": 0, "value": ''}
            ]
          }
        ]
      },
      {
        'question_type_id': 0020046007,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>BIMS Summary Score</b>",
        "code": "C0500",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          // a.
          {
            "question_id": 1,
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "group_options": true,
            "title":
                '<b>Add scores</b> for questions C0200-C0400 and fill in total score (00-15)',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          {
            "question_id": 2,
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "group_options": true,
            "title":
                '<b>Enter 99 if the patient was unable to complete the interview</b>',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          {
            "question_id": 3,
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "type": "INFO",
            "group_options": true,
            "title": '<b>Enter Score</b>',
            "options": [
              {"index": 0, "value": ''}
            ]
          },
          {
            "question_id": 4,
            "options_alignment": "VERTICAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": 'Additional details - BIMS Summary Score:',
            "options": [
              {"index": 0, "value": ''}
            ]
          }
        ]
      }
    ]
  };

  static Map<String,dynamic> neurologicalCognitive = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Neurological/Cognitive Status",
    "formId": 48,
    "subFormId": 787,
    "questions": [
      {
        'question_type_id': 0480787001,
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
        'question_type_id': 0480787002, //0010032001,
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
                "label": "Mental/Psychosocial/Cognitive Status",
              }
            ]
          }
        ],
      },
    ]
  };

  static Map<String,dynamic> mood = {
    "template_name": "OASIS PT RECERT",
    "template_code": "",
    "cols": 1,
    "title": "Mood",
    "formId": 2,
    "subFormId": 48,
    "questions": [
      {
        'question_type_id': 0020048001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "description":
            '''<p><b>Say to patient: <i>"Over the last 2 weeks, have you been bothered by any of the following problems?"</i></b></p>
            <p>If symptom is present, enter 1 (yes) in column 1, Symptom Presence.</p>
            <p>If yes in column 1, then ask the patient: "About how often have you been bothered by this?</p>
            <p>Read and show the patient a card with the symptom frequency choices. Indicate response in column 2, Symptom Frequency.</p>''',
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "code": 'D0150',
        "title": '<b>Patient Mood Interview (PHQ-2 to 9)</b>',
        "questions": [
          ...List.generate(
            10,
            (index) {
              var list = [
                'A. <b>Little interest or pleasure in doing things</b>',
                'B. <b>Feeling down, depressed, or hopeless</b>',
                "<b>If either D0150A2 or D0150B2 is coded 2 or 3, CONTINUE asking the questions below. If not, END the PHQ interview.</b>",
                '<i>C. <b>Trouble falling or staying asleep, or sleeping too much</b></i>',
                '<i>D. <b>Feeling tired or having little energy</b></i>',
                '<i>E. <b>Poor appetite or overeating</b></i>',
                '<i>F. <b>Feeling bad about yourself - or that you are a failure or have let yourself or your family down</b></i>',
                '<i>G. <b>Trouble concentrating on things, such as reading the newspaper or watching television</b></i>',
                '<i>H. <b>Moving or speaking so slowly that other people could have noticed. Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual </b></i>',
                '<i>I. <b>Thoughts that you would be better off dead, or of hurting yourself in some way</b></i>',
              ];

              return {
                "type": 'INFO',
                "question_id": index + 1,
                "group_options": true,
                "code": '',
                "scroll_axis": "HORIZONTAL",
                "options_alignment": "HORIZONTAL",
                "title": list[index],
                "options": [
                  {"index": 0, "value": '', "label": '', "selected": false},
                  {"index": 1, "value": '', "label": '', "selected": false},
                ]
              };
            },
          ),
          ...List.generate(
            10,
            (index) {
              return {
                "type": 'DROPDOWN',
                "question_id": index + 10,
                "group_options": true,
                "code": '',
                // "scroll_axis": "HORIZONTAL",
                "options_alignment": "HORIZONTAL",
                "title": '',
                "options": [
                  {"index": 0, "value": '', "label": '0', "selected": false},
                  {"index": 1, "value": '', "label": '1', "selected": false},
                  {"index": 2, "value": '', "label": '9', "selected": false},
                  {"index": 3, "value": '', "label": '-', "selected": false},
                ]
              };
            },
          ),
          ...List.generate(
            10,
            (index) {
              return {
                "type": 'DROPDOWN',
                "question_id": index + 20,
                "group_options": true,
                "code": '',
                // "scroll_axis": "HORIZONTAL",
                "options_alignment": "HORIZONTAL",
                "title": '',
                "options": [
                  {"index": 0, "value": '', "label": '0', "selected": false},
                  {"index": 1, "value": '', "label": '1', "selected": false},
                  {"index": 2, "value": '', "label": '2', "selected": false},
                  {"index": 3, "value": '', "label": '3', "selected": false},
                ]
              };
            },
          ),
          {
            "question_id": 31,
            "type": 'INFO',
            "group_options": true,
            "code": '',
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "title":
                '<i>Copyright © Pfizer Inc. All rights reserved. Reproduced with permission</i>'
          }
        ]
      },
      {
        'question_type_id': 0020048002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "description": "",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "code": 'D0160',
        "title": '<b>Total Severity Score</b>',
        "questions": [
          {
            "question_id": 1,
            "options_alignment": "VERTICAL",
            "scroll_axis": "HORIZONTAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": '<b>Enter Score</b>',
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
            "question_id": 2,
            "options_alignment": "VERTICAL",
            "type": "INFO",
            "group_options": true,
            "title":
                '<b>Add scores for all frequency responses in Column 2</b> Symptom Frequency. Total score must be between 00 and 27. Enter 99 if unable to complete interview (i.e., Symptom Frequency is blank for 3 or more required items)',
            "options": []
          },
          {
            "question_id": 3,
            "options_alignment": "VERTICAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": "Additional details - depression screening",
            "options": [
              {"index": 0, "value": ''}
            ]
          },
        ]
      },
      {
        'question_type_id': 0020048003,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "description":
            "How often do you feel lonely or isolated from those around you?",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "code": 'D0700',
        "title": '<b>Social Isolation</b>',
        "options": [
          ...List.generate(
            7,
            (index) {
              var list = [
                '0. <b>Never</b>',
                '1. <b>Rarely</b>',
                '2. <b>Sometimes</b>',
                '3. <b>Often</b>',
                '4. <b>Always</b>',
                '7. <b>Patient declines to respond</b>',
                '8. <b>Patient unable to respond</b>',
              ];
              return {
                "index": index,
                "value": list[index],
                "label": list[index],
              };
            },
          )
        ]
      }
    ]
  };

  static Map<String,dynamic> behaviorRiskFactor = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Behavior/Risk Factors",
    "formId": 48,
    "subFormId": 789,
    "questions": [
      {
        'question_type_id': 0480789001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Risk Factors</b>",
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
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'None Identified',
                "value": 'None Identified',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(5, (index) {
              final options = [
                "Drug dependency",
                "Smoking",
                "Obesity",
                "Alcohol dependency",
                "Physical inactivity"
              ];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
              };
            })
          }
        ]
      },
      {
        'question_type_id': 0480789002,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Evidence of abuse/neglect/exploitation</b>",
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
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'None observed/reported',
                "value": 'None observed/reported',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(5, (index) {
              final options = [
                "Verbal/Emotional",
                "Actual",
                "Potential",
                "Physical",
                "Financial"
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
            "type": "TEXTFIELD",
            "title":
                "Describe reported or observed evidence and actions taken:",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": '',
                "value": '',
                "selected": false,
              }
            ]
          }
        ]
      },
    ]
  };

  static Map<String,dynamic> respiratory = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Respiratory/Cardiovascular",
    "formId": 48,
    "subFormId": 790,
    "questions": [
      {
        'question_type_id': 0480790001,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Respiratory Status</b>",
        "code": "",
        "description": "Any changes in respiratory status?",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options_alignment": "HORIZONTAL",
        "question_options": generateOptions(
          ["No", "Yes (Explain)"],
          textFieldPopup: [1],
        ),
      },
      {
        'question_type_id': 0480790002,
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
        'question_type_id': 0480790003,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Cardiovascular Status</b>",
        "code": "",
        "description": "Any changes in cardiovascular status?",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions(
          ["No", "Yes (Explain)"],
          textFieldPopup: [1],
        ),
      },
    ]
  };

  static Map<String,dynamic> cardioVascular = {
    "template_name": "OASIS PT RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Cardiovascular",
    "formId": 2,
    "subFormId": 51,
    "questions": [
      {
        'question_type_id': 0020051001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Cardiovascular History</b>",
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
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'No History',
                "value": 'No History',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "VERTICAL",
            "group_options": true,
            "options": List.generate(6, (index) {
              final options = [
                "Hypertension",
                "Tachycardia",
                "Stent",
                "Heart Failure",
                "Pacemaker",
                "Atrial Fibrillation",
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
            "code": "",
            "description": "",
            "options_alignment": "VERTICAL",
            "group_options": true,
            "options": List.generate(6, (index) {
              final options = [
                "Hypotension",
                "Bradycardia",
                "CABG",
                "CAD",
                "Implanted Defibrillator",
                "PAD",
              ];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": index == 0 ? true : false,
              };
            })
          },
          {
            "question_id": 4,
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
        'question_type_id': 0020051002,
        "type": "INFO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "",
        "code": "",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String,dynamic> genitourinary = {
    "template_name": "OASIS PT RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Genitourinary",
    "formId": 2,
    "subFormId": 52,
    "questions": [
      {
        'question_type_id': 0020052001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Genitourinary History</b>",
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
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'No History',
                "value": 'No History',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(6, (index) {
              final options = [
                "Frequent UTI's",
                "Chronic UTI",
                "Kidney stones",
                "Polycystic disease",
                "Renal disease",
                "Dialysis (type/freq)",
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
        'question_type_id': 0020052002,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Gynecological History</b>",
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
            "options": [
              {
                "index": 0,
                "label": 'No history',
                "value": 'No history',
                "selected": false,
              }
            ]
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(3, (index) {
              final options = [
                "Prior surgery",
                "Cancer",
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
      {
        'question_type_id': 0020052003,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "Has this patient been treated for a <b>Urinary Tract Infection</b> in the past 14 days?",
        "code": "M1600",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "flag": ['!'],
        "options": List.generate(
          4,
          (index) {
            var list = [
              '0 - No',
              '1 - Yes',
              'NA - Patient on prophylactic treatment',
              'UK - Unknown',
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
        'question_type_id': 0020052004,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Urinary Incontinence or Urinary Catheter Presence:</b>",
        "code": "M1610",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": List.generate(
          3,
          (index) {
            var list = [
              '0 - No incontinence or catheter (includes anuria or ostomy for urinary drainage)',
              '1 - Patient is incontinent',
              '2 - Patient requires a urinary catheter (specifically: external, indwelling, intermittent, or suprapubic)',
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

  static Map<String,dynamic> gastrointestinalNutritionEndocrine = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "GU / GI / Nutrition / Endocrine",
    "formId": 48,
    "subFormId": 793,
    'questions': [
      {
        'question_type_id': 0480793001,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Genitourinary Status</b>",
        "code": "",
        "description": "Any changes in genitourinary status?",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options_alignment": "HORIZONTAL",
        "question_options": generateOptions(
          ["No", "Yes (Explain)"],
          textFieldPopup: [1],
        ),
      },
      {
        'question_type_id': 0480793002,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Gastrointestinal Status</b>",
        "code": "",
        "description": "Any changes in gastrointestinal status?",
        "group_options": true,
        "dynamic_type": true,
        "answer_id": 0,
        "options_alignment": "HORIZONTAL",
        "question_options": generateOptions(
          ["No", "Yes (Explain)"],
          textFieldPopup: [1],
        ),
      },
      {
        'question_type_id': 0480793003,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Endocrine Status</b>",
        "code": "",
        "description": "Any changes in endocrine status?",
        "group_options": true,
        "dynamic_type": true,
        "answer_id": 0,
        "options_alignment": "HORIZONTAL",
        "question_options": generateOptions(
          ["No", "Yes (Explain)"],
          textFieldPopup: [1],
        ),
      },
      {
        'question_type_id': 0480793004,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Diabetic Foot Inspection</b>",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "findings:",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "options": [
              {"index": 0, "label": '', "value": '', "selected": false,"popup_code": "TEXTFIELDPOPUP",}
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
              {"index": 0, "label": 'NA', "value": '', "selected": false}
            ]
          },
        ]
      },
      {
        'question_type_id': 0480793005,
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
          ...List.generate(
            11,
            (index) {
              return {
                "question_id": index,
                "type": index == 10 ? "TEXTFIELD" : "CHECKBOX",
                "title": "",
                "code": "",
                "description": "",
                "options_alignment": "HORIZONTAL",
                "group_options": true,
                "options": [
                  {
                    "index": 0,
                    "label": index == 10
                        ? '<b>Total</b>'
                        : [6, 7].contains(index)
                            ? '1'
                            : index == 1
                                ? '3'
                                : index == 5
                                    ? '4'
                                    : '2',
                    "value": '',
                    "selected": false
                  }
                ]
              };
            },
          )
        ]
      },
      {
        'question_type_id': 0480793006, //0010032001,
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
    ]
  };

  static Map<String,dynamic> functionalStatus = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Functional Status",
    "formId": 48,
    "subFormId": 800,
    'questions': [
      {
        'question_type_id': 0480800001,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Grooming:</b>",
        "code": "M1800",
        "description":
            "Current ability to tend safely to personal hygiene needs (specifically: washing face and hands, hair care, shaving or make up, teeth or denture care, or fingernail care).",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "flag": ["O", "\$", "V", "!"],
        "answer_id": 0,
        "question_options": List.generate(4, (index) {
          final options = [
            "0 - Able to groom self unaided, with or without the use of assistive devices or adapted methods.",
            "1 - Grooming utensils must be placed within reach before able to complete grooming activities.",
            "2 - Someone must assist the patient to groom self.",
            "3 - Patient depends entirely upon someone else for grooming needs.",
          ];
          return {
            "index": index,
            "label": options[index],
            "value": options[index],
            "selected": index == 0 ? true : false,
          };
        }),
      },
      {
        'question_type_id': 0480800002,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title":
            " Current <b>Ability to Dress <u>Upper</u> Body</b> safely (with or without dressing aids) including undergarments, pullovers, front-opening shirts and blouses, managing zippers, buttons, and snaps:",
        "code": "M1810",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "flag": ["O", "\$", "V"],
        "question_options": List.generate(4, (index) {
          final options = [
            "0 - Able to get clothes out of closets and drawers, put them on and remove them from the upper body without assistance.",
            "1 - Able to dress upper body without assistance if clothing is laid out or handed to the patient.",
            "2 - Someone must help the patient put on upper body clothing.",
            "3 - Patient depends entirely upon another person to dress the upper body.",
          ];
          return {
            "index": index,
            "label": options[index],
            "value": options[index],
            "selected": index == 0 ? true : false,
          };
        }),
      },
      {
        'question_type_id': 0480800003,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title":
            " Current <b>Ability to Dress <u>Lower</u> Body</b> safely (with or without dressing aids) including undergarments, slacks, socks or nylons, shoes:",
        "code": "M1820",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "flag": ["O", "\$", "V"],
        "question_options": List.generate(4, (index) {
          final options = [
            "0 - Able to obtain, put on, and remove clothing and shoes without assistance.",
            "1 - Able to dress lower body without assistance if clothing and shoes are laid out or handed to the patient.",
            "2 - Someone must help the patient put on undergarments, slacks, socks or nylons, and shoes.",
            "3 - Patient depends entirely upon another person to dress lower body.",
          ];
          return {
            "index": index,
            "label": options[index],
            "value": options[index],
            "selected": index == 0 ? true : false,
          };
        }),
      },
      {
        'question_type_id': 0480800004,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Bathing:</b>",
        "description":
            " Current ability to wash entire body safely. <b><u>Excludes</u> grooming (washing face, washing hands, and shampooing hair).</b>",
        "code": "M1830",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "flag": ["*", "O", "\$", "V", "!", "CC"],
        "question_options": List.generate(7, (index) {
          final options = [
            "0 - Able to bathe self in <u>shower or tub</u> independently, including getting in and out of tub/shower.",
            "1 - With the use of devices, is able to bathe self in shower or tub independently, including getting in and out of the tub/shower",
            "2 - Able to bathe in shower or tub with the intermittent assistance of another person: <br>(a) for intermittent supervision or encouragement or reminders, <u>OR</u> <br>(b) to get in and out of the shower or tub, <u>OR</u> <br>(c) for washing difficult to reach areas.",
            "3 - Able to participate in bathing self in shower or tub, <u>but</u> requires presence of another person throughout the bath for assistance or supervision",
            "4 - Unable to use the shower or tub, but able to bathe self independently with or without the use of devices at the sink, in chair, or on commode.",
            "5 - Unable to use the shower or tub, but able to participate in bathing self in bed, at the sink, in bedside chair, or on commode, with the assistance or supervision of another person.",
            "6 - Unable to participate effectively in bathing and is bathed totally by another person.",
          ];
          return {
            "index": index,
            "label": options[index],
            "value": options[index],
            "selected": index == 0 ? true : false,
          };
        }),
      },
      {
        'question_type_id': 0480800005,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Toilet Transferring:</b>",
        "description":
            "Current ability to get to and from the toilet or bedside commode safely and transfer on and off toilet/commode.",
        "code": "M1840",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "flag": [
          "O",
          "\$",
          "V",
          "!",
        ],
        "question_options": List.generate(5, (index) {
          final options = [
            "0 - Able to get to and from the toilet and transfer independently with or without a device.",
            "1 - When reminded, assisted, or supervised by another person, able to get to and from the toilet and transfer.",
            "2 - <u>Unable</u> to get to and from the toilet but is able to use a bedside commode (with or without assistance).",
            "3 - <u>Unable</u> to get to and from the toilet or bedside commode but is able to use a bedpan/urinal independently.",
            "4 - Is totally dependent in toileting.",
          ];
          return {
            "index": index,
            "label": options[index],
            "value": options[index],
            "selected": index == 0 ? true : false,
          };
        }),
      },
      {
        'question_type_id': 0480800006,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Transferring:</b>",
        "description":
            " Current ability to move safely from bed to chair, or ability to turn and position self in bed if patient is bedfast.",
        "code": "M1850",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "flag": ["*", "O", "\$", "V", "!", "CC"],
        "question_options": List.generate(6, (index) {
          final options = [
            "0 - Able to independently transfer.",
            "1 - Able to transfer with minimal human assistance or with use of an assistive device.",
            "2 - Able to bear weight and pivot during the transfer process but unable to transfer self.",
            "3 - Unable to transfer self and is unable to bear weight or pivot when transferred by another person.",
            "4 - Bedfast, unable to transfer but is able to turn and position self in bed.",
            "5 - Bedfast, unable to transfer and is unable to turn and position self.",
          ];
          return {
            "index": index,
            "label": options[index],
            "value": options[index],
            "selected": false,
          };
        }),
      },
      {
        'question_type_id': 0480800007,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Ambulation/Locomotion:</b>",
        "description":
            "Current ability to walk safely, once in a standing position, or use a wheelchair, once in a seated position, on a variety of surfaces.",
        "code": "M1860",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "flag": ["*", "O", "\$", "V", "!", "CC"],
        "question_options": List.generate(7, (index) {
          final options = [
            "0 - Able to independently walk on even and uneven surfaces and negotiate stairs with or without railings (specifically: needs no human assistance or assistive device).",
            "1 - With the use of a one-handed device (for example, cane, single crutch, hemi-walker), able to independently walk on even and uneven surfaces and negotiate stairs with or without railings.",
            "2 - Requires use of a two-handed device (for example, walker or crutches) to walk alone on a level surface and/or requires human supervision or assistance to negotiate stairs or steps or uneven surfaces.",
            "3 - Able to walk only with the supervision or assistance of another person at all times.",
            "4 - Chairfast, <u>unable</u> to ambulate but is able to wheel self independently.",
            "5 - Chairfast, unable to ambulate and is <u>unable</u> to wheel self.",
            "6 - Bedfast, unable to ambulate or be up in a chair.",
          ];
          return {
            "index": index,
            "label": options[index],
            "value": options[index],
            "selected": false,
          };
        }),
      },
    ]
  };

  static Map<String,dynamic> functionalAbilitiesAndGoals = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 1,
    "title": "Functional Abilities and Goals",
    "formId": 48,
    "subFormId": 801,
    'questions': [
      {
        'question_type_id': 0480801001,
        "type": "INFO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Self-Care</b>", "question_lookup_enabled":true,
        "description":
            '''<b>Code the patient's usual performance at Follow-Up for each activity using the 6-point scale. If activity was not attempted at Follow-Up, code the reason.
 <br><br>Coding:
 <br><br><br>Safety</b> and <b>Quality of Performance</b> – If helper assistance is required because patient's performance is unsafe or of poor quality, score according to amount of assistance provided.
 <i>Activities may be completed with or without assistive devices.</i>
 <br><br><b>06. Independent</b> – Patient completes the activity by him/herself with no assistance from a helper.
 <br><br><b>05. Setup or clean-up assistance</b> – Helper sets up or cleans up; patient completes activity. Helper assists only prior to or following the activity.
 <br><br><b>04. Supervision or touching assistance</b> – Helper provides verbal cues and/or touching/steadying and/or contact guard assistance as patient completes activity. Assistance may be provided throughout the activity or intermittently.
 <br><br><b>03. Partial/moderate assistance</b> – Helper does LESS THAN HALF the effort. Helper lifts, holds or supports trunk or limbs, but provides less than half the effort.
 <br><br><b>02. Substantial/maximal assistance</b> – Helper does MORE THAN HALF the effort. Helper lifts or holds trunk or limbs and provides more than half the effort.
 <br><br><b>01. Dependent</b> – Helper does ALL of the effort. Patient does none of the effort to complete the activity. Or, the assistance of 2 or more helpers is required for the patient to complete the activity.
 <br><br><b>If activity was not attempted, code reason:</b>
 <br><br><b>07. Patient refused</b>
 <br><br><b>09. Not applicable</b> – Not attempted and the patient did not perform this activity prior to the current illness, exacerbation or injury.
 <br><br><b>10. Not attempted due to environmental limitations</b> (e.g., lack of equipment, weather constraints)
 <br><br><b>88. Not attempted due to medical conditions or safety concerns</b>''',
        "code": "GG0130",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": []
      },
      ...List.generate(3, (index) {
        final titleList = [
          "<b>A. Eating:</b> The ability to use suitable utensils to bring food and/or liquid to the mouth and swallow food and/or liquid once the meal is placed before the patient.",
          "<b>B. Oral Hygiene:</b> The ability to use suitable items to clean teeth. Dentures (if applicable): The ability to insert and remove dentures from and to the mouth, and manage equipment for soaking and rinsing them.",
          "<b>C. Toileting Hygiene:</b> The ability to maintain perineal hygiene, adjust clothes before and after voiding or having a bowel movement. If managing an ostomy, include wiping the opening but not managing  equipment.",
        ];
        return {
          'question_type_id': 0480801001 + (index + 1),
          "type": "STATIC",
          "question_type": "COMPREHENSIVE",
          "title": titleList[index],
          "dynamic_type": false,
          "has_color": true,
          "answer_id": 0,
          "flag": ["P", "V"],
          "questions": List.generate(1, (index) {
            final titleList = [
              "Follow - Up Performance",
            ];
            return {
              "type": 'OPTION',
              'question_id': index + 1,
              "title":
                  "<div style='text-align:center;'><b>${titleList[index]}</b></div>",
              "options": List.generate(11, (index) {
                final options = [
                  "<b>06. Independent</b>",
                  "<b>05. Setup or clean-up assistance</b>",
                  "<b>04. Supervision or touching assistance</b>",
                  "<b>03. Partial/moderate assistance</b>",
                  "<b>02. Substantial/maximal assistance</b>",
                  "<b>01. Dependent</b>",
                  "<b>07. Patient refused</b>",
                  "<b>09. Not applicable</b>",
                  "<b>10. Not attempted due to environmental limitations</b>",
                  "<b>88. Not attempted due to medical conditions or safety concerns</b>",
                  "<b>-   No information</b>",
                ];
                return {
                  "index": index,
                  "value": options[index],
                  "label": options[index],
                  "selected": index == 0 ? true : false
                };
              }),
            };
          }),
        };
      }),
      {
        'question_type_id': 0480801005, //10023011,
        "type": "INFO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Mobility</b>",
        "description":
            '''<b>Code the patient's usual performance at Follow-Up for each activity using the 6-point scale. If activity was not attempted at Follow-Up, code the reason.
 <br><br>Coding:
 <br><br>Safety</b> and <b>Quality of Performance</b> – If helper assistance is required because patient's performance is unsafe or of poor quality, score according to amount of assistance provided.
 <i>Activities may be completed with or without assistive devices.</i>
 <br><br><b>06. Independent</b> – Patient completes the activity by him/herself with no assistance from a helper.
 <br><br><b>05. Setup or clean-up assistance</b> – Helper sets up or cleans up; patient completes activity. Helper assists only prior to or following the activity.
 <br><br><b>04. Supervision or touching assistance</b> – Helper provides verbal cues and/or touching/steadying and/or contact guard assistance as patient completes activity. Assistance may be provided throughout the activity or intermittently.
 <br><br><b>03. Partial/moderate assistance</b> – Helper does LESS THAN HALF the effort. Helper lifts, holds or supports trunk or limbs, but provides less than half the effort.
 <br><br><b>02. Substantial/maximal assistance</b> – Helper does MORE THAN HALF the effort. Helper lifts or holds trunk or limbs and provides more than half the effort.
 <br><br><b>01. Dependent</b> – Helper does ALL of the effort. Patient does none of the effort to complete the activity. Or, the assistance of 2 or more helpers is required for the patient to complete the activity.
 <br><br><b>If activity was not attempted, code reason:</b>
 <br><br><b>07. Patient refused</b>
 <br><br><b>09. Not applicable</b> – Not attempted and the patient did not perform this activity prior to the current illness, exacerbation or injury.
 <br><br><b>10. Not attempted due to environmental limitations</b> (e.g., lack of equipment, weather constraints)
 <br><br><b>88. Not attempted due to medical conditions or safety concerns</b>''',
        "code": "GG0170",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": []
      },
      ...List.generate(11, (index) {
        final titleList = [
          "<b>A. Roll left and right:</b> The ability to roll from lying on back to left and right side, and return to lying on back on the bed.",
          "<b>B. Sit to lying:</b> The ability to move from sitting on side of bed to lying flat on the bed.",
          "<b>C. Lying to sitting on side of bed:</b> The ability to move from lying on the back to sitting on the side of the bed with feet flat on the floor, and with no back support.",
          "<b>D. Sit to stand:</b> The ability to come to a standing position from sitting in a chair, wheelchair, or on the side of the bed.",
          "<b>E. Chair/bed-to-chair transfer:</b> The ability to transfer to and from a bed to a chair (or wheelchair).",
          "<b>F. Toilet transfer:</b>The ability to get on and off a toilet or commode.",
          "<b>I. Walk 10 feet:</b>Once standing, the ability to walk at least 10 feet in a room, corridor, or similar space.",
          "<b>J. Walk 50 feet with two turns:</b> Once standing, the ability to walk 50 feet and make two turns",
          "<b>L. Walking 10 feet on uneven surfaces:</b> The ability to walk 10 feet on uneven or sloping surfaces (indoor or outdoor), such as turf or gravel.",
          "<b>M. 1 step (curb):</b> The ability to go up and down a curb and/or up and down one step. ",
          "<b>N. 4 steps:</b> The ability to go up and down four steps with or without a rail.",
        ];
        final descriptionList = [
          null,
          null,
          null,
          null,
          null,
          null,
          "<i>If SOC/ROC performance is coded 07, 09, 10 or 88 → skip to GG0170M, 1 step (curb)</i>",
          null,
          null,
          "<i>If SOC/ROC Performance is coded 07, 09, 10 or 88 → skip to GG0170P, Mobility, Picking up object.</i>",
          null,
        ];
        return {
          'question_type_id': 0480801005 + (index + 1),
          "type": "STATIC",
          "question_type": "COMPREHENSIVE",
          "title": titleList[index],
          "description": descriptionList[index],
          "dynamic_type": false,
          "has_color": true,
          "answer_id": 0,
          if(![0,6,8,9,10].contains(index))"flag": ["P", "V"],
          "question_grid": 2,
          "questions": List.generate(1, (index) {
            final titleList = [
              "Follow-Up Performance",
            ];
            return {
              "type": 'OPTION',
              'question_id': index + 1,
              "title":
                  "<div style='text-align:center;'><b>${titleList[index]}</b></div>",
              "options": List.generate(11, (index) {
                final options = [
                  "<b>06. Independent</b>",
                  "<b>05. Setup or clean-up assistance</b>",
                  "<b>04. Supervision or touching assistance</b>",
                  "<b>03. Partial/moderate assistance</b>",
                  "<b>02. Substantial/maximal assistance</b>",
                  "<b>01. Dependent</b>",
                  "<b>07. Patient refused</b>",
                  "<b>09. Not applicable</b>",
                  "<b>10. Not attempted due to environmental limitations</b>",
                  "<b>88. Not attempted due to medical conditions or safety concerns</b>",
                  "<b>-   No information</b>",
                ];
                return {
                  "index": index,
                  "value": options[index],
                  "label": options[index],
                  "selected": index == 0 ? true : false
                };
              }),
            };
          }),
        };
      }),
      {
        'question_type_id': 0480801017, //10023027,
        "type": "BUTTON",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Q. Does patient use wheelchair and/or scooter?</b>",
        "dynamic_type": true,
        "options_alignment": "VERTICAL",
        "has_color": false,
        "answer_id": 0,
        "options": [
          {
            "index": 0,
            "label": "<b>0. No</b>",
            "value": "0. No",
            "selected": false,
            "hint": "<i>→  Skip GG0170R, GG0170RR1, GG0170S, and GG0170SS1.</i>"
          },
          {
            "index": 1,
            "label": "<b>1. Yes</b>",
            "value": "1. Yes",
            "selected": false,
            "hint":
                "<i>→  Continue to GG0170R, Wheel 50 feet with two turns.</i>"
          }
        ]
      },
      {
        'question_type_id': 0480801018, //10023028,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>R. Wheel 50 feet with two turns:</b> Once seated in wheelchair/scooter, the ability to wheel at least 50 feet and make two turns.",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "flag": ["P", "V"],
        "questions": [
          ...List.generate(1, (index) {
            final titleList = [
              "Follow-Up Performance",
            ];
            return {
              "type": 'OPTION',
              'question_id': index + 1,
              "title": "<b>${titleList[index]}</b>",
              "options": List.generate(11, (index) {
                final options = [
                  "<b>06. Independent</b>",
                  "<b>05. Setup or clean-up assistance</b>",
                  "<b>04. Supervision or touching assistance</b>",
                  "<b>03. Partial/moderate assistance</b>",
                  "<b>02. Substantial/maximal assistance</b>",
                  "<b>01. Dependent</b>",
                  "<b>07. Patient refused</b>",
                  "<b>09. Not applicable</b>",
                  "<b>10. Not attempted due to environmental limitations</b>",
                  "<b>88. Not attempted due to medical conditions or safety concerns</b>",
                  "<b>-   No information</b>",
                ];
                return {
                  "index": index,
                  "value": options[index],
                  "label": options[index],
                  "selected": index == 0 ? true : false
                };
              }),
            };
          }),
        ]
      },
    ]
  };

  static Map<String,dynamic> fallRiskTherapyNeed = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Fall Risk Assessment",
    "formId": 48,
    "subFormId": 802,
    "questions": [
      {
        'question_type_id': 0480802001, //0010024001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "title": "<b>MAHC 10 - FALL RISK ASSESSMENT</b>",
        "description":
            "<div style='text-align:center;'><b>Required Core Elements <br><br>Assess one point for each core elements \"yes\".</b> <br><i>Information may be gathered from medical record, assessment and if applicable, the patient/caregiver. <br>Beyond protocols listed below, scoring should be based on your clinical judgment</i></div>",
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "questions": [
          {
            "type": '',
            "question_id": 1,
            "group_options": false,
            "options": List.generate(10, (index) {
              final list = <String>[
                '<b>Age 65+</b>',
                '<b>Diagnosis (3 or more co-existing)</b>',
                '<b>Prior history of fall within 3 months</b>',
                '<b>Incontinence</b>',
                '<b>Visual impairment</b>',
                '<b>Impaired functional mobility</b>',
                '<b>Environmental hazards</b>',
                '<b>Poly Pharmacy (4 or more prescriptions - any type)</b>',
                '<b>Pain affectin g level of function</b>',
                '<b>Cognitive impairmen</b>t'
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false
              };
            }),
          },
          {
            "type": '',
            "question_id": 2,
            "options": [
              {
                "index": 0,
                "label": "Total",
                "value": "",
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 0480802002, //0010024003,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": true,
        "title": "<b>Fall History</b>",
        "answer_id": 4,
        'questions': [
          {
            "type": 'RADIO',
            "question_id": 1,
            "options_alignment": "HORIZONTAL",
            "title": 'Most Recent Fall :',
            "options": List.generate(5, (index) {
              final list = [
                "<3 Months",
                "3-6 Months",
                "7-12 Months",
                ">1 Year",
                "No Falls",
              ];
              return {
                "index": index,
                "value": list[index],
                "label": list[index],
                "selected": false,
              };
            })
          },
          {
            "type": 'TEXTFIELD',
            "question_id": 2,
            "title":
                "Describe type of fall and outcome for any falls < 1 year :",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              },
            ]
          },
        ]
      },
    ]
  };

  static Map<String,dynamic> musculoskeletal = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Musculoskeletal",
    "formId": 48,
    "subFormId": 797,
    "questions": [
      {
        "question_type_id": 0480797001,
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
            "options": generateOptions([""], textFieldPopup: [0]),
          }
        ]
      },
      {
        'question_type_id': 0480797002,
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
        'question_type_id': 0480797003,
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
        'question_type_id': 0480797004,
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
            "title":
                '''<b><u style="color:#1696C8;">Dynamic Standing</u></b>''',
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
        'question_type_id': 0480797005,
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

  static Map<String,dynamic> integumentary = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Integumentary",
    "formId": 48,
    "subFormId": 794,
    'questions': [
      {
        'question_type_id': 0480794001, //10019002,
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
        'question_type_id': 0480794002, //10019002,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Wound(s) identified?</b>",
        "dynamic_type": true,
        "options_alignment": "HORIZONTAL",
        "scroll_axis": "HORIZONTAL",
        "answer_id": 0,
        "options": generateOptions(['No', 'Yes']),
      },
      {
        'question_type_id': 0480794003, //10019003,
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
        'question_type_id': 0480794004, //10019006,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "title": "<b>Pressure Injury Risk</b>",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
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
            "question_id": 2,
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
        'question_type_id': 0480794005, //10019002,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Additional Comments: </b>",
        "dynamic_type": true,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "options": generateOptions([""]),
      },
      {
        "question_type_id": 0480794006, //0470760006,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "Does this patient have at least one <b>Unhealed Pressure Ulcer/Injury at Stage 2 or Higher</b> or designated as Unstageable? (Excludes Stage 1 pressure injuries and all healed pressure ulcers/injuries) ",
        "code": "M1306",
        "group_options": true,
        "has_color": true,
        "flag":["!","CC"],
        "dynamic_type": true,
        "options_alignment": "HORIZONTAL",
        "question_options": generateOptions(
          ["0 - No", "1 - Yes"],
        ),
      },
    ]
  };

  static Map<String,dynamic> ulcersSurgicalWounds = {
    "template_name": "OASIS PT RECERT",
    "cols": 2,
    "title": "Ulcers/Surgical Wounds",
    "formId": 3,
    "subFormId": 55,
    'questions': [
      {
        'question_type_id': 0020055001, //10020001,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title":
            "Does this patient have at least one <b>Unhealed Pressure Ulcer/Injury at Stage 2 or Higher</b> or designated as Unstageable? (Excludes Stage 1 pressure injuries and all healed pressure ulcers/injuries)",
        "code": "M1306",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "flag": ["!", "CC"],
        "answer_id": 0,
        "options_alignment": "HORIZONTAL",
        "question_options": [
          {
            "index": 0,
            "label": "0 - No",
            "value": "0 - No",
            "selected": false,
            "hint": "→ Go to M1322",
          },
          {
            "index": 1,
            "label": "1 - Yes",
            "value": "1 - Yes",
            "selected": false,
          }
        ]
      },
      {
        'question_type_id': 0020055002, //10020002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Current Number of Unhealed Pressure Ulcers/Injuries at Each Stage</b>",
        "code": "M1311",
        "dynamic_type": false,
        "has_color": false,
        "flag": ["O", "!", "CC"],
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options": List.generate(6, (index) {
              final titleList = [
                "<b>Stage 2:</b> Partial thickness loss of dermis presenting as a shallow open ulcer with a red or pink wound bed, without slough. May also present as an intact or open/ruptured blister. <br><b>Number of Stage 2 pressure ulcers</b>",
                "<b>Stage 3:</b> Full thickness tissue loss. Subcutaneous fat may be visible but bone, tendon, or muscle is not exposed. Slough may be present but does not obscure the depth of tissue loss. May include undermining and tunneling. <br><b>Number of Stage 3 pressure ulcers</b>",
                "<b>Stage 4:</b>  Full thickness tissue loss with exposed bone, tendon, or muscle. Slough or eschar may be present on some parts of the wound bed. Often includes undermining and tunneling. <br><b>Number of Stage 4 pressure ulcers</b>",
                "<b>Unstageable: Non-removable dressing/device:</b> Known but not stageable due to non-removable dressing/device<br><b>Number of unstageable pressure ulcers/injuries due to non-removable dressing/device</b>",
                "<b>Unstageable: Slough and/or eschar:</b>Known but not stageable due to coverage of wound bed by slough and/or eschar<br><b>Number of unstageable pressure ulcers/injuries due to coverage of wound bed by slough and/or eschar</b>",
                "<b> Unstageable: Deep tissue injury<br>Number of unstageable pressure injuries presenting as deep tissue injury</b>",
              ];
              return {
                "index": index,
                "label": titleList[index],
                "value": "",
              };
            }),
          }
        ]
      },
      {
        'question_type_id': 0020055003, //10020003,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Current Number of Stage 1 Pressure Injuries:</b>",
        "description":
            " Intact skin with non-blanchable redness of a localized area usually over a bony prominence. Darkly pigmented skin may not have a visible blanching; in dark skin tones only it may appear with persistent blue or purple hues.",
        "code": "M1322",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options_alignment": "HORIZONTAL",
        "question_options": List.generate(5, (index) {
          return {
            "index": index,
            "label": index == 4 ? "4 or more" : "$index",
            "value": index == 4 ? "4 or more" : "$index",
            "selected": index == 0 ? true : false,
          };
        })
      },
      {
        'question_type_id': 0020055004, //10020004,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Stage of Most Problematic Unhealed Pressure Ulcer/Injury that is Stageable:</b>",
        "description":
            "(Excludes pressure ulcer/injury that cannot be staged due to a non-removable dressing/device, coverage of wound bed by slough and/or eschar, or deep tissue injury.)",
        "code": "M1324",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "flag": ["!", "CC"],
        "answer_id": 0,
        "question_options": List.generate(5, (index) {
          final labels = [
            "1 - Stage 1",
            "2 - Stage 2",
            "3 - Stage 3",
            "4 - Stage 4",
            "NA - Patient has no pressure ulcers/injuries or no stageable pressure ulcers/injuries",
          ];
          return {
            "index": index,
            "label": labels[index],
            "value": labels[index],
            "selected": index == 0 ? true : false,
          };
        })
      },
      {
        'question_type_id': 0020055005, //10020005,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "Does this patient have a <b>Stasis Ulcer?</b>",
        "code": "M1330",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "question_options": List.generate(4, (index) {
          final labels = [
            "0 - No",
            "1 - Yes, patient has BOTH observable and unobservable stasis ulcers",
            "2 - Yes, patient has observable stasis ulcers ONLY",
            "3 - Yes, patient has unobservable stasis ulcers ONLY (known but not observable due to non-removable dressing/device)",
          ];
          final hints = [
            "→Go to M1340",
            " ",
            " ",
            "→Go to M1340",
          ];
          return {
            "index": index,
            "label": labels[index],
            "value": labels[index],
            "selected": index == 0 ? true : false,
            "hint": hints[index],
          };
        })
      },
      {
        'question_type_id': 0020055006, //10020006,
        "type": "BUTTON",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Current Number of Stasis Ulcer(s) that are Observable:</b>",
        "code": "M1332",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options_alignment": "HORIZONTAL",
        "question_options": List.generate(4, (index) {
          final labels = [
            "1 - One",
            "2 - Two",
            "3 - Three",
            "4 - Four or more",
          ];
          return {
            "index": index,
            "label": labels[index],
            "value": labels[index],
            "selected": index == 0 ? true : false,
          };
        })
      },
      {
        'question_type_id': 0020055007, //10020007,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Status of Most Problematic Stasis Ulcer that is Observable:</b>",
        "code": "M1334",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "flag": ["!", "CC"],
        "question_options": List.generate(3, (index) {
          final labels = [
            "1 - Fully granulating",
            "2 - Early/partial granulation",
            "3 - Not healing",
          ];
          return {
            "index": index,
            "label": labels[index],
            "value": labels[index],
            "selected": index == 0 ? true : false,
          };
        })
      },
      {
        'question_type_id': 0020055008, //10020008,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "Does this patient have a <b>Surgical Wound?</b>",
        "code": "M1340",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "question_options": List.generate(3, (index) {
          final labels = [
            "0 - No",
            "1 - Yes, patient has at least one observable surgical wound",
            "2 - Surgical wound known but not observable due to non removable dressing/device ",
          ];
          final hints = [
            "→ Skip M1342",
            " ",
            "→ Skip M1342",
          ];
          return {
            "index": index,
            "label": labels[index],
            "value": labels[index],
            "selected": index == 0 ? true : false,
            "hint": hints[index],
          };
        })
      },
      {
        'question_type_id': 0020055009, //10020009,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Status of Most Problematic Surgical Wound that is Observable</b>",
        "code": "M1342",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "flag": ["!", "CC"],
        "question_options": List.generate(4, (index) {
          final labels = [
            "0 - Newly epithelialized",
            "1 - Fully granulating",
            "2 - Early/partial granulation",
            "3 - Not healing",
          ];
          return {
            "index": index,
            "label": labels[index],
            "value": labels[index],
            "selected": false,
          };
        })
      },
    ]
  };

  static Map<String,dynamic> priorLevelOfFunction = {
    "template_name": "OASIS PT START OF CARE",
    "template_code": "",
    "cols": 2,
    "title": "Prior Level of Function",
    "formId": 2,
    "subFormId": 56,
    'questions': [
      {
        'question_type_id': 0020056001,
        "type": "TEXTAREA",
        "title": "<b>PRIOR LEVEL OF FUNCTION</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 002,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String,dynamic> medications = {
    "template_name": "OASIS PT Recert",
    "template-code": "",
    "cols": 2,
    "title": "Medications",
    "formId": 48,
    "subFormId": 803,
    'questions': [
      {
        'question_type_id': 0480803001,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "title": "<b>Medication Management</b>",
        "description": "Any medication changes since last visit?",
        "has_color": true,
        "answer_id": 0,
        "question_options": generateOptions(
          ["No", "Yes (Explain)"],
          textFieldPopup: [1],
        )
      },
      {
        'question_type_id': 0480803002,
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
                "label": "Medications",
              }
            ]
          }
        ],
      },
    ]
  };

  static Map<String,dynamic> specialTreatmentProceduresAndPrograms = {
    "template_name":
        "OASIS PT Start Of Care Special Treatment, Procedures, And Programs",
    "cols": 1,
    "title": "Special Treatment, Procedures, And Programs",
    "formId": 2,
    "subFormId": 64,
    'questions': [
      {
        'question_type_id': 0020064001, //0010027001,
        "type": "STATIC",
        "code": "O0110",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "scroll_axis": "HORIZONTAL",
        "title":
            "<b>Special Treatments, Procedures, and Programs<br>Check all of the following treatments, procedures and programs that apply on admission</b>",
        "questions": List.generate(31, (index) {
          List titles = [
            "<b>A1. Chemotherapy</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ A2. IV</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ A3. Oral</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ A1O. Other</b>",
            "<b>B1. Radiation</b>",
            "<b>C1. Oxygen Therapy</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ C2. Continuous</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ C3. Intermittent</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ C4. High-concentration</b>",
            "<b>D1. Suctioning</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ D2. Scheduled</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ D3. As Needed</b>",
            "<b>E1. Tracheostomy care</b>",
            "<b>F1. Invasive Mechanical Ventilator (ventilator or respirator)</b>",
            "<b>G1. Non-invasive Mechanical Ventilator</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ G2. BiPAP</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ G3. CPAP</b>",
            "<b>H1. IV Medications</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ H2. Vasoactive medications</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ H3. Antibiotics</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ H4. Anticoagulation</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ H1O. other</b>",
            "<b>I1. Transfusions</b>",
            "<b>J1. Dialysis</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ J2. Hemodialysis</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ J3. Peritoneal dialysis</b>",
            "<b>O1. IV Access</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ O2. Peripheral</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ O3. Mid-line</b>",
            "<b>‎ ‎ ‎ ‎ ‎ ‎ O4. Central (e.g., PICC, tunneled, port)</b>",
            "<b>Z1. None Of the Above</b>",
          ];
          return {
            "question_id": index + 1,
            "type": "DROPDOWN",
            "scroll_axis": "HORIZONTAL",
            "title": titles[index],
            "options": generateOptions([
              " 0 - No",
              " 1 - Yes",
              " - - Not Assessed/No Information",
            ]),
          };
        }),
      },
    ]
  };
  static Map<String,dynamic> rehospitalizationRisk = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Rehospitalization Risk",
    "formId": 48,
    "subFormId": 805,
    'questions': [
      {
        'question_type_id': 0480805001, //0010028001,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "title":
            "<b> Risk Assessment for Rehospitalization/Emergency Room Visit</b>",
        "questions": [
          {
            "question_id": 1,
            "title": "<b>Patient:</b>",
            "type": "CHECKBOX",
            "options": generateOptions([
              "Has had a hospital admission or emergency room visit in the last 6 months",
              "Has primary diagnosis of Stroke, Heart Failure, CHF, COPD, Cardiac, Diabetes",
              "Needs assistance with ADL's",
              "Has IO or more medications",
              "Needs assistance with taking medications",
              "Needs assistance with respiratory treatments",
              "Has confusion or problems remembering or organizing",
              "Has learning barrier",
              "Lives alone",
              "Had a fall in the last year",
              "Has a skin ulcer",
            ], selectedIndexes: [
              1,
              2,
              3
            ]),
          },
          {
            "question_id": 2,
            "title": "<b>Score</b>",
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(['']),
          },
          {
            "question_id": 3,
            "title":
                "5 or more checked boxes = high risk (select appropriate interventions/goals to reduce risk of hospitalization or emergency department visit).",
            "type": "INFO",
          },
        ]
      },
      {
        'question_type_id': 0480805002, //0010028002,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "title": "<b>Risk for Hospitalization:</b>",
        "code": "M1033",
        "description":
            "Which of the following signs or symptoms characterize this patient as at risk for hospitalization? <b>(Mark all that apply.)</b>",
        "answer_id": 0,
        "has_color": true,
        "flag": ["\$"],
        "question_options": generateOptions([
          "1 - History of falls (2 or more falls - or any fall with an injury - in the past 12 months)",
          "2 - Unintentional weight loss of a total of 10 pounds or more in the past 12 months",
          "3 - Multiple hospitalizations (2 or more) in the past 6 months",
          "4 - Multiple emergency department visits (2 or more) in the past 6 months",
          "5 - Decline in mental, emotional, or behavioral status in the past 3 months",
          "6 - Reported or observed history of difficulty complying with any medical instructions (for example, medications, diet, exercise) in the past 3 months",
          "7 - Currently taking 5 or more medications",
          "8 - Currently reports exhaustion",
          "9 - Other risk(s) not listed in 1-8",
          "1O - None of the above",
        ], selectedIndexes: [
          1,
          4,
          7
        ], textFieldPopup: [
          8
        ]),
      },
    ]
  };

  static Map<String,dynamic> objective = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": " Objective",
    "formId": 48,
    "subFormId": 806,
    'questions': [
      {
        "question_type_id": 0480806001, //571063002,
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
        'question_type_id': 0480806002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "notice": "Exercise Flowsheet",
        "answer_id": 0,
        "draw_box":false,
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
    ]
  };

  static Map<String,dynamic> assessmentSummary = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Assessment",
    "formId": 48,
    "subFormId": 807,
    'questions': [
      {
        'question_type_id': 0480807002, //0010030002,
        "type": "TEXTAREA",
        "title": "<b>Assessment</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 0480807003, //0010030003,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String,dynamic> planOfCare = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Plan Of Care",
    "formId": 48,
    "subFormId": 808,
    'questions': [
      {
        'question_type_id': 0480808001, //0010032001,
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
        'question_type_id': 0480808002, //0010032002,
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
        'question_type_id': 0480808003, //0010032003,
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
        'question_type_id': 0480808004, //0010032004,
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
        'question_type_id': 0480808005, //0010032005,
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
        'question_type_id': 0480808006, //0010032006,
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
        'question_type_id': 0480808007, //0010032007,
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
        'question_type_id': 0480808008,
        "type": "STATIC",
        "title": "<b>Frequency/Duration</b>",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [],
      },
    ]
  };

  static Map<String,dynamic> carePlanningCoordination = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 2,
    "title": "Care Planning/Coordination",
    "formId": 48,
    "subFormId": 809,
    'questions': [
      {
        'question_type_id': 0480809001, //0010033001,
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
        'question_type_id': 0480809002, //0010033002,
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
        'question_type_id': 0480809003, //0010033003,
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
        'question_type_id': 0480809004, //0010033004,
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
        'question_type_id': 0480809005, //0010033005,
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
        'question_type_id': 0480809006, //0010033006,
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

  static Map<String,dynamic> diagnosisCodes = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 1,
    "title": "Diagnosis Codes",
    "formId": 48,
    "subFormId": 810,
    'questions': [
      {
        'question_type_id': 0480810001, //0010034001,
        "type": "INFO",
        "code": "M1021/M1023",
        "question_type": "COMPREHENSIVE",
        "title":
            "Diagnoses and Symptom Control: List each diagnosis for which the patient is receiving home care in Column 1, and enter its ICD-10-CM code at the level of highest specificity in Column 2 (diagnosis codes only - no surgical or procedure codes allowed). Diagnoses are listed in the order that best reflects the seriousness of each condition and supports the disciplines and services provided. Rate the degree of symptom control for each condition in Column 2. ICD-10-CM sequencing requirements must be followed if multiple coding is indicated for any diagnoses.",
        "description":
            "<b>Code each row according to the following directions for each column:</b> <br><br>  Column 1:  Enter the description of the diagnosis. Sequencing of diagnoses should reflect the seriousness of each condition and support the disciplines and services provided. <br><br>Column 2:  Enter the ICD-10-CM code for the condition described in Column 1 - no surgical or procedure codes allowed. Codes must be entered at the level of highest specificity and ICD-10-CM coding rules and sequencing requirements must be followed. Note that external cause codes (ICD-10-CM codes beginning with V, W, X, or Y) may not be reported in M1021 (Primary Diagnosis) but may be reported in M1023 (Secondary Diagnoses). Also note that when a Z-code is reported in Column 2, the code for the underlying condition can often be entered in Column 2, as long as it is an active on-going condition impacting home health care. <br><br>Rate the degree of symptom control for the condition listed in Column 1. Do not assign a symptom control rating if the diagnosis code is a V, W, X, Y or Z-code. Choose one value that represents the degree of symptom control appropriate for each diagnosis using the following scale: <br><br>0 - Asymptomatic, no treatment needed at this time <br><br>1 - Symptoms well controlled with current therapy <br><br>2 - Symptoms controlled with difficulty, affecting daily functioning; patient needs ongoing monitoring <br><br>3 - Symptoms poorly controlled; patient needs frequent adjustment in treatment and dose monitoring <br><br>4 - Symptoms poorly controlled; history of re-hospitalizations <br><br>Note that the rating for symptom control in Column 2 should not be used to determine the sequencing of the diagnoses listed in Column 1. These are separate items and sequencing may not coincide.",
        "dynamic_type": true,
        "answer_id": 0,
        "flag": ["\$"],
      },
      {
        'question_type_id': 0480810002, //0010034002,
        "type": "STATIC",
        "code": "Update Diagnosis",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": List.generate(
          6,
          (index) {
            return {
              "question_id": index + 1,
              "type": "RADIO",
              "options_alignment": "HORIZONTAL",
              "options": generateOptions(
                [
                  "0",
                  "1",
                  "2",
                  "3",
                  "4",
                ],
              ),
            };
          },
        ),
      },
    ]
  };

  static Map<String,dynamic> functionalAssessment = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 1,
    "title": "Functional Assessment",
    "formId": 48,
    "subFormId": 798,
    'questions': [
      {
        "question_type_id": 0480798001,
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
        "question_type_id": 0480798002,
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
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              [''],
            ),
          }
        ]
      },
      {
        "question_type_id": 0480798003,
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
        "question_type_id": 0480798004,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Gait analysis/abnormality of gait description</b>",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
      {
        "question_type_id": 0480798005,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Environmental / safety findings that might impact plan of care</b>",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(["None", "Describe Findings"])
      }
    ]
  };

  static Map<String,dynamic> testsScales = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 1,
    "title": "Tests/Scales",
    "formId": 48,
    "subFormId": 799,
    'questions': [
      {
        "question_type_id": 0480799001,
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

  static Map<String,dynamic> supervision = {
    "template_name": "OASIS PT Recert",
    "template_code": "",
    "cols": 1,
    "title": "Supervision",
    "formId": 48,
    "subFormId": 1142,
    'questions': [
      {
        "question_type_id": 0481142001, //571065001,
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
        "question_type_id": 0481142002, //571065002,
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
