import '../generate_options.dart';

class FormDataSTTransferDeath {
  static Map<int, Map<String,dynamic>> stTransferDeathDrawerItems = {
    2: administrativeInfoForm,
    4: patientHistory,
    25: medications,
    35: dischargeData,
    39: dischargeSummary,
    40: summarySentTo,
  };

  static Map<String,dynamic> administrativeInfoForm = {
    "template_name": "OASIS Transfer/Death",
    "template_code": "",
    "cols": 2,
    "title": "Administrative Information",
    "formId": 5,
    "subFormId": 141,
    "questions": [
      {
        'question_type_id': 50141001, //0040108001,
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
            "type": "TEXTFIELD",
            "question_id": 1,
            "title": "<b>Patient Name:</b>",
            "options_alignment": "HORIZONTAL",
            "description": '',
            "options": [
              {"index": 0, "label": "First", "value": "", "selected": false},
              {"index": 1, "label": "Last", "value": "", "selected": false},
            ]
          },
          {
            "type": "TEXTFIELD",
            "question_id": 2,
            "title": "<b>MR Number:</b>",
            "options_alignment": "VERTICAL",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {"index": 0, "label": "", "value": "", "selected": false},
            ]
          },
          {
            "type": "DATE",
            "question_id": 3,
            "title": "<b>DOB:</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "VERTICAL",
            "options": [
              {"index": 0, "label": "", "value": "", "selected": false},
            ]
          },
          {
            "type": "TEXTFIELD",
            "question_id": 4,
            "title": "<b>Location Name:</b>",
            "options_alignment": "VERTICAL",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {"index": 0, "label": "", "value": "", "selected": false},
            ]
          },
          {
            "type": "TEXTFIELD",
            "question_id": 5,
            "title": "<b>Location Phone:</b>",
            "options_alignment": "VERTICAL",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {
                "index": 0,
                "label": "",
                "value": "",
                "selected": false,
              },
            ]
          },
          {
            "type": "STATIC",
            "question_id": 6,
            "title": "<b>Start of Care Date:</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "description": '',
            "options": generateOptions([""]),
          },
          {
            "type": "DATE",
            "question_id": 7,
            "title": "<b>Certification Period:</b>",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": [
              {"index": 0, "label": "From:", "value": "", "selected": false},
              {"index": 0, "label": "To:", "value": "", "selected": false},
            ]
          },
        ]
      },
      {
        'question_type_id': 50141002, //40108001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title": "",
        "description": "",
        "options_alignment": "HORIZONTAL",
        "group_options": false,
        "dynamic_type": false,
        "answer_id": 1,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "code": "M0064",
            "title": "<b>Social Security Number:</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "VERTICAL",
            "description": '',
            "group_options": true,
            "options":
                generateOptions(["", "<b>UK - Unknown or Not Available</b>"]),
          },
        ]
      },
      {
        'question_type_id': 50141003, //40108001,
        "type": "RADIO",
        "code": "M0080",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Discipline of Person Completing Assessment:</b>",
        "options_alignment": "HORIZONTAL",
        "group_options": false,
        "dynamic_type": true,
        "answer_id": 1,
        "options": generateOptions(
          ['1-<b>RN</b>', '2-<b>PT</b>', '3-<b>SLP/ST</b>', '4-<b>OT</b>'],
        )
      },
      {
        "question_type_id": 50141004,
        "type": "DATE",
        "code": "M0090",
        "title": "<b>Date Assessment Completed:</b>",
        "scroll_axis": "HORIZONTAL",
        "options_alignment": "VERTICAL",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": true,
        "options": [
          {"index": 0, "label": "", "value": "", "selected": false},
        ]
      },
      {
        "question_type_id": 50141005, //0040108002,
        "title":
            "<b>This Assessment is Currently Being Completed for the Following Reason:<br><u>Transfer to an Inpatient Facility:</b></u>",
        "code": 'M0100',
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "flag": ['*', 'P', 'O', 'V', '!', 'CC'],
        "dynamic_type": true,
        "has_color": false,
        "options": [
          ...List.generate(
            3,
            (index) {
              var list = [
                '6 - Transferred to an inpatient facility - patient not discharged from agency',
                '7 - Transferred to an inpatient facility - patient discharged from agency',
                '8 - Death at home',
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
        "question_type_id": 50141006, //0040108006,
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

  static Map<String,dynamic> patientHistory = {
    "template_name": "OASIS Transfer/Death",
    "template_code": "",
    "cols": 2,
    "title": "Patient History And Diagnosis",
    "formId": 5,
    "subFormId": 142,
    "questions": [
      {
        'question_type_id': 50142001, //571043003,
        "type": "BUTTON",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Influenza Vaccine Data Collection Period:</b> Does this episode of care (SOC/ROC to Transfer/Discharge) include any dates on or between October 1 and March 31?",
        "code": "M1041",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "flag": ["P", "CC"],
        "options_alignment": "VERTICAL",
        "options": generateOptions([
          "<b>0 - No</b>",
          "<b>1 - Yes</b>",
        ], hints: [
          '→ Skip M1046',
          '0 - No [Skip M1046]'
        ]),
      },
      {
        'question_type_id': 50142002, //571043004,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Influenza Vaccine Received:</b> Did the patient receive the influenza vaccine for this year's flu season?",
        "code": "M1046",
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        "flag": ["P", "CC"],
        "options_alignment": "VERTICAL",
        "options": generateOptions(
          [
            "1 - Yes; received from your agency during this episode of care (SOC/ ROC to Transfer/ Discharge)",
            "2 - Yes; received from your agency during a prior episode of care (SOC/ ROC to Transfer/ Discharge)",
            "3 - Yes; received from another health care provider (for example, physician, pharmacist)",
            "4 - No; patient offered and declined",
            "5 - No; patient assessed and determined to have medical contraindication(s)",
            "6 - No; not indicated - patient does not meet age/condition guidelines for influenza vaccine",
            "7 - No; inability to obtain vaccine due to declared shortage",
            "8 - No; patient did not receive the vaccine due to reasons other than those listed in responses 4 - 7",
          ],
        ),
      },
      {
        'question_type_id': 50142003,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Influenza Vaccination Comments:</b>",
        "dynamic_type": true,
        "answer_id": 0,
        "options_alignment": "VERTICAL",
        "options": generateOptions(
          [""],
        ),
      },
      {
        'question_type_id': 50142004, //571059002,
        "type": "BUTTON",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "code": "J1800",
        "flag": ["O", "CC"],
        "title":
            "<b>Any Falls Since SOC/ROC,</b> whichever is more recent Has the patient <b>had any falls since SOC/ROC,</b>b> whichever is more recent?",
        "answer_id": 0,
        'question_options': generateOptions([
          "O. - <b>No</b>",
          "1. - <b>Yes</b>",
          " - - Not assessed / No information",
        ], hints: [
          "<i>→ Skip J1900</i>",
          " <i>→ Continue to J1900. Number of Falls Since SOC/ROC, whichever is more recent</i>",
          " "
        ]),
      },
      {
        'question_type_id': 50142005, //571059003,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "code": "J1900",
        "flag":["O","CC"],
        "title":
            "<b>Number of Falls Since SOC/ROC,</b>  whichever is more recent",
        "answer_id": 4,
        'questions': List.generate(3, (index) {
          final titleList = [
            "<b>A. No Injury:</b> No evidence of any injury is noted on physical assessment by the nurse or primary care clinician; no complaints of pain or injury by the patient; no change in the patient's behavior is noted after the fall",
            "<b>B. Injury (except major):</b> Skin tears, abrasions, lacerations, superficial bruises, hematomas and sprains; or any fall-related injury that causes the patient to complain of pain",
            "<b>C. Major Injury:</b> Bone fractures, joint dislocations, closed head injuries with altered consciousness, subdural hematoma"
          ];
          return {
            "question_id": index + 1,
            "type": "DROPDOWN",
            "title": titleList[index],
            "options": generateOptions([
              "0 - None",
              "1 - One ",
              "2 - Two or more",
              "- - Not assessed/ No information",
            ]),
          };
        }),
      },
    ]
  };

  static Map<String,dynamic> medications = {
    "template_name": "OASIS Transfer/Death",
    "template_code": "",
    "cols": 2,
    "title": "Medications and Emergent Care",
    "formId": 5,
    "subFormId": 143,
    'questions': [
      {
        "question_type_id": 50143001, //571042003,
        "title":
            "<b>(A2120) Provision of Current Reconciled Medication List to Subsequent Provider at Transfer</b>",
        "description":
            "At the time of transfer to another provider, did your agency provide the patient’s current reconciled medication list to the subsequent provider?",
        "code": "A2120",
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "group_options": true,
        "flag": ["P"],
        "options": generateOptions([
          "0. No – Current reconciled medication list not provided to the subsequent provider<i> → Skip A2122</i>",
          "1. Yes – Current reconciled medication list provided to the subsequent provider<i> → Continue to A2122, Route of Current Reconciled Medication List Transmission to Subsequent Provider</i>",
          "2. NA – The agency was not made aware of this transfer timely<i> → Skip A2122</i>",
        ]),
      },
      {
        "question_type_id": 50143002, //571042004,
        "type": "MIX",
        "title":
            "<b>Route of Current Reconciled Medication List Transmission to Subsequent Provider</b> Indicate the route(s) of transmission of the current reconciled medication list to the subsequent provider.",
        "code": "A2122",
        "flag": ["P"],
        "has_color": true,
        "dynamic_type": false,
        "question_type": "COMPREHENSIVE",
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options": generateOptions([
              "<b>A. Electronic Health Record</b>",
              "<b>B. Health Information Exchange</b>",
              "<b>C. Verbal</b> (e.g., in-person, telephone, video conferencing)",
              "<b>D. Paper-based</b> (e.g., fax, copies, printouts)",
              "<b>E. Other Methods</b> (e.g., texting, email, CDs)",
            ]),
          },
        ]
      },
      {
        "question_type_id": 50143003, //571060001,
        "type": "RADIO",
        "code": "M2005",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Medication Intervention</b>",
        "description":
            "Did the agency contact and complete physician (or physician-designee) prescribed/recommended actions by midnight of the next calendar day each time potential clinically significant medication issues were identified since the SOC/ROC?",
        "dynamic_type": true,
        "has_color": true,
        "flag": ["P", "CC"],
        "answer_id": 0,
        "question_options": generateOptions([
          "0 - No",
          "1 - Yes",
          "9 - There were no potential clinically significant medication issues identified since SOC/ROC or patient is not taking any medications",
          "NA - Not Available/Not Assessed",
        ]),
      },
      {
        "question_type_id": 50143004, //571062001,
        "title": "<b>Emergent Care: </b>",
        "description":
            "At the time of or at any time since the most recent SOC/ROC assessment has the patient utilized a hospital emergency department (includes holding/ observation status)?",
        "code": "M2301",
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "group_options": false,
        "flag": ["!", "CC"],
        "options": generateOptions([
          "0 - No → <i>Skip M2310</i>",
          "1 - Yes, used hospital emergency department WITHOUT hospital admission",
          "2 - Yes, used hospital emergency department WITH hospital admission",
          "UK - Unknown → <i>Skip M2310</i>",
        ]),
      },
      {
        "question_type_id": 50143005, //571062002,
        "title": "<b>Reason for Emergent Care: </b>",
        "description":
            "For what reason(s) did the patient seek and/or receive emergent care (with or without hospitalization)? <b>(Mark all that apply.)</b>",
        "code": "M2310",
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "group_options": true,
        "flag": ["!", "CC"],
        "options": generateOptions(
          [
            "1 - Improper medication administration, adverse drug reactions, medication side effects, toxicity, anaphylaxis",
            "10 - Hypo/Hyperglycemia, diabetes out of control",
            "19 - Other than above reasons",
            "UK - Reason unknown",
          ],
        ),
      },
    ]
  };

  static Map<String,dynamic> dischargeData = {
    "template_name": "OASIS Transfer/Death",
    "template_code": "",
    "cols": 2,
    "title": "Transfer/Discharge Data Items",
    "formId": 5,
    "subFormId": 144,
    "questions": [
      {
        "question_type_id": 50144001, //571063001,
        "title": "<b>Intervention Synopsis</b>",
        "description":
            "At the time of or at any time since the most recent SOC/ROC assessment, were the following interventions BOTH included in the physician-ordered plan of care AND implemented? (Mark only one box in each row.)",
        "code": "M2401",
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "has_color": true,
        "questions": [
          {
            'question_id': 1,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "b. Falls prevention interventions",
            "notice":
                "Every standardized, validated multi-factor fall risk assessment conducted at or since the most recent SOC/ROC assessment indicates the patient has no risk for falls.",
            "options": generateOptions(['0', '1', 'NA']),
          },
          {
            'question_id': 2,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title":
                "c. Depression intervention(s) such as medication, referral for other treatment, or a monitoring plan for current treatment",
            "notice":
                "Patient has no diagnosis of depression AND every standardized, validated depression screening conducted at or since the most recent SOC/ROC assessment indicates the patient has: 1) no symptoms of depression; or 2) has some symptoms of depression but does not meet criteria for further evaluation of depression based on screening tool used.",
            "options": generateOptions(['0', '1', 'NA']),
          },
          {
            'question_id': 3,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "d. Intervention(s) to monitor and mitigate pain",
            "notice":
                "Every standardized, validated pain assessment conducted at or since the most recent SOC/ROC assessment indicates the patient has no pain.",
            "options": generateOptions(['0', '1', 'NA']),
          },
          {
            'question_id': 4,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "e. Intervention(s) to prevent pressure ulcers",
            "notice":
                "Every standardized, validated pressure ulcer risk assessment conducted at or since the most recent SOC/ROC assessment indicates the patient is not at risk of developing pressure ulcers.",
            "options": generateOptions(['0', '1', 'NA']),
          },
          {
            'question_id': 5,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title":
                "f. Pressure ulcer treatment based on principles of moist wound healing",
            "notice":
                "Patient has no pressure ulcers OR has no pressure ulcers for which moist wound healing is indicated.",
            "options": generateOptions(['0', '1', 'NA']),
          },
        ]
      },
      {
        "question_type_id": 50144002, //571042001,
        "title":
            "To which <b>Inpatient Facility</b> has the patient been admitted?",
        "code": "M2410",
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "group_options": true,
        "flag": ["O", "CC"],
        "options": generateOptions([
          "1 - Hospital",
          "2 - Rehabilitation facility",
          "3 - Nursing home",
          "4 - Hospice",
          "NA - No inpatient facility admission",
        ]),
      },
      {
        "question_type_id": 50144003, //571042001,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "questions": [
          {
            "type": 'RADIO',
            "question_id": 1,
            "title":
                "If the patient was transferred to an inpatient facility indicate if the transfer was for a scheduled treatment or procedure:",
            "options": generateOptions(
              [
                "Yes, transfer was for scheduled treatment or procedure",
                "No, transfer was unscheduled",
              ],
            ),
          },
          {
            "type": 'TEXTFIELD',
            "question_id": 2,
            "title": "Reason for transfer:",
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

  static Map<String,dynamic> dischargeSummary = {
    "template_name": "OASIS Transfer/Death",
    "template_code": "",
    "cols": 2,
    "title": "Discharge Summary",
    "formId": 5,
    "subFormId": 145,
    'questions': [
      {
        "question_type_id": 50145001, //571066001,
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
        "question_type_id": 50145002, //571066002,
        "dynamic_type": false,
        "type": "TEXTFIELD",
        "title": "<b>Reason for admission to home health/diagnosis</b>",
        "has_color": false,
        "question_type": "COMPREHENSIVE",
        "questions":[
          {
            "question_id":1,
            "type":"TEXTFIELD",
            "options":generateOptions([""],textFieldPopup: [0]),
          }
        ],
      },
      {
        "question_type_id": 50145003, //571066004,
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
              ['Physical Therapy', 'Frequency :  '],
            ),
          },
          {
            'question_id': 3,
            "type": "MIX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              ['Occupational Therapy', 'Frequency :  '],
            ),
          },
          {
            'question_id': 4,
            "type": "MIX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              ['Speech Therapy', 'Frequency :  '],
            ),
          },
          {
            'question_id': 5,
            "type": "MIX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              ['Medical Social Services', 'Frequency :  '],
            ),
          },
          {
            'question_id': 6,
            "type": "MIX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              ['Home Health Aide', 'Frequency :  '],
            ),
          },
          {
            'question_id': 7,
            "type": "MIX",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              ['Dietician', 'Frequency :  '],
            ),
          },
          {
            'question_id': 8,
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
        "question_type_id": 50145004, //571066003,
        "dynamic_type": true,
        "type": "DATE",
        "code": "M0906",
        "title":
            "<b>Discharge/Transfer/Death Date: </b> Enter the date of the discharge, transfer, or death (at home) of the patient.",
        "has_color": false,
        "flag": ['P', '!'],
        "question_type": "COMPREHENSIVE",
        "question_options": generateOptions([""]),
      },
      {
        'question_type_id': 50145005, //571066007,
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
        "question_type_id": 50145006, //571066010,
        "dynamic_type": true,
        "type": "CHECKBOX",
        "title": "<b>MENTAL STATUS</b>",
        "options_alignment": "HORIZONTAL",
        "has_color": true,
        "question_type": "NON-COMPREHENSIVE",
        "question_options": generateOptions([
          "Oriented:",
          "Person",
          "Place",
          "Time",
          "Situation",
          "Alert",
          "Forgetful",
          "Confused",
          "Lethargic",
          "Disoriented",
          "Depressed",
          "Agitated",
          "Change in Cognition",
          "Other",
        ],textFieldPopup: [13]),
      },
      {
        "question_type_id": 50145007, //571066010,
        "dynamic_type": false,
        "type": "MIX",
        "has_color": true,
        "question_type": "NON-COMPREHENSIVE",
        "questions": [
          {
            'question_id': 1,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "title": "<b>Functional Ability </b>",
            "options": generateOptions(
              ["Independent", "Partially Dependent", "Totally Dependent"],
            ),
          },
          {
            'question_id': 2,
            "type": "TEXTFIELD",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Comments:",
            "options": generateOptions(
              [""],textFieldPopup: [0]
            ),
          },
        ]
      },
      {
        'question_type_id': 50145008, //571066008,
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
        'question_type_id': 50145009, //571066011,
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
        "question_type_id": 50145010, //571066012,
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
              textFieldPopup: [1],
            ),
          },
          {
            'question_id': 2,
            "type": "TEXTFIELD",
            "options_alignment": "HORIZONTAL",
            "scroll_axis": "HORIZONTAL",
            "title": "Instructions provided:",
            "options": generateOptions(
              [""],textFieldPopup: [0]
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
        "question_type_id": 50145011, //571066013,
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
              'other',
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
            "options": generateOptions([""],textFieldPopup: [0])
          },
        ],
      },
    ]
  };

  static Map<String,dynamic> summarySentTo = {
    "template_name": "OASIS Transfer/Death",
    "template_code": "",
    "cols": 2,
    "title": "Summary Sent To",
    "formId": 5,
    "subFormId": 146,
    'questions': [
      {
        "question_type_id": 50146001, //571067001,
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
        "question_type_id": 50146002, //571067002,
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
        "question_type_id": 50146003, //571067003,
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
}
