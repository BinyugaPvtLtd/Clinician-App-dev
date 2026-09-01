import '../../generate_options.dart';

class FormDataCareCoordinationNote {
  static Map<int, Map<String, dynamic>> drawerItems = {
    33: careCoordination,
  };

  static Map<String, dynamic> careCoordination = {
    "template_name": "CARE COORDINATION NOTE",
    "cols": 2,
    "title": "Care Coordination Note",
    "formId": 35,
    "subFormId": 601,
    "questions": [
      {
        'question_type_id': 0350601001,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "title": "<b>Coordination of Care with:</b>",
        "has_color": true,
        "answer_id": 0,
        "question_options": generateOptions([
          "Physician",
          "OT/ COTA",
          "DON",
          "SLP",
          "RN/LPN/LVN",
          "MSW",
          "Aide",
          "Pharmacist",
          "PT/PTA",
          "Therapy Supervisor",
          "Case Manager",
          "Community Resource",
          "DME Vendor",
          "Other",
        ], textFieldPopup: [
          13
        ]),
      },
      {
        'question_type_id': 0350601002,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "title": "<b>Topic:</b>",
        "has_color": true,
        "answer_id": 0,
        "question_options": generateOptions([
          "Coordinate care between disciplines",
          "Change to current POC",
          "New signs/symptoms",
          "Plan of care",
          "Recertification",
          "Discharge",
          "Other",
        ], textFieldPopup: [
          6
        ]),
      },
      {
        'question_type_id': 0350601003,
        "type": "STATIC",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "title": "<b>Communicated via:</b>",
        "has_color": true,
        "answer_id": 0,
        "question_options": generateOptions([
          "Telephone",
          "Tele-video",
          "Email",
          "Direct / In person",
          "Text",
          "Fax",
          "Other",
        ], textFieldPopup: [
          6
        ]),
      },
      {
        'question_type_id': 0350601004,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "Discussion",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },{
        'question_type_id': 0350601005,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "Resolution/Follow Up:",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },{
        'question_type_id': 0350601006,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "Clinical Progress:",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
    ]
  };
}
