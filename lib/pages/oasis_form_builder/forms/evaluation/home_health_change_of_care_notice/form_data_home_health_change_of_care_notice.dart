import '../../generate_options.dart';

class FormDataHomeHealthChangeOfCareNotice {
  static Map<int, Map<String, dynamic>> drawerItems = {
    59: homeHealthChangeOfCareNotice,
  };

  static Map<String, dynamic> homeHealthChangeOfCareNotice = {
    "template_name": "HOME HEALTH CHANGE OF CARE NOTICE (HHCCN)",
    "cols": 2,
    "title": "Home Health Change Of Care Notice (HHCCN)",
    "formId": 60,
    "subFormId": 1096,
    "questions": [
      {
        'question_type_id': 0601096001,
        "type": "INFO",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": true,
        "title":
            "<div style='text-align:center;'>ProHealth Homecare Walnut Creek<br>2125 Oak Grove Road<br>Walnut Creek<br>945980536<br>Phone:<br>877-258-0336</div>",
      },
      {
        'question_type_id': 0601096002,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          ...List.generate(12, (index) {
            final titleList = [
              "<b>Home Health Agency:</b>",
              "<b>Patient Identification:</b>",
              "<b>Last:</b>",
              "<b>First:</b>",
              "<b>M.I.:</b>",
              "<b>Suffix:</b>",
              "<b>Address:</b>",
              "<b>Suit/Apt #:</b>",
              "<b>City:</b>",
              "<b>State:</b>",
              "<b>Zip Code:</b>",
              "<b>Phone:</b>",
            ];
            return {
              "question_id": index + 1,
              "title": titleList[index],
              "type": "TEXTFIELD",
              "scroll_axis": "HORIZONTAL",
              "options": generateOptions([""]),
            };
          })
        ],
      },
      {
        'question_type_id': 0601096003,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "notice":
            ", your home health agency will change the following items and/or services for the reasons listed below.",
        "answer_id": 0,
        "options": generateOptions([''], addToValues: false),
      },
      {
        'question_type_id': 0601096004,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "title":
                "<div style='text-align:center;'><b>Items/Services:</b></div>",
            "options": generateOptions([""]),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "title":
                "<div style='text-align:center;'><b>Reason For Change:</b></div>",
            "options": generateOptions([""]),
          },
        ],
      },
      {
        'question_type_id': 0601096005,
        "type": "CHECKBOX",
        "question_type": "QUESTIONTYPEBOTH",
        "title":
            "<b>Read the information next to the checked box below.</b> Your home health agency is giving you this information because:",
        "group_options": false,
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions([
          "<b>Your physician/provider's orders for your home care have changed.</b> <br>The home health agency must follow physician/provider orders to give you care. <br>The home health agency can't give you home care without a physician/provider's order. <br>If you don't agree with this change, discuss it with your home health agency or the physician/provider who orders your home care.",
          "<b>Your home health agency has decided to stop giving you the home care listed above.</b> <br>You can look for care from a different home health agency if you have a valid order for home care and still think you need home care. <br>If you need help finding a different home health agency to give you this care, contact the physician/provider who ordered your home care. <br>If you get care from a different home health agency, you can ask it to bill Medicare.",
        ]),
      },
      {
        'question_type_id': 0601096006,
        "type": "INFO",
        "question_type": "QUESTIONTYPEBOTH",
        "title":
            "<b>If you have questions about these changes, you can contact your home health agency and/or the physician/provider who orders your home care</b>",
        "description":
            "You cannot appeal to Medicare about payment for the items/services listed above unless you both receive them and a Medicare claim is filed.",
        "group_options": false,
        "dynamic_type": true,
        "answer_id": 0,
      },
      {
        'question_type_id': 0601096007,
        "type": "TEXTFIELD",
        "question_type": "QUESTIONTYPEBOTH",
        "title": "Additional Information:",
        "group_options": false,
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions([''])
      },
      {
        'question_type_id': 0601096008, //0651105001,
        "type": "UPLOAD",
        "question_type": "QUESTIONTYPEBOTH",
        "title":
            "<b>Please Sign and date below</b> to Show that you received and understand this notice. Return this Signed notice to your home health agency in person or by mailing it to them at the address listed at the top of this notice. <br><br><b>Patient Signature</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(["Upload Signature"])
      },
      {
        'question_type_id': 0601096009, //0651105001,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "has_color": false,
        "notice":
            "*If a representative signs for the beneficiary, write \"(rep)\" or \"(representative)\" next to the signature. If the representative's signature is not clearly legible, the representative's name must be printed. CMS does not discriminate in its programs and activities. To request this publication in an alternative format, please call: 1-800-MEDICARE or email: <u style='color:red;'>AltFormatRequest@cms.hhs.gov.</u>",
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "scroll_axis":"HORIZONTAL",
            "title": "<b>Authorized Representative's Name:</b>",
            "options": generateOptions([''])
          },
          {
            "question_id": 1,
            "type": "DATE",
            "title": "<b>Date:</b>",
            "scroll_axis":"HORIZONTAL",
            "options": generateOptions([''])
          }
        ]
      },
      {
        'question_type_id': 0601096010, //0651105001,
        "type": "UPLOAD",
        "question_type": "QUESTIONTYPEBOTH",
        "title": "<b>Clinician Signature:</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(["Upload Signature"])
      },
      {
        'question_type_id': 0601096011,
        "type": "INFO",
        "question_type": "QUESTIONTYPEBOTH",
        "title": "Form CMS-10280 Exp. 12/31/2024)",
        "group_options": false,
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };
}
