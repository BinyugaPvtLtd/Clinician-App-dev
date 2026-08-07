import '../../generate_options.dart';

class FormDataMedicationProfile {
  static Map<int, Map<String, dynamic>> drawerItems = {
    76: medicationProfile,
  };

  static Map<String, dynamic> medicationProfile = {
    "template_name": "Medication Profile",
    "cols": 2,
    "title": "Medication Profile",
    "formId": 74,
    "subFormId": 1137,
    "questions": [
      {
        'question_type_id': 0741137001,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "title": "Patient Name:",
            "type": "TEXTFIELD",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(["Last:", "First:"],
                addToValues: false),
          },
          ...List.generate(2, (index) {
            final titleList = [
              "SOC:",
              "DOB:",
            ];
            return {
              "question_id": index + 2,
              "title": titleList[index],
              "type": "DATE",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([""]),
            };
          }),
          {
            "question_id": 4,
            "title": 'Certification Period From:',
            "type": "DATE",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(["", ""]),
          },{
            "question_id": 5,
            "title": 'Physician Name:',
            "type": "DROPDOWN",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""]),
          },
          ...List.generate(2, (index) {
            final titleList = [
              "Physician Phone:",
              "Physician Fax:",
            ];
            return {
              "question_id": index + 6,
              "title": titleList[index],
              "type": "TEXTFIELD",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([""], addToValues: false),
            };
          })
        ],
      },
      {
        'question_type_id': 0741137002,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "scroll_axis": "HORIZONTAL",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "options":
                generateOptions(['Height:', 'Weight:'], addToValues: false),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "DX:",
            "scroll_axis":"HORIZONTAL",
            "options": generateOptions(['']),
          }
        ],
      },
      {
        'question_type_id': 0741137003,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "draw_box": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "DROPDOWN",
            "title": "Pharmacy Name:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions(
              [""],

            ),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title": "Pharmacy Phone:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""],  ),
          },
          {
            "question_id": 3,
            "type": "TEXTFIELD",
            "title": "Pharmacy Address:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""], ),
          },
          {
            "question_id": 4,
            "type": "TEXTFIELD",
            "title": "Pharmacy Fax:",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([""], ),
          },
          {
            "question_id": 5,
            "type": "TEXTFIELD",
            "options": generateOptions(["", "", ""],),
          },
        ],
      },
      {
        'question_type_id': 0741137004,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "title":
            "<b>List all medications and treatments (include over-the-counter medications, herbal, and other alternative treatments).</b>",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "MIX",
            "options": generateOptions([
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
            ])
          }
        ],
      },
      {
        'question_type_id': 0741137005,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "draw_box": false,
        "title": "<b>Code:</b>",
        "notice": '''
        <br><br><b>New</b> = New medication orders within the last 30 days.
        <br><br><b>OTC</b> = <u>Over the counter</u> medication taken by patient.
        <br><br><b>Change</b> = Change orders either in dose, frequency or route Within the last 60 days.
        <br><br><b>RX</b> = <u>Prescription</u>
        <br><br><b>LS</b> = <u>Long standing</u> (60-Days or more)
        <br><br><b>Existing</b> = <u>Existing Medications</u> patient was taking at the time of admission.
        <br><br><b>Hold</b> = <u>Hold</u>
        ''',
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Reviewed With:</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Patient",
              "Caregiver",
            ])
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "options": generateOptions([
              "Prescription refill information.",
              "Disposal of unused and expired medications.",
              "Actions to take when doses are missed.",
              "Avoidance of contamination.",
              "Refer to Clinical Notes for name of medication (s) taught.",
            ])
          }
        ],
      },
      {
        'question_type_id': 0741137006,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "title": "<b style='text-align:center;'>Drug Regimen Review:</b>",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "DATE",
            "options": generateOptions([
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
            ])
          },
          {
            "question_id": 2,
            "type": "INFO",
            "options": generateOptions([
              "1. Potential drug reactions or adverse effects",
              "2. Potential or actual ineffective drug therapy",
              "3. Significant side effects",
              "4. Significant drug interactions",
              "5. Duplicate drug therapy",
              "6. Patient shows potential noncompliance with medications",
              "7. Patient/caregiver understands medications instructions",
              "8. Patient/caregiver requires further instruction on medications",
            ])
          },
          ...List.generate(72, (index) {
            return {
              "question_id": 3 + index,
              "type": "RADIO",
              "options": generateOptions([
                "Yes",
                "No",
              ])
            };
          })
        ],
      },
      {
        'question_type_id': 0741137007,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "title": "<b style='text-align:center;'>Comments</b>",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "options": generateOptions([
              "Medications have been reconciled",
            ])
          },
          {
            "question_id": 2,
            "type": "INFO",
            "title":
                "Document and describe for any \"Y\" answers for questions 1-6 and 8; Document and describe for any \"N\" answers for question 7:",
          },
          ...List.generate(9, (index) {
            return {
              "question_id": 3 + index,
              "type": "MIX",
              "title": "Date:",
              "options": generateOptions([
                "",
                "",
              ])
            };
          })
        ],
      },
      {
        'question_type_id': 0741137008,
        "type": "UPLOAD",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": true,
        "title": "Clinician Signature:",
        "answer_id": 0,
        "question_options": generateOptions(["Upload Signature"]),
      },
      {
        'question_type_id': 0741137009,
        "type": "ACTIONBUTTON",
        "question_type": "NON-COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(["Send Updates to MD"]),
      },
    ]
  };
}
