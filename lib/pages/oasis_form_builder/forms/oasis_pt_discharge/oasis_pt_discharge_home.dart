import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_start_of_care/static_screens/wound_screen.dart';
import 'package:clinician_app/pages/oasis_form_builder/oasis_form_builder.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/not_attempted_questions_overlay.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_item.dart';
import 'package:provider/provider.dart';

import '../../side_drawer/side_drawer_provider.dart';

import '../../ui_components/patient_profile_widget.dart';

import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/model/chart_patient_referral_data_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/model/patient_form_model.dart';
import '../../ui_components/tablet_app_bar.dart';

class OasisPTDischarge extends StatefulWidget {
  final PatientForm? form;
  final PatientSubForm? subForm;
  final ChartPatientReferral? patient;

  const OasisPTDischarge({super.key, this.form, this.subForm, this.patient});

  @override
  State<OasisPTDischarge> createState() => _OasisPTDischargeState();
}

class _OasisPTDischargeState extends State<OasisPTDischarge> {
  int initialDrawerIndex =3;
  bool isLoading = true;
  late PatientForm? form;
  late PatientSubForm? subform;
  late ChartPatientReferral? patient;

  @override
  void initState() {
    super.initState();
    form = widget.form;
    subform = widget.subForm;
    patient = widget.patient;
    Future.delayed(Duration.zero).then((_) {
      if (form != null && subform != null) {
        sideDrawerItems = form!.subForms
            .map(
              (subform) => SideDrawerItem(
            itemTitle: subform.subFormName,
            widget: subform.subFormID == 19
                ? WoundScreen(
              subFormId: subform.subFormID,
              formId: form!.formID,
            )
                : OasisFormBuilder(
              subFormId: subform.subFormID,
              formId: form!.formID,
              patientFormID: subform.patientFormID,
              formTitle: subform.subFormName,
              templateName: form!.formName,
            ),
          ),
        )
            .toList();

        final subFormIndex = form!.subForms.indexWhere(
                (subFormElement) => subFormElement.subFormID == subform!.subFormID);
        initialDrawerIndex = subFormIndex == -1 ? 0 : subFormIndex;
      }
      final sideDrawerProvider =
      Provider.of<SideDrawerProvider>(context, listen: false);
      sideDrawerProvider.updateSideBarItem(sideDrawerItems[initialDrawerIndex]);
      setState(() {
        isLoading = false;
      });
    });
  }

  GlobalKey notAttemptedWidgetKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NonAttemptedQuestions(),
      key: _scaffoldKey,
      drawer: Container(
        padding: const EdgeInsets.all(15),
        width: 350,
        color: AppColors.primaryAppColor,
        child: CustomSideDrawer(drawerItems: sideDrawerItems),
      ),
      drawerScrimColor: Colors.transparent,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 100),
        child: Responsive(
          tablet: TabletAppBar(
            headingText: 'Patient Charts',
            openDrawer: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          desktop:  TabletAppBar(
            headingText: 'Patient Charts',
            openDrawer: () {},
            showDrawer: false,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Responsive(
        tablet: Column(
          children: [
            Expanded(
              child: Consumer<SideDrawerProvider>(
                builder: (BuildContext context, sideDrawerProvider,
                    Widget? child) {
                  return sideDrawerProvider.activeSideDrawerItem.widget;
                },
              ),
            ),
          ],
        ),
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  PatientProfileWidget(
                    "JOHN SCOTT",
                    "images/oasis_rn_soc/patient_profile_image.png",
                    DateTime(1997, 3, 8),
                  ),
                  Expanded(
                    flex: 12,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: 350,
                      color: AppColors.primaryAppColor,
                      child:
                      CustomSideDrawer(drawerItems: sideDrawerItems),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Consumer<SideDrawerProvider>(
                builder: (BuildContext context, sideDrawerProvider,
                    Widget? child) {
                  return sideDrawerProvider.activeSideDrawerItem.widget;
                },
              ),
            ),
            _getNonAttemptedWidget(context),
          ],
        ),
      ),
    );
  }


  List<SideDrawerItem> sideDrawerItems = [
    SideDrawerItem(
      itemTitle: 'Clinical Record Items & Patient Signature',
      widget: OasisFormBuilder(formId: 56, subFormId: 3),
    ),
    SideDrawerItem(
      itemTitle: 'Administrative Information',
      widget: OasisFormBuilder(formId: 56, subFormId: 2),
    ),
    SideDrawerItem(
      itemTitle: 'Discharge Data',
      widget: OasisFormBuilder(formId: 56, subFormId: 35),
    ),
    SideDrawerItem(
      itemTitle: 'Patient History/Immunization',
      widget: OasisFormBuilder(formId: 56, subFormId: 4),
    ),
    SideDrawerItem(
      itemTitle: 'Subjective',
      widget: OasisFormBuilder(formId: 56, subFormId: 41),
    ),
    SideDrawerItem(
      itemTitle: 'Pain',
      widget: OasisFormBuilder(formId: 56, subFormId: 9),
    ),
    SideDrawerItem(
      itemTitle: 'Vital Signs',
      widget: OasisFormBuilder(formId: 56, subFormId: 8),
    ),
    SideDrawerItem(
      itemTitle: 'BIMS',
      widget: OasisFormBuilder(formId: 56, subFormId: 11),
    ),
    SideDrawerItem(
      itemTitle: 'Neurological/Cognitive Patterns',
      widget: OasisFormBuilder(formId: 56, subFormId: 12),
    ),
    SideDrawerItem(
      itemTitle: 'Mood',
      widget: OasisFormBuilder(formId: 56, subFormId: 13),
    ),
    SideDrawerItem(
      itemTitle: 'Behavior / Risk Factors',
      widget: OasisFormBuilder(formId: 56, subFormId: 14),
    ),
    SideDrawerItem(
      itemTitle: 'Gastrointestinal/Nutrition/Endocrine',
      widget: OasisFormBuilder(formId: 56, subFormId: 18),
    ),
    SideDrawerItem(
      itemTitle: 'Integumentary/Wound Care',
      widget: OasisFormBuilder(formId: 56, subFormId: 19),
    ),
    SideDrawerItem(
      itemTitle: 'Ulcers/Surgical Wounds',
      widget: OasisFormBuilder(formId: 56, subFormId: 20),
    ),
    SideDrawerItem(
      itemTitle: 'Musculoskeletal',
      widget: OasisFormBuilder(formId: 56, subFormId: 21),
    ),
    SideDrawerItem(
      itemTitle: 'Functional Assessment',
      widget: OasisFormBuilder(formId: 56, subFormId: 42),
    ),
    SideDrawerItem(
      itemTitle: 'Tests/Scales',
      widget: OasisFormBuilder(formId: 56, subFormId: 43),
    ),
    SideDrawerItem(
      itemTitle: 'Functional Status',
      widget: OasisFormBuilder(formId: 56, subFormId: 22),
    ),
    SideDrawerItem(
      itemTitle: 'Functional Abilities and Goals',
      widget: OasisFormBuilder(formId: 56, subFormId: 23),
    ),
    SideDrawerItem(
      itemTitle: 'Fall Risk/ Therapy Need',
      widget: OasisFormBuilder(formId: 56, subFormId: 24),
    ),
    SideDrawerItem(
      itemTitle: 'Medications',
      widget: OasisFormBuilder(formId: 56, subFormId: 25),
    ),
    SideDrawerItem(
      itemTitle: 'Special Treatment, Procedures, And Programs',
      widget: OasisFormBuilder(formId: 56, subFormId: 27),
    ),
    SideDrawerItem(
      itemTitle: 'Emergent Care',
      widget: OasisFormBuilder(formId: 56, subFormId: 37),
    ),
    SideDrawerItem(
      itemTitle: 'Objective',
      widget: OasisFormBuilder(formId: 56, subFormId: 45),
    ),
    SideDrawerItem(
      itemTitle: 'Assessment Summary',
      widget: OasisFormBuilder(formId: 56, subFormId: 30),
    ),
    SideDrawerItem(
      itemTitle: 'Supervision',
      widget: OasisFormBuilder(formId: 56, subFormId: 38),
    ),
    SideDrawerItem(
      itemTitle: 'Discharge Summary',
      widget: OasisFormBuilder(formId: 56, subFormId: 39),
    ),
    SideDrawerItem(
      itemTitle: 'Summary Sent To',
      widget: OasisFormBuilder(formId: 56, subFormId: 40),
    ),

  ];

  Widget _getNonAttemptedWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _scaffoldKey.currentState!.openEndDrawer();
      },
      child: Container(
        key: notAttemptedWidgetKey,
        // width: 27.w,
        // height: 251.h,
        margin: EdgeInsets.only(top: 20.h),
        padding:
        EdgeInsets.only(top: 56.h, bottom: 74.h, right: 5.w, left: 10.w),
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryAppLightColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
          ),
        ),
        child: RotatedBox(
          quarterTurns: 1, // Rotates 90 degrees clockwise
          child: Text(
            'Not Attempted Questions',
            style: FormBuilderTextStyle.regular10style.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}