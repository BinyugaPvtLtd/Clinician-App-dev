import '../generate_options.dart';

class FormDataSTRocRecert {
  static Map<int, Map<String,dynamic>> stRocRecertDrawerItems = {
    2: administrativeInfoForm,
    3: clinicalRecordItems,
    4: patientHistory,
    5: livingArrangements,
    6: assistance,
    7: safetyHazardEmergencyPlan,
    41: subjective,
    9: pain,
    8: vitalSignsHeight,
    10: hearingSpeechVision,
    11: bims,
    12: neurologicalCognitive,
    13: mood,
    14: behaviorRiskFactor,
    15: respiratory,
    16: cardioVascular,
    17: genitourinary,
    18: gastrointestinalNutritionEndocrine,
    19: integumentaryWoundCare,
    20: ulcersSurgicalWounds,
    21: musculoskeletal,
    42: functionalAssessment,
    22: functionalStatus,
    23: functionalAbilitiesAndGoals,
    24: fallRiskTherapyNeed,
    25: medications,
    27: specialTreatmentProceduresAndPrograms,
    28: rehospitalizationRisk,
    45: objective,
    30: assessment,
    32: planOfCare,
    33: carePlanningCoordination,
    34: diagnosisCodes,
  };

  static Map<String,dynamic> administrativeInfoForm = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Administrative Information",
    "formId": 13,
    "subFormId": 386,
    "questions": [
      {
        'question_type_id': 130386001,
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
        "type": 'UPLOAD',
        "question_type_id": 130386002,
        "title": "Patient Signature",
        "code": '',
        "question_type": "NON-COMPREHENSIVE",
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
        "question_type_id": 130386003,
        "title": "<b>Ethnicity</b>",
        "code": 'A1005',
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "description":
            "Are you of Hispanic, Latino/a, or Spanish origin?    <b>( Check all that apply )</b>",
        "options": [
          ...List.generate(
            7,
            (index) {
              var list = [
                'A. <b>No, not of Hispanic, Latino/a, or Spanish origin</b>',
                'B. <b>Yes, Mexican, Mexican American, Chicano/a</b>',
                'C. <b>Yes, Puerto Rican</b>',
                'D. <b>Yes, Cuban</b>',
                'E. <b>Yes, another Hispanic, Latino, or Spanish origin</b>',
                'X. <b>Patient unable to respond</b>',
                'Y. <b>Patient declines to respond</b>',
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
        "question_type_id": 130386004,
        "title": "<b>Race</b>",
        "code": 'A1010',
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "description": "What is your race?    <b>( Check all that apply )</b>",
        "options": [
          ...List.generate(
            17,
            (index) {
              var list = [
                'A. <b>White</b>',
                'B. <b>Black or African American</b>',
                'C. <b>American Indian or Alaska Native</b>',
                'D. <b>Asian Indian</b>',
                'E. <b>Chinese</b>',
                'F. <b>Filipino</b>',
                'G. <b>Japanese</b>',
                'H. <b>Korean</b>',
                'I. <b>Vietnamese</b>',
                'J. <b>Other Asian</b>',
                'K. <b>Native Hawaiian</b>',
                'L. <b>Guamanian or Chamorro</b>',
                'M. <b>Samoan</b>',
                'N. <b>Other Pacific Islander</b>',
                'X. <b>Patient unable to respond</b>',
                'Y. <b>Patient declines to respond</b>',
                'Z. <b>None of the above</b>',
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
        "question_type_id": 130386005,
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
        "question_type_id": 130386006,
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
        "description": "<b><u>Start/Resumption of Care:</u></b>",
        "options": [
          ...List.generate(
            2,
            (index) {
              var list = [
                '1 - Start of care-further visits planned',
                '3 - Resumption of care (after inpatient stay)',
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
        "question_type_id": 130386007,
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
    ]
  };
  static Map<String,dynamic> clinicalRecordItems = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Clinical Record Items",
    "formId": 13,
    "subFormId": 387,
    "questions": [
      {
        'question_type_id': 130387001,
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
        'question_type_id': 130387002,
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
        'question_type_id': 130387003,
        "type": "CHECKBOX",
        "code": 'A1250',
        "question_type": "COMPREHENSIVE",
        "title": "<b>Transportation (NACHC ©)</b>",
        "description":
            '''Has lack of transportation kept you from medical appointments, meetings, work, or from getting
        things needed for daily living?
        <b>( Check all that apply )</b>''',
        "options_alignment": "VERTICAL",
        "group_options": false,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "question_options": List.generate(5, (index) {
          var list = [
            'A. Yes, it has kept me from medical appointments or from getting my medications',
            'B. Yes, it has kept me from non-medical meetings, appointments, work, or from getting things that I need',
            'C. No',
            'X. Patient unable to respond',
            'Y. Patient declines to respond',
          ];
          return {
            "index": index,
            "label": list[index],
            "value": list[index],
            "selected": false
          };
        }),
        "notice":
            "<i>Adapted from: NACHC© 2019. National Association of Community Health Centers, Inc., Association Of Asian Pacific Community Health Organizations, Oregon Primary Care Association. PRAPARE and its resources are proprietary information of NACHC and its partners, intended for use by NACHC, its partners, and authorized recipients. Do not publish, copy, or distribute this information in part or whole without written consent from NACHC.</i>"
      },
      {
        'question_type_id': 130387004,
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
        'question_type_id': 130387005,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "Patient aware of Advance Directives:",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          {"index": 0, "label": "Yes", "value": "Yes", "selected": false},
          {"index": 1, "label": "No", "value": "No", "selected": false},
          {
            "index": 2,
            "label": "NA, no advance directives",
            "value": "NA, no advance directives",
            "selected": false
          },
        ]
      },
      {
        'question_type_id': 130387006,
        "type": "DATE",
        "question_type": "NON-COMPREHENSIVE",
        "code": "M0090",
        "title": "<b>Date Assessment Completed:</b>",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "scroll_axis": "HORIZONTAL",
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "value": "",
            "label": "",
          }
        ]
      },
      {
        'question_type_id': 130387007,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Date of Physician-ordered Start of Care (Resumption of Care):</b> If the physician indicated a specific start of care (resumption of care) date when the patient was referred for home health services, record the date specified.",
        "code": "M0102",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "flag": ['*', 'P', 'CC'],
        "questions": [
          {
            "type": 'DATE',
            "question_id": 1,
            "title": "",
            "options_alignment": "VERTICAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
              },
            ]
          },
          {
            "type": 'OPTION',
            "question_id": 2,
            "title": "",
            "options_alignment": "VERTICAL",
            "options": [
              {
                "index": 0,
                "label": "NA - No specific SOC date ordered by physician",
                "value": "NA - No specific SOC date ordered by physician",
                "selected": false
              },
            ]
          },
        ]
      },
      {
        'question_type_id': 130387008,
        "type": "DATE",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Date Of Referral:</b> Indicate the date that the written or verbal referral for initiation or resumption of care was received by the HHA",
        "code": "M0104",
        "description": "",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "flag": ['*', 'P', 'CC'],
        "question_options": [
          {
            "index": 0,
            "value": "",
            "label": "",
          },
        ]
      },
      {
        'question_type_id': 130387009,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Episode Timing:</b> Is the Medicare home health payment episode for which this assessment will define a case mix group an \"early\" episode or a \"later\" episode in the patient's current sequence of adjacent Medicare home health payment episodes?",
        "code": "M0110",
        "description": "",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "value": "1 - Early",
            "label": "1 - Early",
            "selected": false,
          },
          {
            "index": 1,
            "value": " 2 - Later",
            "label": " 2 - Later",
            "selected": false,
          },
          {
            "index": 2,
            "value": " UK - Unknown",
            "label": " UK - Unknown",
            "selected": false,
          },
          {
            "index": 3,
            "value":
                "NA  -  Not Applicable: No Medicare case mix group to be defined by this assessment.",
            "label":
                "NA  -  Not Applicable: No Medicare case mix group to be defined by this assessment.",
            "selected": false,
          },
        ]
      },
      {
        'question_type_id': 130387010,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Language</b>",
        "code": "A1110",
        "description": "",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "type": 'TEXTFIELD',
            "question_id": 1,
            "title": "A. <b>What is your preferred language?<b>",
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
            "type": 'OPTION',
            "question_id": 2,
            "title":
                "B.  <b>Do you need or want an interpreter to communicate with a doctor or health care staff?</b>",
            "options": [
              {
                "index": 0,
                "label": "0. No",
                "value": "0. No",
                "selected": false
              },
              {
                "index": 1,
                "label": "1. Yes",
                "value": "1. Yes",
                "selected": false
              },
              {
                "index": 2,
                "label": "9. Unable to determine",
                "value": "9. Unable to determine",
                "selected": false
              },
            ]
          },
        ]
      },
      {
        'question_type_id': 130387011,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "",
        "description":
            "Professional Interpreter offered, Patient/Caregiver/Representative (if any):",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": "Accepted <i>(interpreter service details)</i>",
            "value": "Accepted (interpreter service details)",
            "selected": false,
            "popup_code":"TEXTFIELDPOPUP"
          },
          {
            "index": 1,
            "label": "Declined, will use own interpreter <i>(specify)</i>",
            "value": "Declined, will use own interpreter (specify)",
            "selected": false,
            "popup_code":"TEXTFIELDPOPUP"
          },
          {
            "index": 2,
            "label": "Declined <i>(Specify)</i>",
            "value": "Declined (Specify)",
            "selected": false,
            "popup_code":"TEXTFIELDPOPUP"
          }
        ]
      },
    ]
  };

  static Map<String,dynamic> patientHistory = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 1,
    "title": "Patient History / Immunizations",
    "formId": 13,
    "subFormId": 388,
    "questions": [
      {
        "question_type_id": 130388001,
        "code": 'M1000',
        "title":
            'From which of the following <b>Inpatient Facilities</b> was the patient discharged within the past 14 days? <b>(Mark all that apply.)</b>',
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "description": "",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "question_options": List.generate(8, (index) {
          var list = [
            '1 - Long-term nursing facility (NF)',
            '2 - Skilled nursing facility (SNF/TCU)',
            '3 - Short-stay acute hospital (IPPS)',
            '4 - Long-term care hospital (LTCH)',
            '5 - Inpatient rehabilitation hospital or unit (IRF)',
            '6 - Psychiatric hospital or unit',
            '7 - Other (specify)',
            'NA - Patient was not discharged from an inpatient facility',
          ];
          return {
            "index": index,
            "label": list[index],
            "value": list[index],
            "selected": false,
            if (index == 7)
              "hint":
                  "<i>→Skip M1005 and other inpatient hospital questions</i>",
            if (index == 6) "popup_code": "TEXTFIELDPOPUP"
          };
        })
      },
      {
        'question_type_id': 130388002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Inpatient Discharge Date </b>(most recent):",
        "code": "M1005",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "type": 'DATE',
            "question_id": 1,
            "title": "",
            "options_alignment": "VERTICAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
              },
            ]
          },
          {
            "type": 'OPTION',
            "question_id": 2,
            "title": "",
            // "options_alignment": "VERTICAL",
            "options": [
              {
                "index": 0,
                "label": "UK - Unknown or Not Available",
                "value": "UK - Unknown or Not Available",
                "selected": false
              },
            ]
          },
        ]
      },
      {
        'question_type_id': 130388003,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Date of last physician contact/appointment and reason:</b>",
        "code": "",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": false,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "type": 'DATE',
            "question_id": 1,
            "title": "",
            "options_alignment": "VERTICAL",
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
            "title": "",
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
        'question_type_id': 130388004,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Immunizations</b>",
        "description": "Any changes in immunizations?",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          ...List.generate(
            2,
            (index) {
              var list = ['No', 'Yes (Explain)'];
              return {
                "index": 0,
                "label": list[index],
                "value": list[index],
                "selected": false,
                if (index == 1) "popup_code": "TEXTFIELDPOPUP"
              };
            },
          )
        ]
      },
      {
        'question_type_id': 130388005,
        "type": "TEXTAREA",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Pertinent medical history and reason for home care/additional diagnosis information: </b>",
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
        'question_type_id': 130388006,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Active Diagnoses - Comorbidities and Co-existing Conditions - Check all that apply</b>",
        "code": "M1028",
        "description": "",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "value":
                "1 - Peripheral Vascular Disease (PVD) or Peripheral Arterial Disease (PAD)",
            "label":
                "1 - Peripheral Vascular Disease (PVD) or Peripheral Arterial Disease (PAD)",
            "selected": false,
          },
          {
            "index": 1,
            "value": "2 - Diabetes Mellitus (DM)",
            "label": "2 - Diabetes Mellitus (DM)",
            "selected": false,
          },
          {
            "index": 2,
            "value": "3 - None of the above",
            "label": "3 - None of the above",
            "selected": false,
          },
        ]
      },
    ]
  };

  static Map<String,dynamic> livingArrangements = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Living Arrangements",
    "formId": 13,
    "subFormId": 389,
    "questions": [
      {
        'question_type_id': 130389001,
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
        'question_type_id': 130389002,
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
        'question_type_id': 130389003,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Living Situation</b>",
        "description": "Any changes in living situation?",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": List.generate(2, (index) {
          final list = ["No", "yes (Explain)"];
          return {
            "index": index,
            "label": list[index],
            "value": list[index],
            "selected": false,
            if (index == 1) "popup_code": "TEXTFIELDPOPUP"
          };
        })
      },
      {
        'question_type_id': 130389004,
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
        'question_type_id': 130389005,
        "type": "MIX",
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
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Assistance",
    "formId": 13,
    "subFormId": 390,
    "questions": [
      {
        'question_type_id': 130390001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Types and Sources of Assistance:</b> Determine the ability and willingness of non-agency caregivers (such as family members, friends, or privately paid caregivers) to provide assistance for the following activities, if assistance is needed. Excludes all care by your agency staff. ",
        "code": "M2102",
        "description": "",
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
                "label": (index>=2?index+1:index).toString(),
                "value": index.toString(),
                "selected": false
              };
            })
          },
        ]
      },
      {
        'question_type_id': 130390002,
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
        'question_type_id': 130390003,
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
        'question_type_id': 130390004,
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
        'question_type_id': 130390005,
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
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Safety Hazards/Emergency Plan",
    "formId": 13,
    "subFormId": 391,
    "questions": [
      {
        'question_type_id': 130391001,
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
        'question_type_id': 130391002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": false,
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
      {
        'question_type_id': 130391003,
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
        'question_type_id': 130391004,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Triage / Risk Code:</b>",
        "code": "",
        "description": "",
        "scroll_axis": "VERTICAL",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          {
            "index": 0,
            "label":
                '<b>Level 1.  Home visit with in 24 hours; High priority;</b> Require uninterrupted services; Condition unstable, may deteriorate or require inpatient admission if not seen',
            "value":
                '<b>Level 1.  Home visit with in 24 hours; High priority;</b> Require uninterrupted services; Condition unstable, may deteriorate or require inpatient admission if not seen',
            "selected": false
          },
          {
            "index": 1,
            "label":
                '<b>Level 2.  Home visit within 48-72 hours; Moderate priority;</b> Caregiver available to provide basic care; May postpone visit if telephone contact made; Condition somewhat unstable, but could be postponed without harm to patient',
            "value":
                '<b>Level 2.  Home visit within 48-72 hours; Moderate priority;</b> Caregiver available to provide basic care; May postpone visit if telephone contact made; Condition somewhat unstable, but could be postponed without harm to patient',
            "selected": false
          },
          {
            "index": 2,
            "label":
                '<b>Level 3.  Home visit can be deferred longer than 72 hours; low priority;</b> Condition stable with access to informal resources for help; can safely miss a scheduled visit with basic care provided by family or informal support',
            "value":
                '<b>Level 3.  Home visit can be deferred longer than 72 hours; low priority;</b> Condition stable with access to informal resources for help; can safely miss a scheduled visit with basic care provided by family or informal support',
            "selected": false
          },
        ]
      },
      {
        'question_type_id': 130391005,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Emergency/Disaster Code:</b>",
        "code": "",
        "description": "",
        "scroll_axis": "VERTICAL",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "type": 'RADIO',
            'question_id': 1,
            "options_alignment": "HORIZONTAL",
            // "title": list[index],
            // "scroll_axis": 'HORIZONTAL',
            "title": '',
            "value": '',
            "selected": false,
            "options": [
              ...List.generate(
                3,
                (index) {
                  var list = [
                    '<b>CODE 1.</b> Unable to evacuate self-due to <b>( Mark all that apply )</b>',
                    '<b>CODE 2.</b>  Family/ Caregivers able to assist with evacuation',
                    '<b>CODE 3.</b>  Able to evacuate self'
                  ];
                  return {
                    "index": index,
                    "label": list[index],
                    "value": list[index],
                    "selected": false
                  };
                },
              ),
            ]
          },
          {
            "type": 'CHECKBOX',
            'question_id': 1,
            "options_alignment": "VERTICAL",
            // "title": list[index],
            // "scroll_axis": 'HORIZONTAL',
            "title": '',
            "value": '',
            "options": List.generate(
              4,
              (index) {
                var list = [
                  'Limited Mobility',
                  'Mental Limitation',
                  'Financial  Limitations',
                  'Refuses to Evacuate'
                ];
                return {
                  "index": index,
                  "label": list[index],
                  "selected": false
                };
              },
            )
          },
        ]
      },
    ]
  };
  static Map<String,dynamic> subjective = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Subjective",
    "formId": 13,
    "subFormId": 392,
    "questions": [
      {
        'question_type_id': 130392001,
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
        'question_type_id': 130392002,
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

  static Map<String,dynamic> vitalSignsHeight = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Vital Signs,Height & Weight",
    "formId": 13,
    "subFormId": 393,
    'questions': [
      {
        'question_type_id': 130393001,
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
        'question_type_id': 130393002,
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
        'question_type_id': 130393003,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Height and Weight - While measuring, if the number is X.1- X.4 round down; X.5 or greater round up</b>",
        "code": "M1060",
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
            "type": 'TEXTFIELD',
            'question_id': 2,
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
        ]
      },
      {
        'question_type_id': 130393004,
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
  static Map<String,dynamic> pain = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Pain",
    "formId": 13,
    "subFormId": 394,
    "questions": [
      {
        'question_type_id': 130394001,
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
        'question_type_id': 130394002,
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
        'question_type_id': 130394003,
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
        'question_type_id': 130394004,
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
        'question_type_id': 130394005,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Pain Effect on Sleep</b>",
        "code": "J0510",
        "description":
            '''Ask patient: <i>"Over the past 5 days, <b>how much of the time has pain made it hard for you to sleep at night"</i></b>''',
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
                '0. <b>Does not apply - I have not had any pain or hurting in the past 5 days</b>',
                '1. <b>Rarely or not at all</b>',
                '2. <b>Occasionally</b>',
                '3. <b>Frequently</b>',
                '4. <b>Almost constantly</b>',
                '8. <b>Unable to answer</b>',
              ];
              return {
                "index": index,
                "value": list[index],
                "label": list[index],
                "selected": false,
                if (index == 0) "hint": '→ Skip J0520 & J0530'
              };
            },
          )
        ]
      },
      {
        'question_type_id': 130394006,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Pain Interference with Therapy Activities</b>",
        "code": "J0520",
        "description":
            '''Ask patient: <i>"Over the past 5 days, <b>how often have you limited your participation in rehabilitation therapy sessions due to pain?"</i></b>''',
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
                '0. <b>Does not apply - I have not had any pain or hurting in the past 5 days</b>',
                '1. <b>Rarely or not at all</b>',
                '2. <b>Occasionally</b>',
                '3. <b>Frequently</b>',
                '4. <b>Almost constantly</b>',
                '8. <b>Unable to answer</b>',
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
        'question_type_id': 130394007,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Pain interference with day-to-day activities</b>",
        "code": "J0530",
        "description":
            '''Ask patient: <i>"Over the past 5 days, <b>how often you have limited your day-to-day activities(excluding rehabilitation therapy sessions) because of pain?"</i></b>''',
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
                '<b>1. Rarely or not at all</b>',
                '<b>2. Occasionally</b>',
                '<b>3. Frequently</b>',
                '<b>4. Almost constantly</b>',
                '<b>8. Unable to answer</b>',
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
        'question_type_id': 130394008,
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
        'question_type_id': 130394009,
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
        'question_type_id': 130394010,
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
        'question_type_id': 130394011,
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
        'question_type_id': 130394012,
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
        'question_type_id': 130394013,
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
        'question_type_id': 130394014,
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

  static Map<String,dynamic> hearingSpeechVision = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Hearing/Speech/Vision",
    "formId": 13,
    "subFormId": 395,
    "questions": [
      {
        'question_type_id': 130395001,
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
        'question_type_id': 130395002,
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
        'question_type_id': 130395003,
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
        'question_type_id': 130395004,
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
        'question_type_id': 130395005,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Vision</b>",
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
        'question_type_id': 130395006,
        "type": "STATIC",
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
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 1,
    "title": "BIMS",
    "formId": 13,
    "subFormId": 396,
    "questions": [
      {
        'question_type_id': 130396001,
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
                    if (index == 0)
                      "hint": '→Skip BIMS - C0200, C0300, C0400, & C0500 '
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
        'question_type_id': 130396002,
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
        'question_type_id': 130396003,
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
                'Ask patient: <i>“I am going to say three words for you to remember. Please repeat the words after I have said all three. The words are: <b>sock, blue, and bed.</b> Now tell me the three words."</i>',
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
                '''After the patient's first attempt, repeat the words using cues (“sock, something to wear; blue, a color; bed, a piece of furniture”). You may repeat the words up to two more times.''',
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
        'question_type_id': 130396004,
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
        'question_type_id': 130396005,
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
        'question_type_id': 130396006,
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
        'question_type_id': 130396007,
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
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Neurological/Cognitive",
    "formId": 13,
    "subFormId": 397,
    "questions": [
      {
        'question_type_id': 130397001,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Signs and Symptoms of Delirium (from CAM©)</b>",
        "code": "C1310",
        "description":
            "Code <b>after completing</b> Brief Interview for Mental Status and reviewing medical record.",
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
            "title":
                '<p>A. <b>Acute Onset of Mental Status Change</b></p> <b>Is there evidence of an acute change in mental status</b> from the patient\'s baseline?',
            "options": [
              ...List.generate(
                3,
                (index) {
                  var list = [
                    '0.  <b>No</b>',
                    '1.  <b>Yes</b>',
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
            "type": "OPTION",
            "group_options": true,
            "title":
                '<p>B. <b>Inattention</b></p> - Did the patient have difficulty focusing attention, for example, being easily distractible or having difficulty keeping track of what was being said?',
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = [
                    '0.  <b>Behavior not present</b>',
                    '1.  <b>Behavior continuously present, does not fluctuate</b>',
                    '2.  <b>Behavior present, fluctuates</b> (comes and goes, changes in severity)',
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
            "type": "OPTION",
            "group_options": true,
            "title":
                '<p>C. <b>Disorganized thinking-</b></p> was the patient\'s thinking disorganized or incoherent (rambling or irrelevant conversation, unclear or illogical flow of ideas, or unpredictable switching from subject to subject)?',
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = [
                    '0.  <b>Behavior not present</b>',
                    '1.  <b>Behavior continuously present, does not fluctuate</b>',
                    '2.  <b>Behavior present, fluctuates</b> (comes and goes, changes in severity)',
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
            "type": "OPTION",
            "group_options": true,
            "title":
                '''<p>D . <b>Altered level of consciousness-</b></p>Did the patient have altered level of consciousness as indicated by any of the following criteria?
                <ul>
                <li><b>Vigilant</b> - Startled easily to any sound or touch </li>
                <li><b>Lethargic</b> - Repeatedly dozed off when being asked questions, but responded to voice or touch</li>
                <li><b>Stuporous</b> - Very difficult to arouse and keep aroused for the interview</li>
                <li><b>Comatose</b> - Could not be aroused</li>
                </ul>''',
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = [
                    '0.  <b>Behavior not present</b>',
                    '1.  <b>Behavior continuously present, does not fluctuate</b>',
                    '2.  <b>Behavior present, fluctuates</b> (comes and goes, changes in severity)',
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
            "type": "INFO",
            "group_options": true,
            "title":
                '''<i>Adapted from: Inouye SK, et al. Ann Intern Med. 1990; 113: 941-948. Confusion Assessment
Method. Copyright 2003, Hospital Elder Life Program, LLC. Not to be reproduced without
permission.</i>''',
          },
          {
            "question_id": 6,
            "options_alignment": "VERTICAL",
            "type": "TEXTFIELD",
            "group_options": true,
            "title": "Additional details - CAM Delirium Screening:",
            "options": [
              {
                "index": 0,
                "value": '',
                "label": '',
                "selected": false,
              }
            ]
          }
        ]
      },
      {
        'question_type_id': 130397002,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Cognitive Functioning:</b> Patient's current (day of assessment) level of alertness, orientation, comprehension, concentration, and immediate memory for simple commands.",
        "code": "M1700",
        "description": "",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "flag": ['O', 'V','\$'],
        "answer_id": 0,
        "options": List.generate(
          5,
          (index) {
            var list = [
              '0. Alert/oriented, able to focus and shift attention, comprehends and recalls task directions independently.',
              '1. Requires prompting (cueing, repetition, reminders) only under stressful or unfamiliar conditions.',
              '2. Requires assistance and some direction in specific situations (for example, on all tasks involving shifting of attention) or consistently requires low stimulus environment due to distractibility.',
              '3. Requires considerable assistance in routine situations. Is not alert and oriented or is unable to shift attention and recall directions more than half the time.',
              '4. Totally dependent due to disturbances such as constant disorientation, coma, persistent vegetative state, or delirium.'
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
        'question_type_id': 130397003,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Neurological history</b>",
        "code": "",
        "description": "",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "type": 'CHECKBOX',
            "question_id": 1,
            "group_options": true,
            "title": "",
            "options": [
              {
                "index": 0,
                "value": 'No history',
                "label": 'No history',
                "selected": false
              }
            ]
          },
          {
            "type": 'CHECKBOX',
            "question_id": 1,
            "group_options": true,
            "title": "",
            "options_alignment": 'HORIZONTAL',
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = [
                    'Dementia',
                    'Memory loss',
                    'Seizures',
                    'Parkinson\'s'
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
            "question_id": 1,
            "group_options": true,
            "title": "",
            "options_alignment": 'VERTICAL',
            "options": [
              ...List.generate(
                4,
                (index) {
                  var list = [
                    'Stroke/TIA (details)',
                    'Psychiatric illness (specify)',
                    'Traumatic brain injury (details)',
                    'Other'
                  ];
                  return {
                    "index": index,
                    "value": list[index],
                    "label": list[index],
                    "selected": false,
                   "popup_code": "TEXTFIELDPOPUP"
                  };
                },
              )
            ]
          },
        ]
      },
      {
        'question_type_id': 130397004,
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
        'question_type_id': 130397005,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>When Confused (Reported or observed within the last 14 days):</b>",
        "code": "M1710",
        "description": "",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "flag": ['O', 'V', '!','\$'],
        "answer_id": 0,
        "options": List.generate(
          6,
          (index) {
            var list = [
              '0 - Never',
              '1 - In new or complex situations only',
              '2 - On awakening or at night only',
              '3 - During the day and evening, but not constantly',
              '4 - Constantly',
              'NA - Patient nonresponsive'
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
        'question_type_id': 130397006,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>When Anxious (Reported or observed within the last 14 days):</b>",
        "code": "M1720",
        "description": "",
        "group_options": true,
        "dynamic_type": true,
        "flag": [
          'O',
          'V','\$'
        ],
        "answer_id": 0,
        "options": List.generate(
          5,
          (index) {
            var list = [
              '0 - None of the time',
              '1 - Less often than daily',
              '2 - Daily, but not constantly',
              '3 - All of the time',
              'NA - Patient nonresponsive'
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
    ]
  };

  static Map<String,dynamic> mood = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 1,
    "title": "Mood",
    "formId": 13,
    "subFormId": 398,
    "questions": [
      {
        'question_type_id': 130398001,
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
        'question_type_id': 130398002,
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
        'question_type_id': 130398003,
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
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Behavior/Risk Factors",
    "formId": 13,
    "subFormId": 399,
    "questions": [
      {
        'question_type_id': 130399001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Cognitive, behavioral, and psychiatric</b> symptoms that are demonstrated <u>at least once a week</u> <b>(Reported or Observed): (Mark all that apply.)</b>",
        "code": "M1740",
        "description": "",
        "group_options": false,
        "dynamic_type": true,
        "has_color": true,
        "flag": ["!"],
        "answer_id": 0,
        "options": List.generate(7, (index) {
          final options = [
            "1 - Memory deficit: failure to recognize familiar persons/places, inability to recall events of past 24 hours, significant memory loss so that supervision is required",
            "2 - Impaired decision-making: failure to perform usual ADLs or IADLs, inability to appropriately stop activities, jeopardizes safety through actions",
            "3 - Verbal disruption: yelling, threatening, excessive profanity, sexual references, etc.",
            "4 - Physical aggression: aggressive or combative to self and others (for example, hits self, throws objects, punches, dangerous maneuvers with wheelchair or other objects)",
            "5 - Disruptive, infantile, or socially inappropriate behavior (<b>excludes</b> verbal actions)",
            "6 - Delusional, hallucinatory, or paranoid behavior",
            "7 - None of the above behaviors demonstrated"
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
        'question_type_id': 130399002,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Frequency of Disruptive Behavior Symptoms (Reported or observed):</b> Any physical, verbal, or other disruptive/dangerous symptoms that are injurious to self or others or jeopardize personal safety.",
        "code": "M1745",
        "description": "",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": List.generate(6, (index) {
          final options = [
            "0 - Never",
            "1 - Less than once a month",
            "2 - Once a month",
            "3 - Several times each month.",
            "4 - Several times a week.",
            "5 - At least daily"
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
        'question_type_id': 130399003,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
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
        'question_type_id': 130399004,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Evidence of abuse/neglect/exploitation</b>",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": generateOptions([
              "None observed/reported",
              "Verbal/Emotional",
              "Actual",
              "Potential",
              "Physical",
              "Financial",
            ])
          },
          {
            "question_id": 2,
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
      {
        'question_type_id': 130399005,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": false,
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

  static Map<String,dynamic> respiratory = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Respiratory",
    "formId": 13,
    "subFormId": 400,
    "questions": [
      {
        'question_type_id': 130400001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Respiratory History</b>",
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
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Asthma:',
                "value": 'Asthma:',
                "selected": false,
              },
            ]
          },
          {
            "question_id": 3,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(4, (index) {
              final options = [
                "Intermittent",
                "Mild Persistant",
                "Moderate Persistant",
                "Severe Persistant",
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
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Smoker:',
                "value": 'Smoker:',
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
                "Current",
                "Former",
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
            "question_id": 6,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": List.generate(5, (index) {
              final options = [
                "Emphysema",
                "Bronchitis",
                "COPD",
                "Pleurisy",
                "Pneumonia",
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
            "question_id": 7,
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
        'question_type_id': 130400002,
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
        'question_type_id': 130400003,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "When is the patient dyspneic or noticeably <b>short of breath?</b>",
        "code": "M1400",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "flag": ['*', 'O', 'V', 'CC'],
        "options": List.generate(
          5,
          (index) {
            var list = [
              '0  -  Patient is not short of breath',
              '1 - When walking more than 20 feet, climbing stairs',
              '2 - With moderate exertion (for example, while dressing, using commode or bedpan, walking distances less than 20 feet)',
              '3 - With minimal exertion (for example, while eating, talking, or performing other ADLs) or with agitation',
              '4 - At rest (during day or night)'
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

  static Map<String,dynamic> cardioVascular = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Cardiovascular",
    "formId": 13,
    "subFormId": 401,
    "questions": [
      {
        'question_type_id': 130401001,
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
        'question_type_id': 130401002,
        "type": "INFO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "",
        "code": "",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
      },
    ]
  };

  static Map<String,dynamic> genitourinary = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Genitourinary",
    "formId": 13,
    "subFormId": 402,
    "questions": [
      {
        'question_type_id': 130402001,
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
        'question_type_id': 130402002,
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
        'question_type_id': 130402003,
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
        'question_type_id': 130402004,
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
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Gastrointestinal/Nutrition/Endocrine",
    "formId": 13,
    "subFormId": 403,
    'questions': [
      {
        'question_type_id': 130403001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Gastrointestinal History</b>",
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
            "options": List.generate(8, (index) {
              final options = [
                "GI Bleed",
                "GERD",
                "Ulcerative Colitis",
                "Colitis",
                "Diverticulosis",
                "Irritable Bowel Syndrome",
                "Crohn's",
                "Other"
              ];
              return {
                "index": index,
                "label": options[index],
                "value": options[index],
                "selected": false,
                if (index == 7) "popup_code": "TEXTFIELDPOPUP"
              };
            })
          },
        ]
      },
      {
        'question_type_id': 130403002,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Bowel Incontinence Frequency:</b>",
        "code": "M1620",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "flag": ['O'],
        "options": List.generate(
          8,
          (index) {
            var list = [
              "0 - Very rarely or never has bowel incontinence",
              "1 - Less than once weekly",
              "2 - One to three times weekly",
              "3 - Four to six times weekly",
              "4 - On a daily basis",
              "5 - More often than once daily",
              "NA - Patient has ostomy for bowel elimination",
              "UK - Unknown"
            ];
            return {
              "index": index,
              "label": list[index],
              "value": "",
              "selected": false
            };
          },
        )
      },
      {
        'question_type_id': 130403003,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title":
            '''<b>Ostomy for Bowel Elimination:</b> Does this patient have an ostomy for bowel elimination that (within the last 14 days): a) was related to an inpatient facility stay; or 
b) necessitated a change in medical or treatment regimen?''',
        "code": "M1630",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "options": List.generate(
          3,
          (index) {
            var list = [
              "0 - Patient does not have an ostomy for bowel elimination.",
              "1 - Patient's ostomy was not related to an inpatient stay and did not necessitate change in medical or treatment regimen.",
              "2 - The ostomy was related to an inpatient stay or did necessitate change in medical or treatment regimen.",
            ];
            return {
              "index": index,
              "label": list[index],
              "value": "",
              "selected": false
            };
          },
        )
      },
      {
        'question_type_id': 130403004,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Endocrine History</b>",
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
                'selected': false
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
            "options": [
              {
                "index": 0,
                "label": 'Diabetes:',
                "value": 'Diabetes:',
                'selected': false
              }
            ]
          },
          {
            "question_id": 3,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              ...List.generate(
                3,
                (index) {
                  var list = ["Type I", "Type II", "Type II requiring insulin"];
                  return {
                    "index": index,
                    "label": list[index],
                    "value": list[index],
                    "selected": false
                  };
                },
              )
            ]
          },
          {
            "question_id": 4,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              ...List.generate(
                2,
                (index) {
                  var list = ["Yes", "No"];
                  return {
                    "index": index,
                    "label": list[index],
                    "value": list[index],
                    "selected": false
                  };
                },
              )
            ]
          },
          {
            "question_id": 5,
            "type": "TEXTFIELD",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {"index": 0, "label": '', "value": '', 'selected': false,"popup_code":"TEXTFIELDPOPUP"}
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
            "options": [
              ...List.generate(
                2,
                (index) {
                  var list = ["Yes", "No"];
                  return {
                    "index": index,
                    "label": list[index],
                    "value": list[index],
                    "selected": false
                  };
                },
              )
            ]
          },
          {
            "question_id": 7,
            "type": "TEXTFIELD",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {"index": 0, "label": '', "value": '', 'selected': false,"popup_code":"TEXTFIELDPOPUP"}
            ]
          },
          {
            "question_id": 8,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Urine testing performed',
                "value": 'Urine testing performed',
                'selected': false
              }
            ]
          },
          {
            "question_id": 9,
            "type": "RADIO",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              ...List.generate(
                2,
                (index) {
                  var list = ["Yes", "No"];
                  return {
                    "index": index,
                    "label": list[index],
                    "value": list[index],
                    "selected": false
                  };
                },
              )
            ]
          },
          {
            "question_id": 10,
            "type": "TEXTFIELD",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {"index": 0, "label": '', "value": '', 'selected': false,"popup_code":"TEXTFIELDPOPUP"}
            ]
          },
          {
            "question_id": 11,
            "type": "TEXTFIELD",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {"index": 0, "label": '', "value": '', 'selected': false,"popup_code":"TEXTFIELDPOPUP"}
            ]
          },
          {
            "question_id": 12,
            "type": "CHECKBOX",
            "title": "",
            "code": "",
            "description": "",
            "options_alignment": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "label": 'Thyroid Disease',
                "value": 'Thyroid Disease',
                'selected': false,
                "popup_code": "TEXTFIELDPOPUP"
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 130403005,
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
        'question_type_id': 130403006,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Nutritional Approaches</b>",
        "code": "K0520",
        "description": "",
        // "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          ...List.generate(
            5,
            (index) {
              return {
                "question_id": index,
                "type": "CHECKBOX",
                "title": "",
                "code": "",
                "description": "",
                "options_alignment": "HORIZONTAL",
                "group_options": true,
                "options": [
                  {"index": 0, "label": '', "value": '', "selected": false}
                ]
              };
            },
          )
        ]
      },
      {
        'question_type_id': 130403007,
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
      },{
        'question_type_id': 130403008,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": false,
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
        'question_type_id': 130403009,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "code": "M1870",
        "title": "<b>Feeding or Eating:</b>",
        "description":
            '''Current ability to feed self meals and snacks safely. Note: This refers only to the process of <u>eating</u>,
<u>chewing</u>, and <u>swallowing</u>, <u>not preparing</u> the food to be eaten.''',
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "flag":["O","V","!"],
        "answer_id": 0,
        "options": List.generate(
          6,
          (index) {
            var list = [
              '0 - Able to independently feed self.',
              '''1 - Able to feed self independently but requires:
     <br>(a) meal set-up; <u>OR</u>
     <br>(b) intermittent assistance or supervision from another person; <u>OR</u>
     <br>(c) a liquid, pureed or ground meat diet.''',
              "2 - <u>Unable</u> to feed self and must be assisted or supervised throughout the meal/snack.",
              "3 - Able to take in nutrients orally <u>and</u> receives supplemental nutrients through a nasogastric tube or gastrostomy.",
              "4 - <u>Unable</u> to take in nutrients orally and is fed nutrients through a nasogastric tube or gastrostomy.",
              "5 - Unable to take in nutrients orally or by tube feeding."
            ];
            return {
              "index": index,
              "value": '',
              "label": list[index],
              "selected": false
            };
          },
        )
      },
    ]
  };

  static Map<String,dynamic> integumentaryWoundCare = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Integumentary/Wound Care",
    "formId": 13,
    "subFormId": 404,
    'questions': [
      {
        'question_type_id': 13404001,
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
        "question_type_id": 13404002,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "options_alignment": "HORIZONTAL",
        "scroll_axis": "HORIZONTAL",
        "title": "<b>Wound(s) Identified?</b>",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
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
      {
        'question_type_id': 13404003,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
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
        'question_type_id': 13404004,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "title": "<b>Pressure Injury Risk</b>",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "",
            // "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "value": "Braden Scale:",
                "label": "Braden Scale:",
                "selected": false,
              },
            ]
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "",
            // "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "value": "",
                "label": "Score:",
                "popup_code":"TEXTFIELDPOPUP"
              },
              {
                "index": 1,
                "value": "",
                "label": "Interpretation:",
                "popup_code":"TEXTFIELDPOPUP"
              }
            ]
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "title": "",
            // "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "value": "Other Scale:",
                "label": "Other Scale:",
                "selected": false,
              },
            ]
          },
          {
            "question_id": 4,
            "type": "TEXTFIELD",
            "title": "",
            // "scroll_axis": "HORIZONTAL",
            "group_options": true,
            "options": [
              {
                "index": 0,
                "value": "",
                "label": "Score:",
                "popup_code":"TEXTFIELDPOPUP"
              },
              {
                "index": 1,
                "value": "",
                "label": "Interpretation:",
                "popup_code":"TEXTFIELDPOPUP"
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 13404005,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
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

  static Map<String,dynamic> ulcersSurgicalWounds = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Ulcers/Surgical Wounds",
    "formId": 13,
    "subFormId": 405,
    'questions': [
      {
        'question_type_id': 130405001,
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
        'question_type_id': 130405002,
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
        'question_type_id': 130405003,
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
        'question_type_id': 130405004,
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
        'question_type_id': 130405005,
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
            null,
            null,
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
        'question_type_id': 130405006,
        "type": "OPTION",
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
        'question_type_id': 130405007,
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
        'question_type_id': 130405008,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "Does this patient have <b>Surgical Wounds?</b>",
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
        'question_type_id': 130405009,
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

  static Map<String,dynamic> musculoskeletal = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Musculoskeletal",
    "formId": 13,
    "subFormId": 406,
    "questions": [
      {
        'question_type_id': 130406001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "title": "<b>Musculoskeletal History</b>",
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "questions": [
          {
            "type": 'STATIC',
            "question_id": 1,
            "group_options": false,
            "options": List.generate(25, (index) {
              final list = [
                "No history",
                "Recent Fracture (location)",
                "Amputation:",
                "Below Knee:",
                "R",
                "L",
                "Above Knee:",
                "R",
                "L",
                "Upper Extremity :",
                "R",
                "L",
                "Other",
                "Prosthesis/appliance",
                "Atrophy",
                "Decreased ROM",
                "Paraplegia",
                "Shuffling/wide-based gait",
                "Hemiplegia",
                "Paresthesia",
                "Quadriplegia",
                "Contractures",
                "Swollen/painful joints",
                "Weakness",
                "Other",
              ];
              return {
                "index": index,
                "label": list[index],
                "value": list[index],
                "selected": false,
                if ([1, 12, 13, 23, 24].contains(index))
                  "popup_code": "TEXTFIELDPOPUP"
              };
            })
          },
        ]
      },
      {
        'question_type_id': 130406002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
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
      {
        'question_type_id': 130406003,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "code": "Activities Permitted",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": []
      },
      {
        'question_type_id': 130406004,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "code": "Functional Limitations",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": []
      },
      {
        'question_type_id': 130406005,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "code": "DME",
        "options_alignment": "VERTICAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": []
      },
      {
        'question_type_id': 130406006,
        "type": "ACTIONBUTTON",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 4,
        'question_options': [
          {
            "index": 0,
            "label": "Generate DME Order",
            "value": "",
            "selected": false,
          },
        ]
      },
      {
        'question_type_id': 130406007,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Equipment currently in the home</b>",
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 4,
        'questions': [
          {
            "type": 'RADIO',
            "question_id": 1,
            "title":
                "Patient/family able to use all equipment/supplies safely?",
            "options_alignment": 'HORIZONTAL',
            "options": [
              {
                "index": 0,
                "label": "Yes",
                "value": "Yes",
                "selected": false,
              },
              {
                "index": 1,
                "label": "No (Specify)",
                "value": "No (Specify)",
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP",
              },
            ]
          },
          {
            "type": 'STATIC',
            "question_id": 2,
            "title":
                "Safety measures/additional equipment recommended to address safety issues identified and prevent injury :",
            "options": [
              {
                "index": 0,
                "label": "Yes",
                "value": "Yes",
              },
              {
                "index": 1,
                "label": "None",
                "value": "None",
                "selected": false,
              },
            ]
          },
        ]
      },
    ]
  };

  static Map<String,dynamic> functionalAssessment = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 1,
    "title": "Functional Assessment",
    "formId": 13,
    "subFormId": 407,
    'questions': [
      {
        "question_type_id": 130407001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "INFO",
            "title": "<b>Oral Motor</b>",
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
        "question_type_id": 130407002,
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
        "question_type_id": 130407003,
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
        "question_type_id": 130407004,
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
        "question_type_id": 130407005,
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
        "question_type_id": 130407006,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "question_id": 1,
            "type": "INFO",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Diadochokinesis</b>",
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
        "question_type_id": 130407007,
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
        "question_type_id": 130407008,
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
        "question_type_id": 130407009,
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
        "question_type_id": 130407010,
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
        "question_type_id": 130407011,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Comments</b>",
        "dynamic_type": true,
        "question_options": generateOptions([""]),
      },
    ]
  };

  static Map<String,dynamic> functionalStatus = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Functional Status",
    "formId": 13,
    "subFormId": 408,
    'questions': [
      {
        'question_type_id': 130408001,
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
        'question_type_id': 130408002,
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
        'question_type_id': 130408003,
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
        'question_type_id': 130408004,
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
        'question_type_id': 130408005,
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
        'question_type_id': 130408006,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Toileting Hygiene:</b>",
        "description":
            "Current ability to maintain perineal hygiene safely, adjust clothes and/or incontinence pads before and after using toilet, commode, bedpan, urinal. If managing ostomy, includes cleaning area around stoma, but not managing equipment.",
        "code": "M1845",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "flag": [
          "O",
          "V",
          "!",
        ],
        "question_options": List.generate(4, (index) {
          final options = [
            "0 - Able to manage toileting hygiene and clothing management without assistance.",
            "1 - Able to manage toileting hygiene and clothing management without assistance if supplies/implements are laid out for the patient.",
            "2 - Someone must help the patient to maintain toileting hygiene and/or adjust clothing.",
            "3 - Patient depends entirely upon another person to maintain toileting hygiene.",
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
        'question_type_id': 130408007,
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
        'question_type_id': 130408008,
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
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 1,
    "title": "Functional Abilities and Goals",
    "formId": 13,
    "subFormId": 409,
    'questions': [
      {
        'question_type_id': 130409001,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Prior Functioning: Everyday Activities:</b>",
        "code": "GG0100",
        "description":
            "Indicate the patient’s usual ability with everyday activities prior to the current illness, exacerbation, or injury.",
        "group_options": true,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "type": 'OPTION',
            'question_id': 1,
            "title":
                '<b>A.  Self Care:</b> Code the patient’s need for assistance with bathing, dressing, using the toilet, or eating prior to the current illness, exacerbation, or injury.',
            "options": List.generate(5, (index) {
              final options = [
                "<b>3 - Independent</b> - Patient completed the activities by him/herself, with or without an assistive device, with no assistance from a helper.",
                "<b>2 - Needed Some Help</b> - Patient needed partial assistance from another person to complete activities.",
                "<b>1 - Dependent</b> - A helper completed the activities for the patient.",
                "<b>8 - Unknown</b>",
                "<b>9 - Not Applicable</b>",
              ];
              return {
                "index": index,
                "value": options[index],
                "label": options[index],
                "selected": index == 0 ? true : false
              };
            }),
          },
          {
            "type": 'OPTION',
            'question_id': 2,
            "title":
                '<b>B.  Indoor Mobility (Ambulation):</b> Code the patient’s need for assistance with walking from room to room (with or without a device such as cane, crutch or walker) prior to the current illness, exacerbation, or injury.',
            "options": List.generate(5, (index) {
              final options = [
                "<b>3 - Independent</b> - Patient completed the activities by him/herself, with or without an assistive device, with no assistance from a helper.",
                "<b>2 - Needed Some Help</b> - Patient needed partial assistance from another person to complete activities.",
                "<b>1 - Dependent</b> - A helper completed the activities for the patient.",
                "<b>8 - Unknown</b>",
                "<b>9 - Not Applicable</b>",
              ];
              return {
                "index": index,
                "value": options[index],
                "label": options[index],
                "selected": index == 0 ? true : false
              };
            }),
          },
          {
            "type": 'OPTION',
            'question_id': 3,
            "title":
                '<b>C.  Stairs:</b> Code the patient’s need for assistance with internal or external stairs (with or without a device such as cane, crutch, or walker) prior to the current illness, exacerbation or injury.',
            "options": List.generate(5, (index) {
              final options = [
                "<b>3 - Independent</b> - Patient completed the activities by him/herself, with or without an assistive device, with no assistance from a helper.",
                "<b>2 - Needed Some Help</b> - Patient needed partial assistance from another person to complete activities.",
                "<b>1 - Dependent</b> - A helper completed the activities for the patient.",
                "<b>8 - Unknown</b>",
                "<b>9 - Not Applicable</b>",
              ];
              return {
                "index": index,
                "value": options[index],
                "label": options[index],
                "selected": index == 0 ? true : false
              };
            }),
          },
          {
            "type": 'OPTION',
            'question_id': 3,
            "title":
                '<b>D.  Functional Cognition:</b> Code the patient’s need for assistance with planning regular tasks, such as shopping or remembering to take medication prior to the current illness, exacerbation, or injury.',
            "options": List.generate(5, (index) {
              final options = [
                "<b>3 - Independent</b> - Patient completed the activities by him/herself, with or without an assistive device, with no assistance from a helper.",
                "<b>2 - Needed Some Help</b> - Patient needed partial assistance from another person to complete activities.",
                "<b>1 - Dependent</b> - A helper completed the activities for the patient.",
                "<b>8 - Unknown</b>",
                "<b>9 - Not Applicable</b>",
              ];
              return {
                "index": index,
                "value": options[index],
                "label": options[index],
                "selected": index == 0 ? true : false
              };
            }),
          },
        ]
      },
      {
        'question_type_id': 130409002,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Prior Device Use.</b> Indicate devices and aids used by the patient prior to the current illness, exacerbation, or injury.",
        "description":
            "Indicate devices and aids used by the patient prior to the current illness, exacerbation, or injury.",
        "code": "GG0110",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": List.generate(6, (index) {
          final options = [
            "<b>A. Manual wheelchair</b>",
            "<b>B. Motorized wheelchair and/or scooter</b>",
            "<b>C. Mechanical lift</b>",
            "<b>D. Walker</b>",
            "<b>E. Orthotics/Prosthetics</b>",
            "<b>Z. None of the above</b>",
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
        'question_type_id': 130409003,
        "type": "INFO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Self-Care</b>", "question_lookup_enabled":true,
        "description":
        '''<b>Code the patient's usual performance at SOC/ROC for each activity using the 6-point scale. If activity was not attempted at SOC/ROC, code the reason. Code the patient's discharge goal(s) using the 6-point scale. Use of codes 07, 09, 10 or 88 is permissible to code discharge goal(s).
 <br><br>Coding:
 <br><br>Safety</b> and <b>Quality of Performance</b> – If helper assistance is required because patient's performance is unsafe or of poor quality, score according to amount of assistance provided.
 <br><i>Activities may be completed with or without assistive devices.</i>
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
      ...List.generate(7, (index) {
        final titleList = [
          "<b>A. Eating:</b> The ability to use suitable utensils to bring food and/or liquid to the mouth and swallow food and/or liquid once the meal is placed before the patient.",
          "<b>B. Oral Hygiene:</b> The ability to use suitable items to clean teeth. Dentures (if applicable): The ability to insert and remove dentures from and to the mouth, and manage equipment for soaking and rinsing them.",
          "<b>C. Toileting Hygiene:</b> The ability to maintain perineal hygiene, adjust clothes before and after voiding or having a bowel movement. If managing an ostomy, include wiping the opening but not managing  equipment.",
          "<b>E. Shower/bathe self:</b> The ability to bathe self, including washing, rinsing, and drying self (excludes washing of back and hair). Does not include transferring in/out of tub/shower.",
          "<b>F. Upper body dressing:</b> The ability to dress and undress above the waist; including fasteners, if applicable.",
          "<b>G. Lower body dressing:</b> The ability to dress and undress below the waist, including fasteners; does not include footwear.",
          "<b>H. Putting on/taking off footwear:</b> The ability to put on and take off socks and shoes or other footwear that is appropriate for safe mobility; including fasteners, if applicable.",
        ];
        return {
          'question_type_id': 130409003 + (index + 1),
          "type": "STATIC",
          "question_type": "COMPREHENSIVE",
          "title": titleList[index],
          "dynamic_type": false,
          "has_color": true,
          "answer_id": 0,
          "flag": ["P", "V"],
          "question_grid": 2,
          "questions": List.generate(2, (index) {
            final titleList = ["1. SOC/ROC Performance", "2. Discharge Goal"];
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
        'question_type_id': 130409011,
        "type": "INFO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Mobility</b>",
        "description":
        '''<b>Code the patient's usual performance at SOC/ROC for each activity using the 6-point scale. If activity was not attempted at SOC/ROC, code the reason. Code the patient's discharge goal(s) using the 6-point scale. Use of codes 07, 09, 10 or 88 is permissible to code discharge goal(s).
 <br><br>Coding:
 <br><br>Safety</b> and <b>Quality of Performance</b> – If helper assistance is required because patient's performance is unsafe or of poor quality, score according to amount of assistance provided.
 <br><i>Activities may be completed with or without assistive devices.</i>
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
      ...List.generate(15, (index) {
        final titleList = [
          "<b>A. Roll left and right:</b> The ability to roll from lying on back to left and right side, and return to lying on back on the bed.",
          "<b>B. Sit to lying:</b> The ability to move from sitting on side of bed to lying flat on the bed.",
          "<b>C. Lying to sitting on side of bed:</b> The ability to move from lying on the back to sitting on the side of the bed with feet flat on the floor, and with no back support.",
          "<b>D. Sit to stand:</b> The ability to come to a standing position from sitting in a chair, wheelchair, or on the side of the bed.",
          "<b>E. Chair/bed-to-chair transfer:</b> The ability to transfer to and from a bed to a chair (or wheelchair).",
          "<b>F. Toilet transfer:</b>The ability to get on and off a toilet or commode.",
          "<b>G. Car transfer:</b> The ability to transfer in and out of a car or van on the passenger side. Does not include the ability to open/close door or fasten seat belt.",
          "<b>I. Walk 10 feet:</b>Once standing, the ability to walk at least 10 feet in a room, corridor, or similar space.",
          "<b>J. Walk 50 feet with two turns:</b> Once standing, the ability to walk 50 feet and make two turns",
          "<b>K. Walk 150 feet:</b> Once standing, the ability to walk at least 150 feet in a corridor or similar space.",
          "<b>L. Walking 10 feet on uneven surfaces:</b> The ability to walk 10 feet on uneven or sloping surfaces (indoor or outdoor), such as turf or gravel.",
          "<b>M. 1 step (curb):</b> The ability to go up and down a curb and/or up and down one step. ",
          "<b>N. 4 steps:</b> The ability to go up and down four steps with or without a rail.",
          "<b>O. 12 steps:</b> The ability to go up and down 12 steps with or without a rail.",
          "<b>P. Picking up object:</b> The ability to bend/stoop from a standing position to pick up a small object, such as a spoon, from the floor.",
        ];
        final descriptionList = [
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          "<i>If SOC/ROC performance is coded 07, 09, 10 or 88 → skip to GG0170M, 1 step (curb)</i>",
          null,
          null,
          null,
          "<i>If SOC/ROC Performance is coded 07, 09, 10 or 88 → skip to GG0170P, Mobility, Picking up object.</i>",
          "<i>If SOC/ROC Performance is coded 07, 09, 10 or 88→ skip to GG0170P, Picking up object.</i>",
          null,
          null,
        ];
        return {
          'question_type_id': 130409011 + (index + 1),
          "type": "STATIC",
          "question_type": "COMPREHENSIVE",
          "title": titleList[index],
          "description": descriptionList[index],  
          "dynamic_type": false,
          "has_color": true,
          "answer_id": 0,
          if(![0,6,7,10,11,12,13,14].contains(index))"flag": ["P", "V"],
          "question_grid": 2,
          "questions": List.generate(2, (index) {
            final titleList = ["1. SOC/ROC Performance", "2. Discharge Goal"];
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
        'question_type_id': 130409027,
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
        'question_type_id': 130409028,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>R. Wheel 50 feet with two turns:</b> Once seated in wheelchair/scooter, the ability to wheel at least 50 feet and make two turns.",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "flag": ["P", "V"],
        "questions": [
          ...List.generate(2, (index) {
            final titleList = ["1. SOC/ROC Performance", "2. Discharge Goal"];
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
          {
            "type": 'OPTION',
            'question_id': 3,
            "title":
                "<b>RR1. Indicate the type of wheelchair or scooter used.</b>",
            "options": List.generate(2, (index) {
              final options = [
                "<b>1. Manual</b>",
                "<b>2. Motorized</b>",
              ];
              return {
                "index": index,
                "value": options[index],
                "label": options[index],
                "selected": false
              };
            }),
          },
        ]
      },
      {
        'question_type_id': 130409029,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>S. Wheel 150 feet:</b> Once seated in wheelchair/scooter, the ability to wheel at least 150 feet in a corridor or similar space.",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "flag": ["P", "V"],
        "questions": [
          ...List.generate(2, (index) {
            final titleList = ["1. SOC/ROC Performance", "2. Discharge Goal"];
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
          {
            "type": 'OPTION',
            'question_id': 3,
            "title":
                "<b>RR1. Indicate the type of wheelchair or scooter used.</b>",
            "options": List.generate(2, (index) {
              final options = [
                "<b>1. Manual</b>",
                "<b>2. Motorized</b>",
              ];
              return {
                "index": index,
                "value": options[index],
                "label": options[index],
                "selected": false
              };
            }),
          },
        ]
      }
    ]
  };

  static Map<String,dynamic> fallRiskTherapyNeed = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Fall Risk / Therapy Need",
    "formId": 13,
    "subFormId": 410,
    "questions": [
      {
        'question_type_id': 130410001,
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
        'question_type_id': 130410002,
        "type": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": false,
        "code": "M2200",
        "title":
            "<b>Therapy Need:</b> In the home health plan of care for the Medicare payment episode for which this assessment will define a case mix group, what is the indicated need for therapy visits (total of reasonable and necessary physical , occupational , and speech-language pathology visits combined)? <b>(Enter zero [ \"000\" ] if no therapy visits indicated.)</b>",
        "answer_id": 4,
        'questions': [
          {
            "type": 'STATIC',
            "question_id": 1,
            "options": [
              {
                "index": 0,
                "label":
                    "Number of therapy visits indicated ( total of physical, occupational and speech-language pathology combined).",
                "value": "",
                "selected": false,
              },
            ]
          },
          {
            "type": 'RADIO',
            "question_id": 2,
            "title":
                "<b>N/A - Not Applicable: No case mix group defined by this assessment:</b>",
            "options": [
              {
                "index": 0,
                "label":
                    "0 - Need for Therapy Visits Indicated (Enter a valid numeric value into text box above)",
                "value": "0 - Need for Therapy Visits Indicated (Enter a valid numeric value into text box above)",
                "selected": false,
              },
              {
                "index": 1,
                "label":
                    "1 - N/A- Not Applicable (Ensure text box above is blank)",
                "value": "1 - N/A- Not Applicable (Ensure text box above is blank)",
                "selected": false,
              },
            ]
          },
        ]
      },
      {
        'question_type_id': 130410003,
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
                "popup_code":"TEXTFIELDPOPUP"
              },
            ]
          },
        ]
      },
    ]
  };

  static Map<String,dynamic> medications = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Medications",
    "formId": 13,
    "subFormId": 411,
    'questions': [
      {
        'question_type_id': 130411001,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "title": "<b> Medication Management</b>",
        "dynamic_type": false,
        "options_alignment": "HORIZONTAL",
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": " Does patient have all prescribed medications?",
            "options": List.generate(3, (index) {
              final labelList = [
                "Yes",
                "No (explain)",
                "NA - Patient is not taking any medications",
              ];
              return {
                "index": index,
                "label": labelList[index],
                "value": labelList[index],
                "selected": false,
                if (index == 1) "popup_code": "TEXTFIELDPOPUP",
              };
            }),
          },
          {
            "question_id": 2,
            "type": "RADIO",
            "title":
                "Does patient/caregiver have a system to manage medications?",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": List.generate(2, (index) {
              final labelList = [
                "Yes",
                "No",
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
            "question_id": 2,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "Pill box utilized (specify who manages)",
                "selected": false,
              }
            ]
          },
          {
            "question_id": 4,
            "type": "RADIO",
            "title":
                "Are there obstacles to obtaining new or current prescriptions?",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": List.generate(2, (index) {
              final labelList = [
                "Yes (explain)",
                "No",
              ];
              return {
                "index": index,
                "label": labelList[index],
                "value": labelList[index],
                "selected": false,
                if (index == 0) "popup_code": "TEXTFIELDPOPUP",
              };
            }),
          },
          {
            "question_id": 5,
            "type": "CHECKBOX",
            "title": "Medication safety discussed:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": List.generate(5, (index) {
              final labelList = [
                "Storage",
                "Expiration dates",
                "Disposal",
                "Clearly labeled",
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
        ]
      },
      {
        'question_type_id': 130411002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
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
      {
        "question_type_id": 130411003,
        "type": "OPTION",
        "code": "M2001",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Drug Regimen Review: </b>",
        "description":
            "Did a complete drug regimen review identify potential clinically significant medication issues?",
        "dynamic_type": true,
        "flag": ["P", "CC"],
        "has_color": true,
        "answer_id": 0,
        "question_options": List.generate(4, (index) {
          final list = [
            "0  No   -  No issues found during review ",
            "1  Yes  -  Issues found during review",
            "9  NA   -  Patient is not taking any medications ",
            "-       - Not assessed/No information",
          ];
          final hints = [
            "→Skip M2003 ",
            " ",
            "→Skip M2003, M2010, M2020, M2030",
            " ",
          ];
          return {
            "index": index,
            "value": list[index],
            "label": list[index],
            "hint": hints[index],
            "selected": index == 0 ? true : false,
          };
        }),
      },
      {
        'question_type_id': 130411004,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b> Describe drug regimen review issues and medication interactions identified during review and follow up details:</b>",
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "value": "",
          }
        ]
      },
      {
        "question_type_id": 130411005,
        "type": "OPTION",
        "code": "M2003",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Medication follow-up:</b>",
        "description":
            "Did the agency contact a physician (or physician-designee) by midnight of the next calendar day and complete prescribed/recommended actions in response to the identified potential clinically significant medication issues?",
        "dynamic_type": true,
        "flag": ["P", "CC"],
        "has_color": true,
        "answer_id": 0,
        "question_options": List.generate(3, (index) {
          final list = [
            "0 - No",
            "1 - Yes ",
            "- - Not assessed/No information",
          ];
          return {
            "index": index,
            "value": list[index],
            "label": list[index],
            "selected": index == 0 ? true : false,
          };
        }),
      },
      {
        "question_type_id": 130411006,
        "type": "OPTION",
        "code": "M2010",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Patient/Caregiver High-Risk Drug Education: </b>",
        "description":
            "Has the patient/caregiver received instruction on special precautions for all high-risk medications (such as hypoglycemics, anticoagulants, etc.) and how and when to report problems that may occur?",
        "dynamic_type": true,
        "flag": ["P"],
        "answer_id": 0,
        "question_options": List.generate(3, (index) {
          final list = [
            "0 - No",
            "1 - Yes",
            "NA  Patient not taking any high-risk drugs OR patient/caregiver fully knowledgeable about special precautions assoclated with all high-risk medications",
          ];
          return {
            "index": index,
            "value": list[index],
            "label": list[index],
            "selected": index == 0 ? true : false,
          };
        }),
      },
      {
        "question_type_id": 130411007,
        "type": "STATIC",
        "code": "N0415",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>High-Risk Drug Classes: Use and indication</b>",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": List.generate(13, (index) {
          return {
            "question_id": index + 1,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "options": List.generate(3, (index2) {
              final labelList = [
                "No",
                "Yes",
                "-",
              ];
              return {
                "index": index2,
                "selected": false,
                "value": labelList[index2],
                "label": labelList[index2],
              };
            }),
          };
        }),
      },
      {
        "question_type_id": 130411008,
        "type": "OPTION",
        "code": "M2020",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Management of Oral Medications:</b>",
        "description":
            "<u>Patient's current ability</u> to prepare and take <u>all</u> oral medications reliably and safely, including administration of correct dosage at the appropriate times/ intervals.<br><br> <b><u>Excludes</u> injectable and IV medications. (NOTE: This refers to ability, not compliance or willingness.)</b>",
        "dynamic_type": true,
        "flag": ["*", "O", "V", "!", "CC"],
        "answer_id": 0,
        "question_options": List.generate(5, (index) {
          final list = [
            "0  - Able to independently take the correct oral medications(s) and proper dosage(s) at the correct times.",
            "1  - Able to take medication(s) at the correct times if: <br>(a) individual dosages are prepared in advance by another  person; <u>OR</u> <br>(b) another person develops a drug diary or chart.",
            "2  - Able to take medication(s) at the correct times if given reminders by another person at the appropriate times.",
            "3  - <u>Unable</u> to take medication unless administered by another person.",
            "NA- No oral medications prescribed.",
          ];
          return {
            "index": index,
            "value": list[index],
            "label": list[index],
            "selected": index == 0 ? true : false,
          };
        }),
      },
      {
        "question_type_id": 130411009,
        "type": "OPTION",
        "code": "M2030",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Management of Injectable Medications:</b>",
        "description":
            "<u>Patient's current ability</u> to prepare and take <u>all</u> prescribed injectable medications reliably and safely, including administration of correct dosage at the appropriate times/ intervals.<br><br> <b><u>Excludes</u> IV medications</b>",
        "dynamic_type": true,
        "answer_id": 0,
        "has_color": true,
        "question_options": List.generate(5, (index) {
          final list = [
            "0  - Able to independently take the correct oral medications(s) and proper dosage(s) at the correct times.",
            "1  - Able to take medication(s) at the correct times if: <br>(a)  individual syringes are prepared in advance by another person; <u>OR</u> <br>(b) another person develops a drug diary or chart.",
            "2  - Able to take medication(s) at the correct times if given reminders by another person based on the frequency of the injection",
            "3  - <u>Unable</u> to take medication unless administered by another person.",
            "NA - No injectable medications prescribed.",
          ];
          return {
            "index": index,
            "value": list[index],
            "label": list[index],
            "selected": index == 0 ? true : false,
          };
        }),
      },
    ]
  };

  static Map<String,dynamic> specialTreatmentProceduresAndPrograms = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 1,
    "title": "Special Treatment, Procedures, And Programs",
    "formId": 13,
    "subFormId": 412,
    'questions': [
      {
        'question_type_id': 130412001,
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
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Rehospitalization Risk",
    "formId": 13,
    "subFormId": 413,
    'questions': [
      {
        'question_type_id': 130413001,
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
        'question_type_id': 130413002,
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
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Objective",
    "formId": 13,
    "subFormId": 414,
    'questions': [
      {
        'question_type_id': 130414001,
        "type": "TEXTFIELD",
        "title": "<b>Objective:</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 130414002,
        "type": "ACTIONBUTTON",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['Exercise Flowchart']),
      },
      {
        'question_type_id': 130414003,
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
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Assessment",
    "formId": 13,
    "subFormId": 415,
    'questions': [
      {
        'question_type_id': 130415001,
        "type": "TEXTAREA",
        "title": "<b>Assessment</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 130415002,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String,dynamic> planOfCare = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Plan Of Care",
    "formId": 13,
    "subFormId": 416,
    'questions': [
      {
        'question_type_id': 130416001,
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
        'question_type_id': 130416002,
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
        'question_type_id': 130416003,
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
        'question_type_id': 130416004,
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
        'question_type_id': 130416005,
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
        'question_type_id': 130416006,
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
        'question_type_id': 130416007,
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
        'question_type_id': 130416008,
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
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 2,
    "title": "Plan/Care Coordination",
    "formId": 13,
    "subFormId": 417,
    'questions': [
      {
        'question_type_id': 130417001,
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
        'question_type_id': 130417002,
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
        'question_type_id': 130417003,
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
        'question_type_id': 130417004,
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
        'question_type_id': 130417005,
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
        'question_type_id': 130417006,
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

  static Map<String,dynamic> diagnosisCodes = {
    "template_name": "OASIS ST ROC/RECERT",
    "template_code": "",
    "cols": 1,
    "title": "Diagnosis Codes",
    "formId": 13,
    "subFormId": 418,
    'questions': [
      {
        'question_type_id': 130418001,
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
        'question_type_id': 130418002,
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
}
