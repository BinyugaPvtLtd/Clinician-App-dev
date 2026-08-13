import '../../generate_options.dart';

class FormDataAdvanceBeneficiaryNoticeOfNonCoverage {
  static Map<int, Map<String, dynamic>> drawerItems = {
    67: advanceBeneficiaryNoticeOfNonCoverage,
  };

  static Map<String, dynamic> advanceBeneficiaryNoticeOfNonCoverage = {
    "template_name": "ADVANCE BENEFICIARY NOTICE OF NONCOVERAGE (ABN)",
    "cols": 2,
    "title": "Advance Beneficiary Notice Of Non Coverage (ABN)",
    "formId": 62,
    "subFormId": 1099,
    "questions": [
      {
        'question_type_id': 0621099001,
        "type": "INFO",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": true,
        "title":
        "<div style='text-align:center;'><b>2125 Oak Grove Road Suite 124 A - B<br>Walnut Creek, CA 945980536<br>Phone: 877-258-0336<br>Fax: 877-867-1787<br></div>",
      },
      {
        'question_type_id': 0621099002,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          ...List.generate(3, (index) {
            final titleList = [
              "<b>A. Notifier:</b>",
              "<b>B. Patient Name:</b>",
              "<b>C. Identification Number:</b>",
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
        'question_type_id': 0621099003,
        "type": "INFO",
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": true,
        "title":
        "<div style='text-align:center;'><b>Advance Beneficiary Notice of Noncoverage<br><br>(ABN)</b></div>",
        "answer_id": 0,
      },
      {
        'question_type_id': 0621099004,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "'TEXTFIELD",
            "options": generateOptions([
              "<b><u>NOTE</u>:</b> If Medicare doesn't pay for <b>D.</b>",
            ], addToValues: false),
            "notice": "below, you may have to pay."
          },
          {
            "question_id": 2,
            "type": "'TEXTFIELD",
            "title":
            "Medicare does not pay for everything, even some care that you or your health care provider have good reason to think you need.",
            "options": generateOptions([
              "We expect Medicare may not pay for the <b>D.</b>",
            ], addToValues: false),
            "notice": "below."
          }
        ]
      },
      {
        'question_type_id': 0621099005,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "'TEXTFIELD",
            "title": "<b>D.</b>",
            "options": generateOptions([
              "",
            ], addToValues: false),
          },
          {
            "question_id": 2,
            "type": "'TEXTFIELD",
            "title": "<b>E. Reason Medicare May Not Pay:</b>",
            "options": generateOptions([""], addToValues: false),
          },
          {
            "question_id": 3,
            "type": "'TEXTFIELD",
            "title": "<b>F. Estimated Cost</b>",
            "options": generateOptions([""], addToValues: false),
          },
        ]
      },
      {
        'question_type_id': 0621099006,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "title": "<b>WHAT YOU NEED TO DO NOW:</b>",
        "dynamic_type": false,
        "description": '''
        <ul>
        <li>Read this notice, so you can make an informed decision about your care.<br></li>
        <li>Ask us any questions that you may have after you finish reading.</li>
        </ul>
        ''',
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "TEXTFIELD",
            "options": generateOptions([
              "<ul><li>Choose an option below about whether to receive the <b>D.</b></li></ul>",
            ], addToValues: false),
            "notice": "listed above.",
          },
          {
            "question_id": 2,
            "type": "INFO",
            "title":
            "<b>Note:</b> If you choose Option 1 or 2, we may help you to use any other insurance that you might have, but Medicare cannot require us to do this.",
          },
        ]
      },
      {
        'question_type_id': 0621099007,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "title":
        "<b>G. OPTIONS: Check only one box. We cannot choose a box for you.</b>",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "RADIO",
            "options": generateOptions(
              [
                "<b>OPTION 1.</b>",
                "<b>OPTION 2.</b>",
                "<b>OPTION 3.</b>",
              ],
              addToValues: true
            ),
          },
          {
            "question_id": 2,
            "type": "TEXTFIELD",
            "options": generateOptions([
              "I want the <b>D.</b> ",
              "I want the <b>D.</b> ",
              "I don't want the <b>D.</b> ",
            ], hints: [
              "listed above. You may ask to be paid now, but I also want Medicare billed for an official decision on payment, which is sent to me on a Medicare Summary Notice (MSN). I understand that if Medicare doesn't pay, I am responsible for payment, but <b>I can appeal to Medicare</b> by following the directions on the MSN. If Medicare does pay, you will refund any payments I made to you, less co-pays or deductibles.",
              "listed above, but do not bill Medicare. You may ask to be paid now as I am responsible for payment. <b>I cannot appeal if Medicare is not billed.</b>",
              "listed above. I understand with this choice I am <b>not</b> responsible for payment, and <b>I cannot appeal to see if Medicare would pay.</b>"
            ],addToValues: false),
          },
        ]
      },
      {
        'question_type_id': 0621099008,
        "type": "TEXTFIELD",
        "question_type": "QUESTIONTYPEBOTH",
        "title": "<b>H. Additional Information</b>",
        "dynamic_type": true,
        "answer_id": 0,
        "question_options": generateOptions(
          [''],
        ),
      },
      {
        'question_type_id': 0621099009,
        "type": "INFO",
        "question_type": "QUESTIONTYPEBOTH",
        "title":
        "<b>This notice gives our opinion, not an official Medicare decision.</b> If you have other questions on this notice or Medicare billing, call <b>1-800-MEDICARE</b> (1-800-633-4227/ <b>TTY</b>:1-877-486-2048). Signing below means that you have received and understand this notice. You also receive a copy. ",
        "dynamic_type": true,
      },
      {
        'question_type_id': 0621099010,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "dynamic_type": false,
        "answer_id": 0,
        "questions": [
          {
            "question_id": 1,
            "type": "UPLOAD",
            "title": "<b>I. Patient's Signature</b>",
            "options": generateOptions(['Upload Signature']),
          },
          {
            "question_id": 2,
            "type": "DATE",
            "title": "<b>J. Date:</b>",
            "options": generateOptions(['']),
          }
        ],
      },
      {
        'question_type_id': 0621099011,
        "type": "INFO",
        "question_type": "QUESTIONTYPEBOTH",
        "title":
        "<div style='text-align:center;'><b>CMS does not discriminate in its programs and activities. To request this publication in an alternative format, please call: 1-800-MEDICARE or email: <div style='color:blue;'>AltFormatRequest@cms.hhs.gov.</div></b></div>",
        "description":
        "According to the Paperwork Reduction Act of 1995, no persons are required to respond to a collection of information unless it displays a valid OMB control number. The valid OMB control number for this information collection is 0938-0566. The time required to complete this information collection is estimated to average 7 minutes per response, including the time to review instructions, search existing data resources, gather the data needed, and complete and review the information collection. If you have comments concerning the accuracy of the time estimate or suggestions for improving this form, please write to: CMS, 7500 Security Boulevard, Attn: PRA Reports Clearance Officer, Baltimore, Maryland 21244-1850.",
        "dynamic_type": true,
      },
    ]
  };
}
