import '../../ui_components/tablet_app_bar.dart';
import 'package:flutter/material.dart';
import '../../constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/forms/oasis_rn_start_of_care/static_screens/wound_screen.dart';
import 'package:clinician_app/pages/oasis_form_builder/oasis_form_builder.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/patient_profile_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_item.dart';
import 'package:provider/provider.dart';

import '../../model/chart_patient_referral_data_model.dart';
import '../../model/patient_form_model.dart';
import '../../side_drawer/side_drawer_provider.dart';

class OasisRnResumptionOfCare extends StatefulWidget {
  final PatientForm? form;
  final PatientSubForm? subForm;
  final ChartPatientReferral? patient;

  const OasisRnResumptionOfCare({
    super.key,
    this.form,
    this.subForm,
    this.patient,
  });

  @override
  State<OasisRnResumptionOfCare> createState() =>
      _OasisRnResumptionOfCareState();
}

class _OasisRnResumptionOfCareState extends State<OasisRnResumptionOfCare> {
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
      backgroundColor: Colors.white,
      appBar:  PreferredSize(
        preferredSize: Size(double.maxFinite, 100),
        child: TabletAppBar(
            headingText: 'EMR Home Health',
            openDrawer: () {},
            showDrawer: false,
          ),
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : Row(
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
                          child: CustomSideDrawer(drawerItems: sideDrawerItems),
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
                 
              ],
            ),
    );
  }

  List<SideDrawerItem> sideDrawerItems = [
    SideDrawerItem(
      itemTitle: 'Administrative Information',
      widget: OasisFormBuilder(formId: 6, subFormId: 2),
    ),
    SideDrawerItem(
      itemTitle: 'Clinical Record Items',
      widget: OasisFormBuilder(formId: 6, subFormId: 3),
    ),
    SideDrawerItem(
      itemTitle: 'Patient History/Immunization',
      widget: OasisFormBuilder(formId: 6, subFormId: 4),
    ),
    SideDrawerItem(
      itemTitle: 'Living Arrangements',
      widget: OasisFormBuilder(formId: 6, subFormId: 5),
    ),
    SideDrawerItem(
      itemTitle: 'Assistance',
      widget: OasisFormBuilder(formId: 6, subFormId: 6),
    ),
    SideDrawerItem(
      itemTitle: 'Safety Hazards/Emergency Plan',
      widget: OasisFormBuilder(formId: 6, subFormId: 7),
    ),
    SideDrawerItem(
      itemTitle: 'Vital Signs/Pain/Height & Weight',
      widget: OasisFormBuilder(formId: 6, subFormId: 8),
    ),
    SideDrawerItem(
      itemTitle: 'Pain',
      widget: OasisFormBuilder(formId: 6, subFormId: 9),
    ),
    SideDrawerItem(
      itemTitle: 'Hearing/Speech/Vision',
      widget: OasisFormBuilder(formId: 6, subFormId: 10),
    ),
    SideDrawerItem(
      itemTitle: 'BIMS',
      widget: OasisFormBuilder(formId: 6, subFormId: 11),
    ),
    SideDrawerItem(
      itemTitle: 'Neurological/Cognitive Patterns',
      widget: OasisFormBuilder(formId: 6, subFormId: 12),
    ),
    SideDrawerItem(
      itemTitle: 'Mood',
      widget: OasisFormBuilder(formId: 6, subFormId: 13),
    ),
    SideDrawerItem(
      itemTitle: 'Behavior / Risk Factors',
      widget: OasisFormBuilder(formId: 6, subFormId: 14),
    ),
    SideDrawerItem(
      itemTitle: 'Respiratory',
      widget: OasisFormBuilder(formId: 6, subFormId: 15),
    ),
    SideDrawerItem(
      itemTitle: 'Cardiovascular',
      widget: OasisFormBuilder(formId: 6, subFormId: 16),
    ),
    SideDrawerItem(
      itemTitle: 'Genitourinary',
      widget: OasisFormBuilder(formId: 6, subFormId: 17),
    ),
    SideDrawerItem(
      itemTitle: 'Gastrointestinal/Nutrition/Endocrine',
      widget: OasisFormBuilder(formId: 6, subFormId: 18),
    ),
    SideDrawerItem(
      itemTitle: 'Integumentary/Wound Care',
      widget: WoundScreen(formId: 6, subFormId: 19),
    ),
    SideDrawerItem(
      itemTitle: 'Ulcers/Surgical Wounds',
      widget: OasisFormBuilder(formId: 6, subFormId: 20),
    ),
    SideDrawerItem(
      itemTitle: 'Musculoskeletal',
      widget: OasisFormBuilder(formId: 6, subFormId: 21),
    ),
    SideDrawerItem(
      itemTitle: 'Functional Status',
      widget: OasisFormBuilder(formId: 6, subFormId: 22),
    ),
    SideDrawerItem(
      itemTitle: 'Functional Abilities and Goals',
      widget: OasisFormBuilder(formId: 6, subFormId: 23),
    ),
    SideDrawerItem(
      itemTitle: 'Fall Risk/ Therapy Need',
      widget: OasisFormBuilder(formId: 6, subFormId: 24),
    ),
    SideDrawerItem(
      itemTitle: 'Medications',
      widget: OasisFormBuilder(formId: 6, subFormId: 25),
    ),
    SideDrawerItem(
      itemTitle: 'Infusion/Lab Draw',
      widget: OasisFormBuilder(formId: 6, subFormId: 26),
    ),
    SideDrawerItem(
      itemTitle: 'Special Treatment, Procedures, And Programs',
      widget: OasisFormBuilder(formId: 6, subFormId: 27),
    ),
    SideDrawerItem(
      itemTitle: 'Rehospitalization Risk',
      widget: OasisFormBuilder(formId: 6, subFormId: 28),
    ),
    SideDrawerItem(
      itemTitle: 'Interventions/Education Provided',
      widget: OasisFormBuilder(formId: 6, subFormId: 29),
    ),
    SideDrawerItem(
      itemTitle: 'Assessment Summary',
      widget: OasisFormBuilder(formId: 6, subFormId: 30),
    ),
    SideDrawerItem(
      itemTitle: 'Supplies',
      widget: OasisFormBuilder(formId: 6, subFormId: 31),
    ),
    SideDrawerItem(
      itemTitle: 'Plan Of Care',
      widget: OasisFormBuilder(formId: 6, subFormId: 32),
    ),
    SideDrawerItem(
      itemTitle: 'Care Planning/Coordination',
      widget: OasisFormBuilder(formId: 6, subFormId: 33),
    ),
    SideDrawerItem(
      itemTitle: 'Diagnosis Codes',
      widget: OasisFormBuilder(formId: 6, subFormId: 34),
    ),
  ];
}
