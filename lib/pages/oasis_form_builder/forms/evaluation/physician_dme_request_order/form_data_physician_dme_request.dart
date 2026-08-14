import '../../generate_options.dart';

class FormDataPhysicianDMERequest {
  static Map<int, Map<String, dynamic>> drawerItems = {
    60: physicianDMERequest,
  };
  static Map<String, dynamic> physicianDMERequest = {
    "template_name": "PHYSICIAN DME REQUEST",
    "cols": 2,
    "title": "Physician DME Request",
    "formId": 70,
    "subFormId": 1124,
    "questions": [
      {
        'question_type_id': 701124001,
        "type": "MIX",
        "question_type": "COMPREHENSIVE",
        "group_options": false,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "DATE",
            "title": "<b>Patient’s DOB:</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "",
            ])
          },
          {
            "question_id": 2,
            "type": "DROPDOWN",
            "title": "<b>Doctor:</b>",
            "scroll_axis": "HORIZONTAL",
            "options": generateOptions([
              "",
            ])
          },
          {
            "question_id": 3,
            "type": "TEXTFIELD",
            "options_alignment": "HORIZONTAL",
            "options": generateOptions(
              [
                "<b>Phone:</b>",
                "<b>Fax:</b>",
                "<b>Primary Dx:</b>",
                "<b>Primary Insurance:</b>",
                "<b>Secondary Insurance:</b>",
              ],
              addToValues: false,
            )
          }
        ]
      },
      {
        'question_type_id': 701124002,
        "type": "UPLOAD",
        "question_type": "COMPREHENSIVE",
        "title": "<b>Doctor’s Signature</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(["Upload Signature"])
      },
      {
        'question_type_id': 701124003,
        "type": "STATIC",
        "question_type": "NON-COMPREHENSIVE",
        "scroll_axis": "HORIZONTAL",
        "options_alignment": "HORIZONTAL",
        "group_options": false,
        "dynamic_type": false,
        "has_color": false,
        "answer_id": 0,
        "questions":[
          {
            "question_id":1,
            "type":"TEXTFIELD",
            "options":generateOptions(["<b>Height:</b>", "<b>Weight:</b>"]),
          }
        ]  
      },
      {
        'question_type_id': 701124004,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Equipment Requested:</b>",
        "options_alignment": "HORIZONTAL",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
      {
        'question_type_id': 701124005,
        "type": "TEXTFIELD",
        "question_type": "NON-COMPREHENSIVE",
        "title": "<b>Reason For Equipment Requested:</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions([""])
      },
    ]
  };
}
