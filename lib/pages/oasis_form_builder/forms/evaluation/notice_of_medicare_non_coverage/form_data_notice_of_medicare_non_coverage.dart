import '../../generate_options.dart';

class FormDataNoticeOfMedicareNonCoverage {
  static Map<int, Map<String, dynamic>> drawerItems = {
    63: noticeOfMedicareNonCoverage,
    0: noticeOfMedicareNonCoverage2,
  };

  static Map<String, dynamic> noticeOfMedicareNonCoverage = {
    "template_name":
        "NOTICE OF MEDICARE NON_COVERAGE (REGION 9 - CA, AZ, NV, HI, GU, CN AS)",
    "cols": 2,
    "title": "Page 1",
    "formId": 59,
    "subFormId": 1094,
    "questions": [
      {
        'question_type_id': 0591094001,
        "type": "INFO",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": true,
        "title":
            "<div style='text-align:center;'><b>ProHealth Homecare Walnut Creek<br>2125 Oak Grove Road Suite 124 A - B<br>Walnut Creek, CA 945980536<br>Phone: 877-258-0336<br><br>Notice of Medicare Non-Coverage</b></div>",
      },
      {
        'question_type_id': 0591094002,
        "type": "STATIC",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": false,
        "has_color": true,
        "answer_id": 0,
        "questions": [
          ...List.generate(2, (index) {
            final titleList = [
              "<b>Patient Name:</b>",
              "<b>Patient Number:</b>",
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
        'question_type_id': 0591094003,
        "type": "DATE",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": true,
        "scroll_axis": "HORIZONTAL",
        "title":
            "The Effective Date Coverage of Your Current Home Health Services Will End:",
        "answer_id": 0,
        "options": generateOptions([''], addToValues: false),
      },
      {
        'question_type_id': 0591094004,
        "type": "INFO",
        "question_type": "QUESTIONTYPEBOTH",
        "title": '''<div style="text-align:left"><b>Your Right to Appeal This Decision</b></div>
<ul>
    <li>You have the right to an immediate, independent medical review (appeal) of the decision to end Medicare coverage of these services. Your services will continue during the appeal.</li>
    <li>If you choose to appeal, the independent reviewer will ask for your opinion. The reviewer also will look at your medical records and/or other relevant information. You do not have to prepare anything in writing, but you have the right to do so if you Wish.</li>    
    <li>If you choose to appeal, you and the independent reviewer will each receive a copy of the detailed explanation about why your coverage for services should not continue. You will receive this detailed notice only after you request an appeal.</li>
<li>If you choose to appeal, and the independent reviewer agrees services should no longer be covered after the effective date indicated above;<ul><li>Neither Medicare nor your plan will pay for these services after that date.</li></ul></li>
<li>If you stop services no later than the effective date indicated above, you will avoid financial liability.</li>
</ul>



<div style="text-align:left"><b>How to Ask For an Immediate Appeal</b></div>
<ul>
    <li>You must make your request to your Quality Improvement Organization (also known as a QIO). A QIO is the independent reviewer authorized by Medicare to review the decision to end these services.</li>
    <li>Your request for an immediate appeal should be made as soon as possible, but no later than noon of the day before the effective date indicated above.</li>    
    <li>The QIO will notify you of its decision as soon as possible, generally no later than two days after the effective date of this notice if you are in Original Medicare. If you are in a Medicare health plan, the QIO generally will notify you of its decision by the effective date of this notice.</li>
<li>Call your QIO at: Livanta, LLC at (1-877-588-1123; TTY/TDD:1-855-887-6668) to appeal, or if you have questions.</li>

</ul>
  

<h3 style='text-align:center;'>See page 2 of this notice for more information.</h3>
<div style='display: flex; justify-content: space-between;'> <div>Form CMS 10123-NOMNC (Approved 12/31 /2011)</div> <div>OMB approval 0938-0953</div> </div>
''',
        "group_options": false,
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };
  static Map<String, dynamic> noticeOfMedicareNonCoverage2 = {
    "template_name":
        "NOTICE OF MEDICARE NON_COVERAGE (REGION 9 - CA, AZ, NV, HI, GU, CN AS)",
    "cols": 2,
    "title": "Page 2",
    "formId": 59,
    "subFormId": 1095,
    "questions": [
      {
        'question_type_id': 0591095001,
        "type": "TEXTFIELD",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": true,
        "title":
            "If You Miss The Deadline to Request An Immediate Appeal, You May Have Other Appeal Rights:",
        "description": '''
            <ul>
            <li>If you have Original Medicare: Call the QIO listed on page 1.</li>
            <li>If you belong to a Medicare health plan: Call your plan at the number given below.</li>
            </ul>
            <br><br>
            Plan Contact Information
            ''',
        "question_options": generateOptions([''], hints: [' ']),
      },
      {
        'question_type_id': 0591095002,
        "type": "TEXTFIELD",
        "question_type": "QUESTIONTYPEBOTH",
        "group_options": false,
        "dynamic_type": true,
        "title": "Additional Information (Optional):",
        "question_options": generateOptions([''], hints: [' ']),
      },
      {
        'question_type_id': 0591095003, //0651105001,
        "type": "UPLOAD",
        "question_type": "QUESTIONTYPEBOTH",
        "title":
            "Please sign below to indicate you received and understood this notice. <br>I have been notified that coverage of my services will end on the effective date indicated on this notice and that I may appeal this decision by contacting my QIO.<br><br><b>Patient or Representative Signature</b>",
        "group_options": false,
        "dynamic_type": true,
        "has_color": false,
        "answer_id": 0,
        "question_options": generateOptions(["Upload Signature"])
      },
      {
        'question_type_id': 0591095004,
        "type": "INFO",
        "question_type": "QUESTIONTYPEBOTH",
        "title":
            "<br><br><br><br> <div style=\"display: flex; justify-content: space-between;\"> <div>Form CMS 10123-NOMNC (Approved 12/31 /2011)</div> <div>OMB approval 0938-0953</div> </div>",
        "group_options": false,
        "dynamic_type": true,
        "answer_id": 0,
      },
    ]
  };
}
