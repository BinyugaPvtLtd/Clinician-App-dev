import '../generate_options.dart';

class FormDataStDischargeNonVisit {
  static Map<int, Map<String,dynamic>> stDischargeNonVisitDrawerItems = {
    2: administrativeInfoForm,
    35: dischargeData,
    4: patientHistory,
    9: pain,
    11: bims,
    12: neurologicalCongnitive,
    13: mood,
    14: behaviorRiskFactor,
    18: gastrointestinalNutritionEndocrine,
    20: ulcersSurgicalWounds,
    22: functionalStatus,
    23: functionalAbilitiesAndGoals,
    24: fallRiskTherapyNeed,
    25: medications,
    27: specialTreatmentProceduresAndPrograms,
    29: interventionsEducationProvided,
    37: emergentCare,
    38: supervision,
    39: dischargeSummary,
    40: summarySentTo,
  };

  static const String _releaseInfoTxt =
      '''I authorize ProHealth Home Care to use and disclose protected health information (PHI) about me for the purposes of treatment, payment, and health care operations. The agency uses an electronic health record and may, either on paper or through a secure web-based portal, release PHI to or receive PHI from physicians, hospitals, other health care providers, family members and others involved in my plan of care, assisted living facilities, third party payers, and regulatory agencies as necessary for my care or to process my claims.''';
  static const String _nonDiscriminationTxt =
      '''ProHealth Home Care does not refuse service to patients or in any other way discriminate against any person on the basis of age, sex, disability, race, color, religion, ancestry, or national origin, in accordance with the Civil Rights Act of 1964, Section 504 of the Rehabilitation Act of 1973, the Age Discrimination Act of 1975, and the Americans with Disabilities Act of 1990.
''';
  static const String _hadOpportunityTxt =
      '''I have had an opportunity to review this document and ask questions to assist me in understanding my rights relative to the protection of my health information. I am satisfied with the explanation provided to me and I am confident that the provider is committed to protecting my health Information.
''';
  static const String _providedOppertunityTxt =
      '''<b>The provider has provided me with an opportunity to review this document and ask questions to assist me in understanding his/her privacy rights, I am satisfied with the explanations provided to me and I am confident that the provider is committed to protecting health information :</b>
''';

  static Map<String,dynamic> dischargeData = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Discharge Data",
    "formId": 17,
    "subFormId": 480,
    "questions": [
      {
        "question_type_id": 170480001, //571042001,
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
          "<b>1 - Hospital</b>",
          "<b>2 - Rehabilitation facility</b>",
          "<b>3 - Nursing home</b>",
          "<b>4 - Hospice</b>",
          "<b>NA - No inpatient facility admission</b>",
        ]),
      },
      {
        "question_type_id": 170480002, //571042002,
        "title":
            "<b>Discharge Disposition:</b> Where is the patient after discharge from your agency? <b>(Choose only one answer.)</b>",
        "code": "M2420",
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "group_options": true,
        "flag": ["P", "O", "V", "!", "CC"],
        "options": generateOptions([
          "01 - Patient remained in the community (without formal assistive services) <i>→Skip A2121 and A2122</i>",
          "02 - Patient remained in the community (with formal assistive services)",
          "03 - Patient transferred to a non-institutional hospice",
          "04 - Unknown because patient moved to a geographic location not served by this agency <i>→Skip A2121 and A2122</i>",
          "UK - Other unknown <i>→Skip A2121 and A2122</i>",
        ]),
      },
      {
        "question_type_id": 170480003, //571042003,
        "title":
            "<b>Provision of Current Reconciled Medication List to Subsequent Provider at Discharge</b>",
        "description":
            "At the time of discharge to another provider, did your agency provide the patient's current reconciled medication list to the subsequent provider?",
        "code": "A2121",
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "group_options": true,
        "flag": ["P"],
        "options": generateOptions([
          "0. <b>No – Current reconciled medication list not provided to the subsequent provider</b> <i>→ Skip A2122, A2123, and A2124</i>",
          "1. <b>Yes – Current reconciled medication list provided to the subsequent provider</b> <i>→ Continue to A2122. Route of Current Reconciled Medication List Transmission to Subsequent Provider. THEN skip A2123 and A2124.</i>"
        ]),
      },
      {
        "question_type_id": 170480004, //571042004,
        "type": "MIX",
        "title":
            "<b>Route of Current Reconciled Medication List Transmission to Subsequent Provider</b> Indicate the route(s) of transmission of the current reconciled medication list to the subsequent provider.",
        "code": "A2122",
        "flag": ["P"],
        "has_color": true,
        "dynamic_type": false,
        "question_type": "NON-COMPREHENSIVE",
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
          {
            "question_id": 2,
            "type": "INFO",
            "description":
                "<i>After completing A2122, Skip A2123 and A2124</i>",
            "options": [],
          }
        ]
      },
      {
        "question_type_id": 170480005, //571042005,
        "title":
            "<b>Provision of Current Reconciled Medication List to Patient at Discharge</b>",
        "description":
            "At the time of discharge, did your agency provide the patient's current reconciled medication list to the patient, family and/or caregiver?",
        "code": "A2123",
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "group_options": true,
        "flag": ["P"],
        "options": generateOptions([
          "0. No – Current reconciled medication list not provided to the patient, family, and/or caregiver <i>→ Skip A2124</i>",
          "<b>1. Yes – Current reconciled medication list provided to the patient, family, and/or caregiver</b><i> → Continue to A2124, Route of Current Reconciled Medication List Transmission to Patient.</i>"
        ]),
      },
      {
        "question_type_id": 170480006, //571042006,
        "title":
            "<b> Route of Current Reconciled Medication List Transmission to Patient</b>",
        "description":
            "Indicate the route(s) of transmission of the current reconciled medication list to the subsequent provider.",
        "type": "MIX",
        "code": "A2124",
        "flag": ["P"],
        "has_color": true,
        "dynamic_type": false,
        "question_type": "NON-COMPREHENSIVE",
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
    ]
  };
  static Map<String,dynamic> administrativeInfoForm = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Administrative Information",
    "formId": 17,
    "subFormId": 479,
    "questions": [
      {
        'question_type_id': 170479001, //571041001,
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
            "description": '059392'
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
            "code": "M0020",
            "question_id": 6,
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
            "question_id": 7,
            "title": "<b>Start of Care Date:</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "description": '',
            "flag": ['*', 'P', '!', 'CC'],
            "options": generateOptions([""]),
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
        "question_type_id": 170479002, //571041002,
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
        "question_type_id": 170479003, //571041003,
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
        "question_type_id": 170479004, //571041004,
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
        "description":
            "<b><u>Discharge from Agency - Not to an Inpatient Facility:</u></b>",
        "options": [
          ...List.generate(
            2,
            (index) {
              var list = [
                '8 - Death at home',
                '9 - Discharge from agency',
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
        "question_type_id": 170479005, //571041005,
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
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 1,
    "title": "Patient History/Immunizations",
    "formId": 17,
    "subFormId": 481,
    "questions": [
      {
        'question_type_id': 170481001, //571043001,
        "type": "CHECKBOX",
        "code": 'A1250',
        "question_type": "COMPREHENSIVE",
        "title": "<b>Transportation (NACHC ©)</b>",
        "description":
            '''Has lack of transportation kept you from medical appointments, meetings, work, or from getting
        things needed for daily living?
       <br> <br><b>↓Check all that apply↓</b>''',
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
        'question_type_id': 170481002, //571043002,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Health Literacy <i>(From Creative Commons ©)</i></b>",
        "description":
            "How often do you need to have someone help you when you read instructions, pamphlets, or other written material from your doctor or pharmacy?",
        "code": "B1300",
        "options_alignment": "VERTICAL",
        "group_options": false,
        "dynamic_type": true,
        "has_color": true,
        "answer_id": 0,
        'question_options': generateOptions([
          "0. <b>Never</b>",
          "1. <b>Rarely</b>",
          "2. <b>Sometimes</b>",
          "3. <b>Often</b>",
          "4. <b>Always</b>",
          "7. <b>Patient declines to respond</b>",
          "8. <b>Patient unable to respond</b>",
        ]),
        "notice":
            "<i>The Single Item Literacy Screener is licensed under a Creative Commons Attribution Noncommercial 4.0 International License.</i>"
      },
      {
        'question_type_id': 170481003, //571043003,
        "type": "BUTTON",
        "question_type": "NON-COMPREHENSIVE",
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
          ''
        ]),
      },
      {
        'question_type_id': 170481004, //571043004,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
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
    ]
  };


  static Map<String,dynamic> pain = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Pain",
    "formId": 17,
    "subFormId": 482,
    "questions": [
      {
        'question_type_id': 170482001, //571045005,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Pain Effect on Sleep</b>",
        "code": "J0510",
        "description":
            '''Ask patient: "<i>Over the past 5 days, <b>how much of the time has pain made it hard for you to sleep at night"</b></i>''',
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
        'question_type_id': 170482002, //571045006,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Pain Interference with Therapy Activities</b>",
        "code": "J0520",
        "description":
            '''Ask patient: "<i>Over the past 5 days, <b>how often have you limited your participation in rehabilitation therapy sessions due to pain?"</b></i>''',
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
        'question_type_id': 170482003, //571045007,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Pain interference with day-to-day activities</b>",
        "code": "J0530",
        "description":
            '''Ask patient: "<i>Over the past 5 days, <b>how often you have limited your day-to-day activities(excluding rehabilitation therapy sessions) because of pain?"</b></i>''',
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
    ]
  };


  static Map<String,dynamic> bims = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 1,
    "title": "BIMS",
    "formId": 17,
    "subFormId": 483,
    "questions": [
      {
        'question_type_id': 170483001, //571047001,
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
        'question_type_id': 170483002, //571047002,
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
        'question_type_id': 170483003, //571047003, //30082003,
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
        'question_type_id': 170483004, //571047004,
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
        'question_type_id': 170483005, //571047005,
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
        'question_type_id': 170483006, //571047006,
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
        'question_type_id': 170483007, //571047007,
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

  static Map<String,dynamic> neurologicalCongnitive = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Neurological/Cognitive",
    "formId": 17,
    "subFormId": 484,
    "questions": [
      {
        'question_type_id': 170484001, //571048001,
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
        'question_type_id': 170484002, //571048002,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>Cognitive Functioning:</b> Patient's current (day of assessment) level of alertness, orientation, comprehension, concentration, and immediate memory for simple commands.",
        "code": "M1700",
        "description": "",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "flag": ['O', 'V'],
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
        'question_type_id': 170484003, //571048005,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>When Confused (Reported or observed within the last 14 days):</b>",
        "code": "M1710",
        "description": "",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "flag": ['O', 'V', '!'],
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
        'question_type_id': 170484004,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title":
            "<b>When Anxious (Reported or observed within the last 14 days):</b>",
        "code": "M1720",
        "description": "",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "flag": ['O', 'V'],
        "answer_id": 0,
        "options": List.generate(
          5,
          (index) {
            var list = [
              '0 - None of the time',
              '1 - Less often than daily',
              '2 - Daily, but not constantly',
              '3 - All of the time',
              'NA - Patient nonresponsive',
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
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 1,
    "title": "Mood",
    "formId": 17,
    "subFormId": 485,
    "questions": [
      {
        'question_type_id': 170485001, //571049001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "description":
            '''<p><b>Say to patient: "<i>Over the last 2 weeks, have you been bothered by any of the following problems?"</i></b></p>
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
        'question_type_id': 170485002, //571049002,
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
        'question_type_id': 170485003, //571049003,
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
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Behavior",
    "formId": 17,
    "subFormId": 486,
    "questions": [
      {
        'question_type_id': 170486001, //571050001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>Cognitive, behavioral, and psychiatric</b> symptoms that are demonstrated <u>at least once a week</u> <b>(Reported or Observed): (Mark all that apply.)</b>",
        "code": "M1740",
        "description": "",
        "group_options": false,
        "dynamic_type": true,
        "has_color": true,
        "flag": ["O","V"],
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
        'question_type_id': 170486002, //571050002,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
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
    ]
  };


  static Map<String,dynamic> gastrointestinalNutritionEndocrine = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Respiratory/GU/GI/Nutrition",
    "formId": 17,
    "subFormId": 487,
    'questions': [
      {
        'question_type_id': 170487001, //561023001,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title":
            "When is the patient dyspneic or noticeably <b>short of breath?</b>",
        "code": "M1400",
        "group_options": true,
        "dynamic_type": true,
        "has_color": false,
        "flag": ["*",'O', 'V', 'CC'],
        "options": List.generate(
          5,
          (index) {
            var list = [
              "0 - Patient is not short of breath",
              "1 - When walking more than 20 feet, climbing stairs",
              "2 - With moderate exertion (for example, while dressing, using commode or bedpan, walking distances less than 20 feet)",
              "3 - With minimal exertion (for example, while eating, talking, or performing other ADLs) or with agitation",
              "4 - At rest (during day or night)",
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
        'question_type_id': 170487002, //561023003,
        "type": "OPTION",
        "question_type": "COMPREHENSIVE",
        "title":
            "Has this patient been treated for a <b>Urinary Tract Infection</b> in the past 14 days?",
        "code": "M1600",
        "group_options": true,
        "dynamic_type": true,
        "has_color": true,
        "flag": ['!'],
        "options": List.generate(
          3,
          (index) {
            var list = [
              "0 - No",
              "1 - Yes",
              "NA - Patient on prophylactic treatment",
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
        'question_type_id': 170487003, //561023004,
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
          7,
          (index) {
            var list = [
              "0 - Very rarely or never has bowel incontinence",
              "1 - Less than once weekly",
              "2 - One to three times weekly",
              "3 - Four to six times weekly",
              "4 - On a daily basis",
              "5 - More often than once daily",
              "NA - Patient has ostomy for bowel elimination",
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
        "question_type_id": 170487004, //140427004,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Nutritional Approaches</b>",
        "code": "K0520",
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "group_options": false,
            "title": "A. <b>Parenteral/IV feeding</b>",
            "options": generateOptions([
              "",
              "",
            ])
          },
          {
            "question_id": 2,
            "type": "STATIC",
            "group_options": false,
            "title":
                "B. <b>Feeding tube</b> (e.g., nasogastric or abdominal (PEG))",
            "options": generateOptions([
              "",
              "",
            ])
          },
          {
            "question_id": 3,
            "type": "STATIC",
            "group_options": false,
            "title":
                "C. <b>Mechanically altered diet</b> – require change in texture of food or liquids (e.g., pureed food, thickened liquids)",
            "options": generateOptions([
              "",
              "",
            ])
          },
          {
            "question_id": 4,
            "type": "STATIC",
            "group_options": false,
            "title":
                "D. <b>Therapeutic diet</b> (e.g., low salt, diabetic, low cholesterol)",
            "options": generateOptions([
              "",
              "",
            ])
          },
          {
            "question_id": 5,
            "type": "STATIC",
            "group_options": false,
            "title": "Z. <b>None of the above</b>",
            "options": generateOptions([
              "",
              "",
            ])
          }
        ],
      },
      {
        'question_type_id': 170487005, //30089009,
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
        "answer_id": 0,
        "flag": ['O', 'V', '!'],
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
              "3 - Able to take in nutrients orally and receives supplemental nutrients through a nasogastric tube or gastrostomy.",
              "4 - <u>Unable</u> to take in nutrients orally and is fed nutrients through a nasogastric tube or gastrostomy.",
              "5 - <u>Unable</u> to take in nutrients orally or by tube feeding."
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

  static Map<String,dynamic> functionalStatus = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Functional Status",
    "formId": 17,
    "subFormId": 488,
    'questions': [
      {
        'question_type_id': 170488001, //571057001,
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
        'question_type_id': 170488002, //571057002,
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
        'question_type_id': 170488003, //571057003,
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
        'question_type_id': 170488004, //571057004,
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
        'question_type_id': 170488005, //571057005,
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
        'question_type_id': 170488006, //571057006,
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
        'question_type_id': 170488007, //571057007,
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
        'question_type_id': 170488008, //571057008,
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
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 1,
    "title": "Functional Abilities and Goals",
    "formId": 17,
    "subFormId": 489,
    'questions': [
      {
        'question_type_id': 170489001,
        "type": "INFO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Self-Care</b>", "question_lookup_enabled":true,
        "description":
            '''<b>Code the patient's usual performance at Discharge for each activity using the 6-point scale. If activity was not attempted at Discharge, code the reason.
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
          'question_type_id': 170489001 + (index + 1),
          //571058001 + (index + 1),
          "type": "STATIC",
          "question_type": "COMPREHENSIVE",
          "title": titleList[index],
          "dynamic_type": false,
          "has_color": true,
          "answer_id": 0,
          "flag": ["P", "V"],
          "questions": List.generate(1, (index) {
            final titleList = ["Discharge Performance"];
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
        'question_type_id': 170489009, //571058009,
        "type": "INFO",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Mobility</b>",
        "description":
            '''<b>Code the patient's usual performance at Discharge for each activity using the 6-point scale. If activity was not attempted at Discharge, code the reason.
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
          'question_type_id': 170489009 + (index + 1),
          //571058009 + (index + 1),
          "type": "STATIC",
          "question_type": "COMPREHENSIVE",
          "title": titleList[index],
          "description": descriptionList[index],
          "dynamic_type": false,
          "has_color": true,
          "answer_id": 0,
          if(![0,6,7,10,11,12,13,14].contains(index))"flag": ["P", "V"],
          "question_grid": 2,
          "questions": List.generate(1, (index) {
            final titleList = ["Discharge Performance"];
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
        'question_type_id': 170489025, //571058025,
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
        'question_type_id': 170489026, //571058026,
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
            final titleList = ["Discharge Performance"];
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
        'question_type_id': 170489027, //571058027,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "<b>S. Wheel 150 feet:</b> Once seated in wheelchair/scooter, the ability to wheel at least 150 feet in a corridor or similar space.",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "flag": ["P", "V"],
        "questions": [
          ...List.generate(1, (index) {
            final titleList = [
              "Discharge Performance",
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
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Assistance/Falls",
    "formId": 17,
    "subFormId": 490,
    "questions": [
      {
        'question_type_id': 170490001, //571059001,
        "type": "STATIC",
        "code": "M2102",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": true,
        "dynamic_type": false,
        "has_color": false,
        "flag": ['!'],
        "title":
            "<b>Types and Sources of Assistance:</b>Determine the ability and willingness of non-agency caregivers (such as family members, friends, or privately paid caregivers) to provide assistance for the following activities, if assistance is needed. Excludes all care by your agency staff.",
        "answer_id": 0,
        "questions": [
          ...List.generate(4, (index) {
            final titleList = [
              "<b>a. ADL assistance</b> (for example, transfer/ ambulation, bathing, dressing, toileting, eating/feeding)",
              "<b>c. Medication administration</b> (for example, oral, inhaled or injectable)",
              "<b>d. Medical procedures/ treatments</b> (for example, changing wound dressing, home exercise program)",
              "<b>f. Supervision and safety</b> (for example, due to cognitive impairment)",
            ];
            return {
              "question_id": index + 1,
              "type": "RADIO",
              "title": titleList[index],
              "options": generateOptions(["0", "1", "2", "3", "4"])
            };
          }),
        ]
      },
      {
        'question_type_id': 170490002, //571059002,
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "code": "J1800",
        "flag": ["O", "CC"],
        "title":
            "<b>Any Falls Since SOC/ROC,</b> whichever is more recent Has the patient <b>had any falls since SOC/ROC,</b>b> whichever is more recent?",
        "answer_id": 0,
        'question_options': generateOptions([
          "O. - <b>No</b> <i>→ Skip J1900</i>",
          "1. - <b>Yes</b> <i>→ Continue to J1900. Number of Falls Since SOC/ROC, whichever is more recent</i>",
          " - - Not assessed / No information",
        ]),
      },
      {
        'question_type_id': 170490003, //571059003,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "code": "J1900",
        "title":
            "<b>Number of Falls Since SOC/ROC,</b>  whichever is more recent",
        "flag":["O","CC"],
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

  //TODO ID NOT FOUND IN API
  static Map<String,dynamic> musculoskeletal = {
    "template_name": "OASIS PT Discharge Musculoskeletal",
    "cols": 2,
    "title": "Musculoskeletal",
    "formId": 56,
    "subFormId": 1026,
    "questions": [
      {
        "question_type_id": 561026001, //571054001,
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
            "title": "<b>Additional impairment tests/ comments: </b>",
            "scroll_axis": "HORIZONTAL",
            "type": "STATIC",
            "options": generateOptions(
              [""], textFieldPopup:[0]
            ),
          }
        ]
      },
      {
        'question_type_id': 561026002, //571054002,
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
        'question_type_id': 561026003,
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
        'question_type_id': 561026004, //571054005,
        "type": "STATIC",
        "has_color": false,
        "question_type": "NON-COMPREHENSIVE",
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
        'question_type_id': 561026005, //571054006,
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
    "template_name": "OASIS ST Discharge Integumentary Status",
    "cols": 2,
    "title": "Integumentary Status",
    "formId": 58,
    "subFormId": 1080,
    'questions': [
      {
        'question_type_id': 581080001, //571052001,
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
        'question_type_id': 581080002, //571052002,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Additional Comments: </b>",
        "dynamic_type": true,
        "options_alignment": "HORIZONTAL",
        "answer_id": 0,
        "options": generateOptions([""]),
      },
      {
        'question_type_id': 581080003, //571052003,
        "type": "RADIO",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Wound(s) identified?</b>",
        "dynamic_type": true,
        "options_alignment": "HORIZONTAL",
        "scroll_axis": "HORIZONTAL",
        "answer_id": 0,
        "options": generateOptions(['No', 'Yes']),
      },
      {
        'question_type_id': 581080004, //571052004,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "options": generateOptions(["No Surgical Wounds"]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title":
                "<b>Surgical Wound</b> (complete for closed surgical wounds only)",
            "options": generateOptions(["Location"], addToValues: false),
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "title": "Incision closed with:",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Staples",
              "Sutures",
              "Steri-strips",
              "Skin/surgical adhesive",
              "Other"
            ]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "Incision size/appearance:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""], addToValues: false),
          },
        ],
      },
    ]
  };

  static Map<String,dynamic> ulcersSurgicalWounds = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Ulcers/Surgical Wounds",
    "formId": 17,
    "subFormId": 491,
    'questions': [
      {
        'question_type_id': 170491001, //571053001,
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
            "hint": "→ Go to M1324",
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
        'question_type_id': 170491002, //571053002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "title":
            "The Oldest Stage 2 Pressure Ulcer that is present at discharge: (Excludes healed Stage 2 Pressure Ulcers)",
        "code": "M1307",
        "has_color": true,
        "flag": ["!", "CC"],
        "answer_id": 0,
        "options_alignment": "HORIZONTAL",
        "questions": [
          {
            "question_id": 1,
            "type": "OPTION",
            "options": generateOptions(
              [
                "1 - Was present at the most recent SOC/ROC assessment",
                "2 - Developed since the most recent SOC/ROC assessment. Record date pressure ulcer first identified: ",
                "NA - No Stage 2 pressure ulcers are present at discharge"
              ],
            ),
          },
          {
            "question_id": 2,
            "type": "DATE",
            "options": generateOptions(
              [""],
            ),
          },
        ]
      },
      {
        'question_type_id': 170491003, //571053003,
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
            "options": generateOptions([
              "<b>Stage 2: </b>Partial thickness loss of dermis presenting as a shallow open ulcer with a red or pink wound bed, without slough. May also present as an intact or open/ruptured blister.",
              "<b>Number of these Stage 2 pressure ulcers that were present at most recent SOC/ROC </b>- Enter how many were noted at the time of most recent SOC/ROC",
              "<b>Stage 3: </b>Full thickness tissue loss. Subcutaneous fat may be visible but bone, tendon, or muscle is not exposed. Slough may be present but does not obscure the depth of tissue loss. May include undermining and tunneling.",
              "<b>Number of these Stage 3 pressure ulcers that were present at most recent SOC/ROC </b>- Enter how many were noted at the time of most recent SOC/ROC",
              "<b>Stage 4: </b>Full thickness tissue loss with exposed bone, tendon, or muscle. Slough or eschar may be present on some parts of the wound bed. Often includes undermining and tunneling.",
              "<b>Number of these Stage 4 pressure ulcers that were present at most recent SOC/ROC </b>- Enter how many were noted at the time of most recent SOC/ROC",
              "<b>Unstageable: Non-removable dressing/device:</b> Known but not stageable due to non-removable dressing/device",
              "<b>Number of these unstageable pressure ulcers/injuries that were present at most recent SOC/ROC </b>- Enter how many were noted at the time of most recent SOC/ROC",
              "<b>Unstageable: Slough and/or eschar: </b>Known but not stageable due to coverage of wound bed by slough and/or eschar",
              "<b>Number of these unstageable pressure ulcers that were present at most recent SOC/ROC </b>- Enter how many were noted at the time of most recent SOC/ROC",
              "<b>Unstageable: Deep tissue injury</b>",
              "<b>Number of these unstageable pressure injuries that were present at most recent SOC/ROC</b><br>Enter how many were noted at the time of most recent SOC/ROC",
            ], addToValues: false)
          }
        ]
      },
      {
        'question_type_id': 170491004, //571053004,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
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
        'question_type_id': 170491005, //571053005,
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
        'question_type_id': 170491006, //571053006,
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
        'question_type_id': 170491007, //571053007,
        "type": "OPTION",
        "question_type": "NON-COMPREHENSIVE",
        "title": "Does this patient have a <b>Surgical Wound?:</b>",
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
        'question_type_id': 170491008, //571053008,
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
    "template_name": "OASIS OT START OF CARE",
    "template_code": "",
    "cols": 2,
    "title": "Prior Level of Function",
    "formId": 3,
    "subFormId": 92,
    'questions': [
      {
        'question_type_id': 30092001,
        "type": "TEXTAREA",
        "title": "<b>PRIOR LEVEL OF FUNCTION</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 30092002,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String,dynamic> medications = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Medications",
    "formId": 17,
    "subFormId": 492,
    'questions': [
      {
        "question_type_id": 170492001, //571060001,
        "type": "OPTION",
        "code": "M2005",
        "question_type": "COMPREHENSIVE",
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
        "question_type_id": 170492002, //571060002,
        "type": "OPTION",
        "code": "M2020",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Management of Oral Medications:</b>",
        "description":
            "<u>Patient's current ability</u> to prepare and take all oral medications reliably and safely, including administration of correct dosage at the appropriate times/intervals.<br><br><b> Excludes injectable and IV medications. (NOTE: This refers to ability, not compliance or willingness.)</b>",
        "dynamic_type": true,
        "flag": ["*", "O", "V", "!", "CC"],
        "answer_id": 0,
        "question_options": generateOptions([
          "0 - Able to independently take the correct oral medications(s) and proper dosage(s) at the correct times.",
          "1 - Able to take medication(s) at the correct times if: <br>(a) individual dosages are prepared in advance by another person; <u>OR</u> <br>(b) another person develops a drug diary or chart.",
          "2 - Able to take medication(s) at the correct times if given reminders by another person at the appropriate times.",
          "3 - <u>Unable</u> to take medication unless administered by another person.",
          "NA  - No oral medications prescribed.",
        ]),
      },
      {
        "question_type_id": 170492003, //571060003,
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
    ]
  };

  static Map<String,dynamic> infusionLabDrawn = {
    "template_name": "OASIS RN START OF CARE",
    "template_code": "",
    "cols": 2,
    "title": "Infusion/Lab Draw",
    "formId": 1,
    "subFormId": 26,
    'questions': [
      {
        'question_type_id': 0010026001,
        "type": "CHECKBOX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": "This page is not applicable",
            "selected": false,
          }
        ]
      },
      {
        'question_type_id': 0010026002,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Lab Draws<b>",
            "options": [
              {
                "index": 0,
                "label": "NA",
                "selected": false,
              }
            ]
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": " Blood draw site:",
            "options": [
              {
                "index": 0,
                "value": "",
                "hint": " ",
              }
            ]
          },
          {
            "question_id": 3,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "title": " Lab drawn:",
            "options": List.generate(4, (index) {
              final list = [
                "CBC",
                "Chem 7",
                "PT/INR",
                "Other",
              ];
              return {
                "index": index,
                "label": list[index],
                "selected": index == 3 ? true : false,
                if (index == 3) "popup_code": "TEXTFIELDPOPUP",
              };
            })
          }
        ]
      },
      {
        'question_type_id': 0010026003,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b> Venous Access Devices<b>",
            "options": [
              {
                "index": 0,
                "label": "NA",
                "selected": false,
              }
            ]
          },
          {
            "question_id": 2,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "Insertion Date:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 3,
            "type": "STATIC",
            "group_options": false,
            "options": List.generate(9, (index) {
              final list = [
                "Peripheral line",
                "Midline catheter",
                "Central line",
                "PICC",
                "Port",
                "Groshong",
                "Non-Groshong",
                "Tunneled",
                "Non-Tunneled",
              ];
              return {
                "index": index,
                "label": list[index],
                "selected": index == 3 ? true : false,
              };
            }),
          },
          {
            "question_id": 4,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Size/gauge/length:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 5,
            "type": "RADIO",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Single lumen",
              "Double lumen",
              "Triple lumen",
            ]),
          },
          {
            "question_id": 6,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "External Cath Length:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 7,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": " Insertion Site:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 8,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Mid arm circumference:",
            "options": [
              {"index": 0, "value": "", "hint": "cm"}
            ]
          },
          {
            "question_id": 9,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Dressing Type:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 10,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "Last performed:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 11,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Performed by:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
        ]
      },
      {
        'question_type_id': 0010026004,
        "type": "MIX",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "scroll_axis": "HORIZONTAL",
            "title": "<b>Infusion Therapy<b>",
            "options": [
              {
                "index": 0,
                "label": "NA",
                "selected": false,
              }
            ]
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "options_alignment": "HORIZONTAL",
            "title": "Type of infusion therapy:",
            "group_options": false,
            "options": generateOptions([
              "Antibiotics",
              "Pain Control",
              "Other",
            ], textFieldPopup: [
              2
            ]),
          },
          {
            "question_id": 3,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Cap change frequency:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 4,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "Last performed:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 5,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Performed by:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 6,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Catheter flush frequency:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 7,
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "title": "Last performed:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 8,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Performed by:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 9,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Tubing change details:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 10,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Infusion/therapy administered this visit:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
          {
            "question_id": 11,
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "title": "Administration/Pump details:",
            "options": [
              {"index": 0, "value": "", "hint": " "}
            ]
          },
        ]
      },
      {
        'question_type_id': 0010026005,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "title": "<b>Additional Comments:</b>",
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": "",
            "value": "",
          }
        ]
      },
    ]
  };
  static Map<String,dynamic> specialTreatmentProceduresAndPrograms = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 1,
    "title": "Special Treatment, Procedures, And Programs",
    "formId": 17,
    "subFormId": 493,
    'questions': [
      {
        'question_type_id': 170493001, //571061001,
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

  static Map<String,dynamic> emergentCare = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Emergent Care",
    "formId": 17,
    "subFormId": 494,
    "questions": [
      {
        "question_type_id": 170494001, //571062001,
        "title": "<b>Emergent Care: </b>",
        "description":
            "At the time of or at any time since the most recent SOC/ROC assessment has the patient utilized a hospital emergency department (includes holding/ observation status)?",
        "code": "M2301",
        "type": "RADIO",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "has_color": true,
        "group_options": false,
        "flag": ["!", "CC"],
        "options": generateOptions([
          "0 - No → Skip M2310",
          "1 - Yes, used hospital emergency department WITHOUT hospital admission",
          "2 - Yes, used hospital emergency department WITH hospital admission",
          "UK - Unknown → Skip M2310",
        ]),
      },
      {
        "question_type_id": 170494002, //571062002,
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

  static Map<String,dynamic> rehospitalizationRisk = {
    "template_name": "OASIS OT Start Of Care Rehospitalization Risk",
    "cols": 2,
    "title": "Rehospitalization Risk",
    "formId": 3,
    "subFormId": 101,
    'questions': [
      {
        'question_type_id': 030101001, //0010028001,
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
        'question_type_id': 030101002, //0010028002,
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

  static Map<String,dynamic> interventionsEducationProvided = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": " Interventions/Education Provided",
    "formId": 17,
    "subFormId": 495,
    'questions': [
      {
        "question_type_id": 170495001, //571063001,
        "title": "<b>Intervention Synopsis</b>",
        "description":
            "At the time of or at any time since the most recent SOC/ROC assessment, were the following interventions BOTH included in the physician-ordered plan of care AND implemented? (Mark only one box in each row.)",
        "code": "M2401",
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
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
    ]
  };

  static Map<String,dynamic> assessmentSummary = {
    "template_name": "OASIS ST Discharge Assessment",
    "cols": 2,
    "title": "Assessment",
    "formId": 58,
    "subFormId": 1090,
    'questions': [
      {
        'question_type_id': 581090001, //571064002,
        "type": "TEXTAREA",
        "title": "<b>Assessment</b>",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(['']),
      },
      {
        'question_type_id': 581090002, //571064003,
        "type": "INFO",
        "title": "",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };

  static Map<String,dynamic> planOfCare = {
    "template_name": "OASIS OT Start Of Care Plan Of Care  ",
    "cols": 2,
    "title": "Plan Of Care",
    "formId": 3,
    "subFormId": 104,
    'questions': [
      {
        'question_type_id': 030104001, //0010032001,
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
        'question_type_id': 030104002, //0010032002,
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
        'question_type_id': 030104003, //0010032003,
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
        'question_type_id': 030104004, //0010032004,
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
        'question_type_id': 030104005, //0010032005,
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
        'question_type_id': 030104006, //0010032006,
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
        'question_type_id': 030104007, //0010032007,
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
        'question_type_id': 030104008, //0010032008,
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
                "label": "SN",
                "value": "SN",
                "selected": false,
              },
              {
                "index": 1,
                "label": "2x4",
                "value": "",
                "selected": false,
              },
              {
                "index": 2,
                "label": "1x4",
                "value": "",
                "selected": false,
              },
              {
                "index": 3,
                "label": "Request LVN to follow",
                "value": "Request LVN to follow",
                "selected": false,
              },
            ]
          },
          ...List.generate(6, (index) {
            final list = [
              "PT",
              "OT",
              "ST",
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
                  "value": list[index],
                  "selected": false,
                },
                {
                  "index": 1,
                  "label": "2x4",
                  "value": "",
                  "selected": false,
                },
                {
                  "index": 2,
                  "label": "1x4",
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
  static Map<String,dynamic> supplies = {
    "template_name": "OASIS RN START OF CARE",
    "template_code": "",
    "cols": 2,
    "title": "Supplies",
    "formId": 1,
    "subFormId": 31,
    'questions': [
      {
        'question_type_id': 0010031001,
        "type": "TEXTFIELD",
        "question_type": "COMPREHENSIVE",
        "dynamic_type": true,
        "title": "<b>Supplies Issued/Used this visit:</b>",
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": "",
            "value": "",
          }
        ],
      },
      {
        'question_type_id': 0010031002,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "code": "Supplies",
        "answer_id": 0,
        "question_options": [],
      },
      {
        'question_type_id': 0010031003,
        "type": "ACTIONBUTTON",
        "question_type": "NON-COMPREHENSIVE",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": [
          {
            "index": 0,
            "label": "Order Supplies",
            "value": "",
          }
        ],
      },
    ]
  };

  static Map<String,dynamic> carePlanningCoordination = {
    "template_name": "OASIS OT Start Of Care Plan/Care Coordination",
    "cols": 2,
    "title": "Plan/Care Coordination",
    "formId": 3,
    "subFormId": 105,
    'questions': [
      {
        'question_type_id': 030105001, //0010033001,
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
        'question_type_id': 030105002, //0010033002,
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
        'question_type_id': 030105003, //0010033003,
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
        'question_type_id': 030105004, //0010033004,
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
        'question_type_id': 030105005, //0010033005,
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
        'question_type_id': 030105006, //0010033006,
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
    "template_name": "OASIS OT Start Of Care Diagnosis Codes ",
    "cols": 1,
    "title": "Diagnosis Codes",
    "formId": 3,
    "subFormId": 106,
    'questions': [
      {
        'question_type_id': 030106001, //0010034001,
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
        'question_type_id': 030106002, //0010034002,
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

  static Map<String,dynamic> dischargeSummary = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Discharge Summary",
    "formId": 17,
    "subFormId": 497,
    'questions': [
      {
        "question_type_id": 170497001, //571066001,
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
        "question_type_id": 170497002, //571066002,
        "dynamic_type": true,
        "type": "TEXTFIELD",
        "title": "<b>Reason for admission to home health/diagnosis</b>",
        "has_color": false,
        "question_type": "COMPREHENSIVE",
        "question_options": generateOptions([""]),
      },
      {
        "question_type_id": 170497003, //571066003,
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
        "question_type_id": 170497004, //571066004,
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
        "question_type_id": 170497005, //571066005,
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
        "question_type_id": 170497006, //571066002,
        "dynamic_type": true,
        "type": "TEXTFIELD",
        "title": "<b>Reason for discharge without a visit:</b>",
        "has_color": false,
        "scroll_axis": "HORIZONTAL",
        "question_type": "NON-COMPREHENSIVE",
        "question_options": generateOptions([""]),
      },
      {
        'question_type_id': 170497007, //571066007,
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
        'question_type_id': 170497008, //571066008,
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
        'question_type_id': 170497009, //571066009,
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
        "question_type_id": 170497010, //571066010,
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
        'question_type_id': 170497011, //571066011,
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
        "question_type_id": 170497012, //571066012,
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
        "question_type_id": 170497013, //571066013,
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
            "options": generateOptions([""])
          },
        ],
      },
    ]
  };

  static Map<String,dynamic> summarySentTo = {
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 2,
    "title": "Summary Sent To",
    "formId": 17,
    "subFormId": 498,
    'questions': [
      {
        "question_type_id": 170498001, //571067001,
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
        "question_type_id": 170498002, //571067002,
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
        "question_type_id": 170498003, //571067003,
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

  static Map<String,dynamic> functionalAssessment = {
    "template_name": "OASIS ST Discharge Functional Assessment",
    "template_code": "",
    "cols": 1,
    "title": "Functional Assessment",
    "formId": 58,
    "subFormId": 1082,
    'questions': [
      {
        "question_type_id": 581082001, //0040129001,
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
        "question_type_id": 581082002, //0040129002,
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
        "question_type_id": 581082003, //0040129002,
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
        "question_type_id": 581082004, //0040129004,
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
        "question_type_id": 581082005, //0040129005,
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
        "question_type_id": 581082006, //0040129006,
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
        "question_type_id": 581082007, //0040129007,
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
        "question_type_id": 581082008, //0040129008,
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
        "question_type_id": 581082009, //0040129009,
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
        "question_type_id": 581082010, //0040129010,
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
        "question_type_id": 581082011, //0040129011,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Comments</b>",
        "dynamic_type": true,
        "question_options": generateOptions([""]),
      },
    ]
  };

  static Map<String,dynamic> testsScales = {
    "template_name": "OASIS PT Discharge Tests/Scales",
    "cols": 1,
    "title": "Tests/Scales",
    "formId": 56,
    "subFormId": 1028,
    'questions': [
      {
        "question_type_id": 561028001, //0020059001,
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
    "template_name": "OASIS ST Discharge (Non-Visit)",
    "template_code": "",
    "cols": 1,
    "title": "Supervision",
    "formId": 17,
    "subFormId": 496,
    'questions': [
      {
        "question_type_id": 170496001, //571065001,
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
        "question_type_id": 170496002, //571065002,
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

  static Map<String,dynamic> objective = {
    "template_name": "OASIS ST Discharge Objective",
    "cols": 2,
    "title": "Objective",
    "formId": 58,
    "subFormId": 1089,
    'questions': [
      {
        "question_type_id": 581089001, //571063001,
        "title": "<b>Intervention Synopsis</b>",
        "description":
            "At the time of or at any time since the most recent SOC/ROC assessment, were the following interventions BOTH included in the physician-ordered plan of care AND implemented? (Mark only one box in each row.)",
        "code": "M2401",
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
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
        "question_type_id": 581089002, //571063002,
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
    ]
  };
}
