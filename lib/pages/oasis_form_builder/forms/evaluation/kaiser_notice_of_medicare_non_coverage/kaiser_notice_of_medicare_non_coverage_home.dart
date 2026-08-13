import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/oasis_form_builder.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/not_attempted_questions_overlay.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_item.dart';
import 'package:provider/provider.dart';

import '../../../constants/responsive.dart';
import '../../../model/chart_patient_referral_data_model.dart';
import '../../../model/patient_form_model.dart';
import '../../../side_drawer/side_drawer_provider.dart';
import '../../../ui_components/patient_profile_widget.dart';

import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_start_of_care/static_screens/wound_screen.dart';

import '../../../ui_components/tablet_app_bar.dart';


class KaiserNoticeOfMedicareNonCoverage extends StatefulWidget {
  final PatientForm? form;
  final PatientSubForm? subForm;
  final ChartPatientReferral? patient;

  const KaiserNoticeOfMedicareNonCoverage({super.key, this.form, this.subForm, this.patient});

  @override
  State<KaiserNoticeOfMedicareNonCoverage> createState() => _KaiserNoticeOfMedicareNonCoverageState();
}

class _KaiserNoticeOfMedicareNonCoverageState extends State<KaiserNoticeOfMedicareNonCoverage> {
  int initialDrawerIndex = 0;
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
              (subform) =>
              SideDrawerItem(
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
                (subFormElement) =>
            subFormElement.subFormID == subform!.subFormID);
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
      itemTitle: 'Page 1',
      widget: OasisFormBuilder(formId: 61, subFormId: 69),
    ),SideDrawerItem(
      itemTitle: 'Page 2',
      widget: OasisFormBuilder(formId: 61, subFormId: 0),
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

