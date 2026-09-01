import '../../generate_options.dart';

class FormDataNutritionalAssessmentAndServicePlan {
  static Map<int, Map<String, dynamic>> drawerItems = {
    4: patientHistory,
    57: nutritionalAssessment
  };

  static Map<String, dynamic> patientHistory = {
    "template_name": "NUTRITIONAL ASSESSMENT AND SERVICE PLAN",
    "cols": 2,
    "title": "Patient Information & Signature",
    "formId": 75,
    "subFormId": 1138,
    "questions": [
      {
        'question_type_id': 0751138001, //0651105001,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "options": generateOptions([
              '<b>Physician Name:</b>',
              '<b>Physician Phone:</b>',
              '<b>Fax:</b>',
            ], addToValues: false),
          },
          {
            "question_id": 2,
            "type": "DATE",
            "options": generateOptions([
              '<b>Patient\'s DOB:</b>',
            ], addToValues: false),
          },
          {
            "question_id": 3,
            "type": "RADIO",
            "group_options": true,
            "title": "<b>Sex:</b>",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(
              [
                '1 - Male',
                '2 - Female',
              ],
            ),
          },
          {
            "question_id": 4,
            "type": "DATE",
            "options": generateOptions([
              '<b>SOC DATE:</b>',
            ], addToValues: false),
          },
          {
            "question_id": 5,
            "type": "TEXTFIELD",
            "options": generateOptions([
              '<b>RN:</b>',
            ], addToValues: false),
          },
        ]
      },
      {
        'question_type_id': 0751138002, //0651105001,
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
        'question_type_id': 0751138003, //0651105002,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Reason for Referral:</b>",
        "dynamic_type": true,
        "scroll_axis": "HORIZONTAL",
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
      {
        'question_type_id': 0751138004, //0651105003,
        "type": "CHECKBOX",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Services Provided:</b>",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions([
          "Home Visit",
          "Telephone Contact",
        ],textFieldPopup: [1])
      },
    ]
  };

  static Map<String, dynamic> nutritionalAssessment = {
    "template_name": "NUTRITIONAL ASSESSMENT AND SERVICE PLAN",
    "cols": 2,
    "title": "Nutritional Assessment",
    "formId": 75,
    "subFormId": 1139,
    'questions': [
      {
        "question_type_id": 0751139001,
        "type": "MIX",
        "dynamic_type": false,
        "question_type": "COMPREHENSIVE",
        "questions": [
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "options": generateOptions([
              'Height',
              'Weight',
              'BMI',
              'Usual Weight',
              'Desirable Weight',
            ], addToValues: false)
          },
          {
            "question_id": 2,
            "type": "RADIO",
            "title": "Any weight change recently?",
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ], textFieldPopup: [
              0
            ])
          },
          {
            "question_id": 3,
            "type": "RADIO",
            "title": "Any issue with weight?",
            "group_options": true,
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              "Yes",
              "No",
            ], textFieldPopup: [
              0
            ])
          }
        ]
      },
      {
        "question_type_id": 0751139002,
        "type": "STATIC",
        "dynamic_type": false,
        "title": "<b>Diet</b>",
        "question_type": "COMPREHENSIVE",
        "questions": [
          {
            "question_id": 1,
            "type": "CHECKBOX",
            "title": "<b>Diet Order</b>",
            "options": generateOptions([
              "Cardiac:",
              "Low Fat",
              "Low Cholesterol",
              "Diabetic:",
              "No added salt",
              "Low Sodium",
              "High Protein",
              "KCAL",
              "GRED",
              "Gout",
              "Renal:",
              "Low Potassium",
              "Low Phosphorus",
              "Low Sodium",
              "Enteral Nutrition",
              "Other Diet",
            ], addToValues: false)
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "<b>Diet Texture</b>",
            "options": generateOptions([
              "Regular",
              "Mechanical Soft",
              "Cut up / Minced",
              "Puree",
              "Other Texture",
            ], addToValues: false)
          },
          {
            "question_id": 2,
            "type": "CHECKBOX",
            "title": "<b>Liquid Texture</b>",
            "options": generateOptions([
              "Regular",
              "Thin",
              "Honey Thick",
              "Nectar Thick",
              "Other Texture",
            ], addToValues: false)
          },
        ]
      },
      {
        "question_type_id": 0751139003,
        "type": "TEXTFIELD",
        "dynamic_type": true,
        "title":
            "<b>Estimated Nutritional Needs (calories, protein, fluid, RDA's)</b>",
        "question_type": "COMPREHENSIVE",
        "question_options": generateOptions(
          [''],
        ),
      },
      {
        "question_type_id": 0751139004,
        "type": "TEXTFIELD",
        "dynamic_type": true,
        "title": "<b>Labs</b>",
        "question_type": "COMPREHENSIVE",
        "question_options": generateOptions(
          [''],
        ),
      },
      {
        "question_type_id": 0751139005,
        "type": "TEXTFIELD",
        "dynamic_type": true,
        "title": "<b>Nutritionally significant medications and treatments</b>",
        "question_type": "COMPREHENSIVE",
        "question_options": generateOptions(
          [''],
        ),
      },
      {
        "question_type_id": 0751139006,
        "type": "TEXTFIELD",
        "dynamic_type": false,
        "title": "<b>Present Nutrient Intake Analysis</b>",
        "question_type": "COMPREHENSIVE",
        "questions": [
          {
            "question_id": 1,
            "type": "STATIC",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              'Calories:',
              'Protein:',
              'Fluids:',
            ], addToValues: false)
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "options": generateOptions([
              "Breakfast ate:",
              "Lunch ate:",
              "Dinner ate:",
              "Snacks:",
              "Fluids within 24 hours:",
            ], addToValues: false)
          },
        ],
      },
      {
        "question_type_id": 0751139007,
        "type": "MIX",
        "dynamic_type": false,
        "title": "<b>Clinical/Physical</b>",
        "question_type": "NON-COMPREHENSIVE",
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "Appetite",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(["excellent", "good", "fair", "poor"],
                textFieldPopup: [0, 2]),         
          },
          {
            "question_id": 1,
            "type": "RADIO",
            "title": "Bowel Movements",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
          },
          ...List.generate(16, (index) {
            final titleList = [
              "‎ ‎ ‎ ‎ ‎ ‎Daily",
              "‎ ‎ ‎ ‎ ‎ ‎Constipation",
              "‎ ‎ ‎ ‎ ‎ ‎Diarrhea",
              "Dental",
              "Chewing issues",
              "Swallowing issues",
              "Food allergies",
              "Food intolerances",
              "Skin intact",
              "Pressure injury",
              "Headaches",
              "Dizziness",
              "Nausea",
              "Vomiting",
              "Digestive issues",
              "Stomach pains",
            ];
            return {
              "question_id": 3 + index,
              "type": "RADIO",
              "title": titleList[index],
              "scroll_axis": "HORIZONTAL",
              "options_alignment": "HORIZONTAL",
              "options": generateOptions(
                index == 3 ? ["own teeth", 'dentures', 'both'] : ["Yes", "No"],
                textFieldPopup: [0],
              ),
            };
          }),
          {
            "question_id": 19,
            "type": "TEXTFIELD",
            "title": "Comments:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(['']),
          },
        ]
      },
      {
        "question_type_id": 0751139008,
        "type": "MIX",
        "dynamic_type": false,
        "title": "<b>Assessment</b>",
        "question_type": "NON-COMPREHENSIVE",
        "questions": [
          ...List.generate(9, (index) {
            final titleList = [
              "Alert",
              "Oriented",
              "Knowledge deficit",
              "Able to verbally communicate",
              "Sleepy/ Sleeping",
              "Follows a diet",
              "Food limitations",
              "Concerns about diet",
              "Able to feed self",
            ];
            return {
              "question_id": index + 1,
              "type": "RADIO",
              "title": titleList[index],
              "scroll_axis": "HORIZONTAL",
              "options_alignment": "HORIZONTAL",
              "options": generateOptions(
                ["Yes", "No"],
                textFieldPopup: [0],
              ),
            };
          }),
          {
            "question_id": 10,
            "type": "CHECKBOX",
            "title": "Food Preparation:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(['Patient', 'Family', 'Caregiver'],
                textFieldPopup: [0, 1, 2]),
          },
          {
            "question_id": 11,
            "type": "RADIO",
            "title": "‎ ‎ ‎",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(
                ['Purchase all food', 'Eat out most meals'],
                textFieldPopup: [0]),
          },
          {
            "question_id": 11,
            "type": "CHECKBOX",
            "title": "‎ ‎ ‎",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(['Other'], textFieldPopup: [0]),
          },
          {
            "question_id": 12,
            "type": "CHECKBOX",
            "title": "Lives:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(['Alone', 'With Others', 'With Family'],
                textFieldPopup: [0, 1, 2]),
          },
          {
            "question_id": 13,
            "type": "RADIO",
            "title": "‎ ‎ ‎",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions([
              'In house/town house',
              'In Apartment',
              'Board & Care',
              'Senior Facility',
            ], textFieldPopup: [
              0
            ]),
          },
          {
            "question_id": 14,
            "type": "CHECKBOX",
            "title": "‎ ‎ ‎",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(['Other'], textFieldPopup: [0]),
          },
          ...List.generate(4, (index) {
            final titleList = [
              "If Diabetic, daily blood sugar check",
              "Renal Dialysis",
              "Speaks another language",
              "Participated in the plan of care",
            ];
            return {
              "question_id": index + 15,
              "type": "RADIO",
              "title": titleList[index],
              "scroll_axis": "HORIZONTAL",
              "options_alignment": "HORIZONTAL",
              "options": generateOptions(
                ["Yes", "No", "NA"],
                textFieldPopup: [0],
              ),
            };
          }),
          {
            "question_id": 19,
            "type": "TEXTFIELD",
            "title": "Comments:",
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(['']),
          },
        ]
      },
      {
        "question_type_id": 0751139009,
        "type": "MIX",
        "dynamic_type": false,
        "title": "<b>Treatment Plan</b>",
        "question_type": "NON-COMPREHENSIVE",
        "questions": [
          {
            "question_id": 1,
            "type": 'TEXTFIELD',
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "Diet:",
              "Fluids for hydration:",
              "Daily physical activity or movement for health:",
              "Comments:",
            ], addToValues: false)
          },
          {
            "question_id": 2,
            "type": 'RADIO',
            "scroll_axis": "HORIZONTAL",
            "options_alignment": "HORIZONTAL",
            "title":
                "Patient verbalized agreement to the treatment and plan of care",
            "options": generateOptions(
              ["Yes", "No"],
              textFieldPopup: [0],
            )
          }
        ]
      }
    ]
  };
}
