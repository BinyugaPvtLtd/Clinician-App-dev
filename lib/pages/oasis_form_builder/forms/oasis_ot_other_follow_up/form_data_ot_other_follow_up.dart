import '../generate_options.dart';

class FormDataOTOtherFollowUp {
  static Map<int, Map<String, dynamic>> otFollowUpDrawerItems = {
    36: clinicalRecordItemsPatientSignature,
    2: administrativeInfoForm,
    41: subjective,
    9: pain,
    8: vitalSignsHeight,
    4: immunization,
    7: safetyHazardEmergencyPlan,
    12: neurologicalCongnitive,
    14: behaviorRiskFactor,
    15: respiratoryCardiovascular,
    17: guGiNutritianEndocrine,
    19: integumentary,
    21: musculoskeletal,
    42: functionalAssessment,
    43: testsScales,
    22: functionalStatus,
    23: functionalAbilitiesAndGoals,
    24: fallRiskAssessment,
    25: medications,
    28: rehospitalizationRisk,
    45: objective,
    30: assessmentSummary,
    32: planOfCare,
    33: carePlanningCoordination,
    38: superVision,
    34: diagnosisCodes,
  };

  static Map<String, dynamic> clinicalRecordItemsPatientSignature = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "ABV345",
    "cols": 2,
    "title": "Clinical Record Items & Patient Signature",
    "formId": 53,
    "subFormId": 933,
    "questions": [
      {
        "type": 'UPLOAD',
        "question_type_id": 530933001,
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
        'question_type_id': 530933002,
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
        'question_type_id': 530933003,
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
        'question_type_id': 530933004,
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
        'question_type_id': 530933005,
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
  static Map<String, dynamic> administrativeInfoForm = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "ABV345",
    "cols": 2,
    "title": "Administrative Information",
    "formId": 53,
    "subFormId": 934,
    "questions": [
      {
        'question_type_id': 530934001,
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
        "question_type_id": 530934002,
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
        "question_type_id": 530934003,
        "title": "<b>Date Assessment Completed:</b>",
        "code": 'M0090',
        "type": "DATE",
        "question_type": "NON-COMPREHENSIVE",
        'options_alignment': 'HORIZONTAL',
        'scroll_axis': 'HORIZONTAL',
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "description": "",
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
        "question_type_id": 530934004,
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
        "description": "<b><u>Follow-Up:</u></b>",
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
        "question_type_id": 530934005,
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
        "question_type_id": 530934006,
        "code": 'M0110',
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "title":
            "<b>Episode Timing:</b> Is the Medicare home health payment episode for which this assessment will define a case mix group an \"early\" episode or a \"later\" episode in the patient's current sequence of adjacent Medicare home health payment episodes?",
        "options": [
          ...List.generate(
            4,
            (index) {
              var list = [
                '1 - Early',
                '2 - Later',
                'UK - Unknown',
                'NA  -  Not Applicable: No Medicare case mix group to be defined by this assessment.',
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

  static Map<String, dynamic> subjective = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Subjective",
    "formId": 53,
    "subFormId": 935,
    "questions": [
      {
        'question_type_id': 530935001,
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
        'question_type_id': 530935002,
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

  static Map<String, dynamic> pain = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Pain",
    "formId": 53,
    "subFormId": 936,
    "questions": [
      {
        'question_type_id': 530936001,
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
        'question_type_id': 530936002,
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
        'question_type_id': 530936003,
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
        'question_type_id': 530936004,
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
        'question_type_id': 530936005,
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
        'question_type_id': 530936006,
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
        'question_type_id': 530936007,
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
        'question_type_id': 530936008,
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
        'question_type_id': 530936009,
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
        'question_type_id': 530936010,
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
        'question_type_id': 530936011,
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

  static Map<String, dynamic> vitalSignsHeight = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Vital Signs",
    "formId": 53,
    "subFormId": 937,
    'questions': [
      {
        'question_type_id': 530937001,
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
              {
                "index": 0,
                "label": '',
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP",
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 530937002,
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
        'question_type_id': 530937003,
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

  static Map<String, dynamic> immunization = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Immunizations/Care Management",
    "formId": 53,
    "subFormId": 938,
    "questions": [
      {
        'question_type_id': 530938001,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Immunizations</b>",
        "code": "",
        "description": "Any changes in immunizations?",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          ...List.generate(2, (inx) {
            var list = [
              'No',
              'Yes (Explain)',
            ];
            return {
              "index": inx,
              "value": list[inx],
              "label": list[inx],
              "selected": false,
              if (inx == 1) "popup_code": "TEXTFIELDPOPUP"
            };
          })
        ]
      },
      {
        'question_type_id': 530938002,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Care Management</b>",
        "code": "",
        "description":
            "Any changes in primary caregiver(s) or responsibilities?",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          ...List.generate(2, (inx) {
            var list = [
              'No',
              'Yes (Explain)',
            ];
            return {
              "index": inx,
              "value": list[inx],
              "label": list[inx],
              "selected": false,
              if (inx == 1) "popup_code": "TEXTFIELDPOPUP"
            };
          })
        ]
      },
    ]
  };
  static Map<String, dynamic> safetyHazardEmergencyPlan = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Safety Hazards/Emergency Plan",
    "formId": 53,
    "subFormId": 939,
    "questions": [
      {
        'question_type_id': 530939001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Environmental safety hazards (select all that apply)</b>",
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
        'question_type_id': 530939002,
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
        'question_type_id': 530939003,
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

  static Map<String, dynamic> neurologicalCongnitive = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Neurological/Cognitive Status",
    "formId": 53,
    "subFormId": 940,
    "questions": [
      {
        'question_type_id': 530940001,
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
        'question_type_id': 530940002,
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
                "label": "Mental/Psychosocial/Cognitive Status",
              }
            ]
          }
        ],
      },
      {
        'question_type_id': 530940003,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
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
                "options": [
                  // {"index": 0, "value": '', "label": '', "selected": false},
                ]
              };
            },
          )
        ]
      },
    ]
  };

  static Map<String, dynamic> behaviorRiskFactor = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Behavior / Risk Factors",
    "formId": 53,
    "subFormId": 941,
    "questions": [
      {
        'question_type_id': 530941001,
        "type": "STATIC",
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
        'question_type_id': 530941002,
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
    ]
  };

  static Map<String, dynamic> respiratoryCardiovascular = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Respiratory/Cardiovascular",
    "formId": 53,
    "subFormId": 942,
    "questions": [
      {
        'question_type_id': 530942001,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Respiratory Status</b>",
        "code": "",
        "description": "Any changes in Respiratory Status?",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          ...List.generate(2, (inx) {
            var list = [
              'No',
              'Yes (Explain)',
            ];
            return {
              "index": inx,
              "value": list[inx],
              "label": list[inx],
              "selected": false,
              if (inx == 1) "popup_code": "TEXTFIELDPOPUP"
            };
          })
        ]
      },
      {
        'question_type_id': 530942002,
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
        'question_type_id': 530942003,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Cardiovascular Status</b>",
        "code": "",
        "description": "Any changes in Cardiovascular Status?",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          ...List.generate(2, (inx) {
            var list = [
              'No',
              'Yes (Explain)',
            ];
            return {
              "index": inx,
              "value": list[inx],
              "label": list[inx],
              "selected": false,
              if (inx == 1) "popup_code": "TEXTFIELDPOPUP"
            };
          })
        ]
      },
    ]
  };

  static Map<String, dynamic> guGiNutritianEndocrine = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "GU/GI/Nutrition/Endocrine",
    "formId": 53,
    "subFormId": 943,
    "questions": [
      {
        'question_type_id': 530943001,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Genitourinary Status</b>",
        "code": "",
        "description": "Any changes in Genitourinary Status?",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "options": [
          ...List.generate(2, (inx) {
            var list = [
              'No',
              'Yes (Explain)',
            ];
            return {
              "index": inx,
              "value": list[inx],
              "label": list[inx],
              "selected": false,
              if (inx == 1) "popup_code": "TEXTFIELDPOPUP"
            };
          })
        ]
      },
      {
        'question_type_id': 530943002,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Gastrointestinal Status</b>",
        "code": "",
        "description": "Any changes in Gastrointestinal Status?",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          ...List.generate(2, (inx) {
            var list = [
              'No',
              'Yes (Explain)',
            ];
            return {
              "index": inx,
              "value": list[inx],
              "label": list[inx],
              "selected": false,
              if (inx == 1) "popup_code": "TEXTFIELDPOPUP"
            };
          })
        ]
      },
      {
        'question_type_id': 530943003,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Endocrine Status</b>",
        "code": "",
        "description": "Any changes in Endocrine Status?",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "options": [
          ...List.generate(2, (inx) {
            var list = [
              'No',
              'Yes (Explain)',
            ];
            return {
              "index": inx,
              "value": list[inx],
              "label": list[inx],
              "selected": false,
              if (inx == 1) "popup_code": "TEXTFIELDPOPUP"
            };
          })
        ]
      },
      {
        'question_type_id': 530943004,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Diabetic Foot Inspection</b>",
        "code": "",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "title": 'Findings:',
            "group_options": true,
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "value": "",
                "label": "",
                "selected": false,
                "popup_code": "TEXTFIELDPOPUP"
              }
            ]
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": '',
            "group_options": true,
            "options_alignment": "HORIZONTAL",
            // "scroll_axis": "HORIZONTAL",
            "options": [
              {"index": 0, "value": "", "label": "NA", "selected": false}
            ]
          },
        ]
      },
      {
        'question_type_id': 530943005,
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
        'question_type_id': 530943006,
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

  static Map<String, dynamic> integumentary = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Integumentary",
    "formId": 53,
    "subFormId": 944,
    'questions': [
      {
        'question_type_id': 530944001,
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
        "question_type_id": 530944002,
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
        'question_type_id': 530944003,
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
        'question_type_id': 530944004,
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
                "popup_code": "TEXTFIELDPOPUP"
              },
              {
                "index": 1,
                "value": "",
                "label": "Interpretation:",
                "popup_code": "TEXTFIELDPOPUP"
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
                "popup_code": "TEXTFIELDPOPUP"
              },
              {
                "index": 1,
                "value": "",
                "label": "Interpretation:",
                "popup_code": "TEXTFIELDPOPUP"
              }
            ]
          },
        ]
      },
      {
        'question_type_id': 530944005,
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
      {
        'question_type_id': 530944006,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "group_options": true,
        "options_alignment": "HORIZONTAL",
        "code": "M1306",
        "flag": ['!', 'CC'],
        "answer_id": 0,
        "title":
            '''Does this patient have at least one <b>Unhealed Pressure Ulcer/Injury at Stage 2 or Higher</b> or designated as Unstageable? (Excludes Stage 1 pressure injuries and all healed pressure
ulcers/injuries)''',
        "options": [
          ...List.generate(
            2,
            (index) {
              var list = [
                '0 - No',
                '1 - Yes',
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
      }
    ]
  };

  static Map<String, dynamic> musculoskeletal = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Musculoskeletal",
    "formId": 53,
    "subFormId": 945,
    "questions": [
      {
        "question_type_id": 530945001,
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
        'question_type_id': 530945002,
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
        'question_type_id': 530945003,
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
        'question_type_id': 530945004,
        "type": "CHECKBOX",
        "has_color": false,
        "question_type": "COMPREHENSIVE",
        "options_alignment": "HORIZONTAL",
        "group_options": true,
        "dynamic_type": true,
        "title": "<b>Perceptual Impairments</b>",
        "answer_id": 0,
        "options": generateOptions(['NT', 'Impaired'])
      },
      {
        'question_type_id': 530945005,
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
        'question_type_id': 530945006,
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
        'question_type_id': 530945007,
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
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 1,
    "title": "Functional Assessment",
    "formId": 53,
    "subFormId": 946,
    'questions': [
      {
        "question_type_id": 530946001,
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
              [''],
              hints: [' '],
            ),
          }
        ]
      },
      {
        "question_type_id": 530946002,
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": true,
        "type": "CHECKBOX",
        "title":
            "<b>Environmental/safety findings that might impact plan of care</b>",
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
        "question_type_id": 530946003,
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

  static Map<String, dynamic> testsScales = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 1,
    "title": "Tests/Scales",
    "formId": 53,
    "subFormId": 947,
    'questions': [
      {
        "question_type_id": 530947001,
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
              "options": generateOptions(["Other:", "", ""]),
            };
          }),
        ]
      },
    ]
  };

  static Map<String, dynamic> functionalStatus = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Functional Status",
    "formId": 53,
    "subFormId": 948,
    'questions': [
      {
        'question_type_id': 530948001,
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
        'question_type_id': 530948002,
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
        'question_type_id': 530948003,
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
        'question_type_id': 530948004,
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
        'question_type_id': 530948005,
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
        'question_type_id': 530948006,
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
        'question_type_id': 530948007,
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

  static Map<String, dynamic> functionalAbilitiesAndGoals = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 1,
    "title": "Functional Abilities and Goals",
    "formId": 53,
    "subFormId": 949,
    'questions': [
      {
        'question_type_id': 530949001,
        "type": "INFO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Self-Care</b>", "question_lookup_enabled":true,
        "description":
            '''<b>Code the patient's usual performance at Follow-up for each activity using the 6-point If activity was not attempted at Follow-up, code the reason.
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
      ...List.generate(3, (index) {
        final titleList = [
          "<b>A. Eating:</b> The ability to use suitable utensils to bring food and/or liquid to the mouth and swallow food and/or liquid once the meal is placed before the patient.",
          "<b>B. Oral Hygiene:</b> The ability to use suitable items to clean teeth. Dentures (if applicable): The ability to insert and remove dentures from and to the mouth, and manage equipment for soaking and rinsing them.",
          "<b>C. Toileting Hygiene:</b> The ability to maintain perineal hygiene, adjust clothes before and after voiding or having a bowel movement. If managing an ostomy, include wiping the opening but not managing  equipment.",
        ];
        return {
          'question_type_id': 530949001 + (index + 1),
          "type": "STATIC",
          "question_type": "COMPREHENSIVE",
          "title": titleList[index],
          "dynamic_type": false,
          "has_color": true,
          "answer_id": 0,
          "flag": ["P", "V"],
          "question_grid": 2,
          "questions": [
            {
              "type": 'OPTION',
              'question_id': 1,
              "title":
                  "<div style='text-align:center;'><b>Follow - Up Performance</b></div>",
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
            }
          ],
        };
      }),
      {
        'question_type_id': 530949005,
        "type": "INFO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Mobility</b>",
        "description":
            '''<b>Code the patient's usual performance at Follow-up for each activity using the 6-point If activity was not attempted at Follow-up, code the reason.
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
          // null,
          "<i>If SOC/ROC performance is coded 07, 09, 10 or 88 → skip to GG0170M, 1 step (curb)</i>",
          null,
          // null,
          null,
          "<i>If SOC/ROC Performance is coded 07, 09, 10 or 88 → skip to GG0170P, Mobility, Picking up object.</i>",
          "<i>If SOC/ROC Performance is coded 07, 09, 10 or 88→ skip to GG0170P, Picking up object.</i>",
          // null,
          null,
        ];
        return {
          'question_type_id': 530949005 + (index + 1),
          "type": "STATIC",
          "question_type": "COMPREHENSIVE",
          "title": titleList[index],
          "description": descriptionList[index],
          "dynamic_type": false,
          "has_color": true,
          "answer_id": 0,
          if (![0, 6, 8, 9, 10].contains(index)) "flag": ["P", "V"],
          "question_grid": 2,
          "questions": [
            {
              "type": 'OPTION',
              'question_id': 1,
              "title":
                  "<div style='text-align:center;'><b>Follow-Up Performance</b></div>",
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
            }
          ]
        };
      }),
      {
        'question_type_id': 530949017,
        "type": "BUTTON",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Q. Does patient use wheelchair and/or scooter?</b>",
        "dynamic_type": true,
        "options_alignment": "VERTICAL",
        "has_color": true,
        "answer_id": 0,
        "options": [
          {
            "index": 0,
            "label": "<b>0. No</b>",
            "value": "0. No",
            "selected": false,
            "hint": "<i>→  Skip GG0170R</i>"
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
        'question_type_id': 530949018,
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
      }
    ]
  };
  static Map<String, dynamic> fallRiskAssessment = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Fall Risk Assessment",
    "formId": 53,
    "subFormId": 950,
    "questions": [
      {
        'question_type_id': 530950001,
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
        'question_type_id': 530950002,
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
                "popup_code": "TEXTFIELDPOPUP",
              },
            ]
          },
        ]
      },
    ]
  };
  static Map<String, dynamic> medications = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Medications",
    "formId": 53,
    "subFormId": 951,
    'questions': [
      {
        'question_type_id': 530951001,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "title": "<b> Medication Management</b>",
        "description": "Any medication changes since last visit?",
        "dynamic_type": true,
        // "options_alignment": "HORIZONTAL",
        "has_color": true,
        "answer_id": 0,
        "options": List.generate(2, (index) {
          final labelList = [
            "No",
            "Yes (explain)",
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
        'question_type_id': 530951002,
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
    ]
  };

  static Map<String, dynamic> rehospitalizationRisk = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Rehospitalization Risk",
    "formId": 53,
    "subFormId": 952,
    'questions': [
      {
        'question_type_id': 530952001,
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
        'question_type_id': 530952002,
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

  static Map<String, dynamic> objective = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": " Objective",
    "formId": 53,
    "subFormId": 953,
    'questions': [
      {
        "question_type_id": 0530953001,
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
              "group_options": true,
              "options": index == 1 || index == 2
                  ? generateOptions(["<b>Met</b>", "<b>Not Met</b>"])
                  : generateOptions(["<b>Provided</b>", "<b>Not Provided</b>"],
                      textFieldPopup: [0]),
            };
          })
        ]
      },
      {
        'question_type_id': 530953006,
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
    ]
  };

  static Map<String, dynamic> assessmentSummary = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Assessment",
    "formId": 53,
    "subFormId": 954,
    'questions': [
      {
        'question_type_id': 530954001,
        "type": "TEXTAREA",
        "title": "<b>Assessment</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 530954002,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String, dynamic> planOfCare = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Plan Of Care",
    "formId": 53,
    "subFormId": 955,
    'questions': [
      {
        'question_type_id': 530955001,
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
        'question_type_id': 530955002,
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
        'question_type_id': 530955003,
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
        'question_type_id': 530955004,
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
        'question_type_id': 530955005,
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
        'question_type_id': 530955006,
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
        'question_type_id': 530955007,
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
        'question_type_id': 530955008,
        "type": "STATIC",
        "title": "<b>Frequency/Duration</b>",
        "question_type": "NON-COMPREHENSIVE",
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
              "<B>SN</B>",
              "<B>PT</B>",
              "<B>OT</B>",
              "<B>ST</B>",
              "<B>MSW</B>",
              "<B>HHA</B>",
              "<B>RD</B>",
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
                    "label": '<b>Request LVN to follow</b>',
                    "value": 'Request LVN to follow',
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
    ]
  };
  static Map<String, dynamic> carePlanningCoordination = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 2,
    "title": "Care Planning/Coordination",
    "formId": 53,
    "subFormId": 956,
    'questions': [
      {
        'question_type_id': 530956001,
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
        'question_type_id': 530956002,
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
        'question_type_id': 530956003,
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
        'question_type_id': 530956004,
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
        'question_type_id': 530956005,
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
        'question_type_id': 530956006,
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
  static Map<String, dynamic> superVision = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 1,
    "title": "Supervision",
    "formId": 53,
    "subFormId": 957,
    'questions': [
      {
        'question_type_id': 530957001,
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
        'question_type_id': 530957002,
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
              {"index": 0, "value": "COTA", "label": "COTA", "selected": false},
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
  static Map<String, dynamic> diagnosisCodes = {
    "template_name": "OASIS OT Other Follow Up",
    "template_code": "",
    "cols": 1,
    "title": "Diagnosis Codes",
    "formId": 53,
    "subFormId": 958,
    'questions': [
      {
        'question_type_id': 530958001,
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
        'question_type_id': 530958002,
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
