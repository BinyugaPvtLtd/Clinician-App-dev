import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/evaluation/nutritional_assessment_and_service_plan/static_widgets/question_751139006.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_discharge_non_visit/static_widgets/question_140420004.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_recert/static_widgets/question_470755001.dart';

import '../../../forms/oasis_rn_start_of_care/static_widgets/question_10002001.dart';
import '../../../provider/sub_question_wrapper_provider.dart';
import '../../../forms/oasis_rn_start_of_care/static_widgets/question_10019007.dart';
import '../../../forms/oasis_rn_start_of_care/static_widgets/question_10021001.dart';
import '../../../forms/oasis_rn_start_of_care/static_widgets/question_10021007.dart';
import '../../../forms/oasis_rn_start_of_care/static_widgets/question_10024002.dart';
import '../../../forms/oasis_rn_start_of_care/static_widgets/question_10026003.dart';
import '../../../forms/oasis_rn_start_of_care/static_widgets/question_10033004.dart';

class FullyStaticSubQuestionRepo {
  static Widget getQuestion(
      SubQuestionWrapper subQuestionWrapper, int questionId) {
    switch ('$questionId-${subQuestionWrapper.subQuestion.id}') {
      //Administrative Information
      case '10002001-11':
      case '470743001-11':
      case '140419001-7':
      case '510880001-11':
      case '60147001-11':
      case '100283001-11':
      case '30072001-11':
      case '520908001-11':
      case '530934001-11':
      case '540960001-11':
      case '120351001-11':
      case '130386001-11':
      case '110316001-11':
      case '550985001-7':
      case '80215001-11':
      case '90250001-11':
      case '571041001-7':
      case '1460459001-7':
      case '490811001-11':
      case '561013001-7':
      case '20036001-11':
      case '150439001-7':
      case '70180001-11':
      case '480776001-11':
      case '581069001-7':
      case '170479001-7':
      case '40108001-11':
      case '50141001-6':
      case '500846001-11':
        return Question10002001_11(
          subQuestionWrapper: subQuestionWrapper,
        );
      case '10002001-12':
      case '470743001-12':
      case '510880001-12':
      case '60147001-12':
      case '100283001-12':
      case '30072001-12':
      case '120351001-12':
      case '130386001-12':
      case '110316001-12':
      case '520908001-12':
      case '530934001-12':
      case '540960001-12':
      case '80215001-12':
      case '90250001-12':
      case '490811001-12':
      case '20036001-12':
      case '70180001-12':
      case '480776001-12':
      case '40108001-12':
      case '500846001-12':
        return Question10002001_12(
          subQuestionWrapper: subQuestionWrapper,
        );

      case '10002001-13':
      case '10002001-14':
      case '550985001-8':
      case '550985001-9':
        return Question10002001_13(subQuestionWrapper: subQuestionWrapper);
      case '10002001-18':
      case '470743001-18':
      case '140419001-13':
      case '510880001-18':
      case '60147001-18':
      case '10002001-19':
      case '470743001-19':
      case '140419001-14':
      case '510880001-19':
      case '60147001-19':
      case '10002001-20':
      case '470743001-20':
      case '140419001-15':
      case '510880001-20':
      case '60147001-20':
      case '1460459001-13':
      case '1460459001-14':
      case '1460459001-15':
      case '30072001-18':
      case '30072001-19':
      case '30072001-20':
      case '520908001-18':
      case '520908001-19':
      case '520908001-20':
      case '530934001-18':
      case '530934001-19':
      case '530934001-20':
      case '540960001-18':
      case '540960001-19':
      case '540960001-20':
      case '110316001-18':
      case '110316001-19':
      case '110316001-20':
      case '120351001-18':
      case '120351001-19':
      case '120351001-20':
      case '130386001-18':
      case '130386001-19':
      case '130386001-20':
      case '100283001-18':
      case '100283001-19':
      case '100283001-20':
      case '550985001-13':
      case '550985001-14':
      case '550985001-15':
      case '80215001-18':
      case '80215001-19':
      case '80215001-20':
      case '90250001-18':
      case '90250001-19':
      case '90250001-20':
      case '571041001-18':
      case '571041001-19':
      case '571041001-20':
      case '490811001-18':
      case '490811001-19':
      case '490811001-20':
      case '561013001-18':
      case '561013001-19':
      case '561013001-20':
      case '20036001-18':
      case '20036001-19':
      case '20036001-20':
      case '150439001-18':
      case '150439001-19':
      case '150439001-20':
      case '70180001-18':
      case '70180001-19':
      case '70180001-20':
      case '480776001-18':
      case '480776001-19':
      case '480776001-20':
      case '581069001-18':
      case '581069001-19':
      case '581069001-20':
      case '40108001-18':
      case '40108001-19':
      case '40108001-20':
      case '170479001-18':
      case '170479001-19':
      case '170479001-20':
      case '500846001-18':
      case '500846001-19':
      case '500846001-20':
      case '50141002-1':
        return Question10002001_18(
          subQuestionWrapper: subQuestionWrapper,
        );

      // Musculoskeletal
      case '10021001-1':
      case '130406001-1':
      case '90270001-1':
      case '100302001-1':
      case '60166001-1':
      case '40128001-1':
      case '300540001-1':
        return Question10021001_1(
          subQuestionWrapper: subQuestionWrapper,
        );
      case '10021007-2':
      case '130406007-2':
      case '90270007-2':
      case '540971002-2':
      case '100302007-2':
      case '510893002-2':
      case '530945002-2':
      case '60166007-2':
      case '470762006-2':
      case '40128007-2':
      case '300540007-2':
      case '500866006-2':
        return Question10021007_2(
          subQuestionWrapper: subQuestionWrapper,
        );
      //Fall Risk / Therapy Need
      case '10024002-1':
      case '60169002-1':
      case '100305002-1':
      case '30098002-1':
      case '120377002-1':
      case '130410002-1':
      case '20062002-1':
      case '470765002-1':
      case '480802002-1':
      case '110342002-1':
      case '70206002-1':
      case '40132002-1':
      case '90274002-1':
      case '80241002-1':
        return Question10024002_1(
          subQuestionWrapper: subQuestionWrapper,
        );
      case '10024002-2':
      case '60169002-2':
      case '100305002-2':
      case '30098002-2':
      case '120377002-2':
      case '130410002-2':
      case '20062002-2':
      case '470765002-2':
      case '480802002-2':
      case '110342002-2':
      case '70206002-2':
      case '40132002-2':
      case '90274002-2':
      case '80241002-2':
        return Question10024002_2(
          subQuestionWrapper: subQuestionWrapper,
        );

      //Wound Screen
      case '10019007-1':
      case '510892006-1':
      case '470760007-1':
        return AddWoundImageWidget(
          subQuestionWrapper: subQuestionWrapper,
        );
      // Infusion/Labdraw
      case '10026003-3':
      case "60171003-3":
      case "100307003-3":
      case "470767003-3":
      case "360613003-3":
      case "430704003-3":
      case "300543003-3":
      case "510898003-3":
        return Question10026003_3(
          subQuestionWrapper: subQuestionWrapper,
        );
      // Plan/Care Coordination
      // 33. Care Planning/Coordination
      case '10033004-2':
      case '110349004-2':
      case '120384004-2':
      case '130417004-2':
      case '60178004-2':
      case '100314004-2':
      case '510904004-2':
      case '520930004-2':
      case '540981004-2':
      case '470774004-2':
      case '80248004-2':
      case '490844004-2':
      case '20069004-2':
      case '480809004-2':
      case '70213004-2':
      case '40139004-2':
      case '500877004-2':
      case '90281004-2':
      case '30105004-2':
      case '300548004-2':
      case '400662004-2':
      case '420689004-2':
      case '410675004-2':
      case '711132004-2':
      case '310565004-2':
      case '330595004-2':
      case '320582004-2':
      case '530956004-2':
        return Question10033004_2(
          subQuestionWrapper: subQuestionWrapper,
        );

      //Discharge Data
      case '140420004-1':
      case '160460004-1':
      case '550986004-1':
      case '571042004-1':
      case '140420006-1':
      case '160460006-1':
      case '550986006-1':
      case '571042006-1':
      case '561014006-1':
      case '561014004-1':
      case '150440006-1':
      case '150440004-1':
      case '581070004-1':
      case '581070006-1':
      case '170480004-1':
      case '170480006-1':
      case '50143002-1':
        return Question140420004_1(
          subQuestionWrapper: subQuestionWrapper,
        );
      case '470755001-1':
      case '490824001-1':
        return Question470755001_1(subQuestionWrapper: subQuestionWrapper);

      // Nutritional Assessment
      case '751139006-1':
        return Question751139006(subQuestionWrapper: subQuestionWrapper);
      default:
        return const Text('Not Implemented'); // Default return
    }
  }
}
