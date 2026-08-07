import 'package:clinician_app/pages/oasis_form_builder/services/api/managers/patient_form_manager.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_item.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/patient_profile_widget.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/tablet_app_bar.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/not_attempted_questions_overlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constant/constant_import.dart';
import 'constants/app_text_style.dart';
import 'constants/responsive.dart';
import 'data/patient_form_data.dart';
import 'forms/oasis_rn_start_of_care/static_screens/wound_screen.dart';
import 'forms/oasis_st_start_of_care/static_screens/static_functional_assessment.dart';
import 'model/chart_patient_referral_data_model.dart';
import 'model/patient_form_model.dart';
import 'oasis_form_builder.dart';

class OasisFormMapper extends StatefulWidget {
  final PatientForm form;
  final PatientSubForm subForm;
  final ChartPatientReferral patient;
  String userRole;
  String lastFormFillByAssist;
  int visitId;
  final String appBarString;
  String formStatus;

   OasisFormMapper({
    super.key,
    required this.form,
    required this.subForm,
    required this.patient,
    this.userRole = "",
     this.formStatus = "",
     required this.appBarString,
     this.lastFormFillByAssist = "Clinitian",
      this.visitId = 0,
  });

  @override
  State<OasisFormMapper> createState() => _OasisFormMapperState();
}

class _OasisFormMapperState extends State<OasisFormMapper> {
  List<SideDrawerItem> sideDrawerItems = [];
  int initialDrawerIndex = 0;

  bool isLoading = true;

  late PatientForm form;
  late PatientSubForm subform;
  late ChartPatientReferral patient;

  @override
  void initState() {
    super.initState();
    //Initializing Data
    form = widget.form;
    subform = widget.subForm;
    patient = widget.patient;
    print("Patinetdob ${patient.dateOfBirth}");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _buildSidebarAndInit(form);
    });

    //Constructing Sidebar Items
    Future.delayed(Duration.zero).then((_) {
      sideDrawerItems = form.subForms
          .map(
            (subform) => _buildSidebarItem(form, subform),
          )
          .toList();

      final subFormIndex = form.subForms.indexWhere(
          (subFormElement) => subFormElement.subFormID == subform.subFormID);
      initialDrawerIndex = subFormIndex == -1 ? 0 : subFormIndex;

      final sideDrawerProvider =
          Provider.of<SideDrawerProvider>(context, listen: false);
      sideDrawerProvider.updateSideBarItem(sideDrawerItems[initialDrawerIndex]);
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> _reloadFormMapper(int? formId) async {
    if (!mounted) return;

    setState(() => isLoading = true);

    try {
      // Fetch fresh form data from API
      final result = await getPatientFormByPatientID(
        context,
        patientFormId: formId == 0 ? widget.subForm.patientFormID : formId!, // or however you store patientFormID
      );


      if (!mounted) return;

      // Rebuild sidebar items from fresh data
      final updatedForm = PatientForm(
        formID: result.formId,
        formName: result.formName,
        fillStatus: result.status,
        subForms: result.subForms
            .map((e) => PatientSubForm(
          formID: result.formId,
          subFormID: e.id,
          subFormName: e.subFormName,
          patientFormID: result.patientFormId,
          fillStatus: e.isFilled,
          commentCount: e.comment_count,
        ))
            .toList(),
      );

      setState(() => form = updatedForm);         // 👈 update form reference
      _buildSidebarAndInit(updatedForm);
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
      // optionally show error snackbar
    }
  }

  void _buildSidebarAndInit(PatientForm targetForm) {
    if (!mounted) return;

    final sideDrawerProvider =
    Provider.of<SideDrawerProvider>(context, listen: false);

    sideDrawerItems = targetForm.subForms
        .map((subform) => _buildSidebarItem(targetForm, subform))
        .toList();

    final subFormIndex = targetForm.subForms.indexWhere(
          (s) => s.subFormID == subform.subFormID,
    );
    initialDrawerIndex = subFormIndex == -1 ? 0 : subFormIndex;

    sideDrawerProvider.updateSideBarItem(sideDrawerItems[initialDrawerIndex]);

    setState(() => isLoading = false);
  }

  // // Add this method to _OasisFormMapperState
  // void _reloadFormMapper() {
  //   if (!mounted) return;
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   final sideDrawerProvider = Provider.of<SideDrawerProvider>(context, listen: false);
  //
  //   sideDrawerItems = form.subForms
  //       .map((subform) => _buildSidebarItem(form, subform))
  //       .toList();
  //
  //   final subFormIndex = form.subForms.indexWhere(
  //         (s) => s.subFormID == subform.subFormID,
  //   );
  //   initialDrawerIndex = subFormIndex == -1 ? 0 : subFormIndex;
  //
  //   sideDrawerProvider.updateSideBarItem(sideDrawerItems[initialDrawerIndex]);
  //
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        padding: const EdgeInsets.all(15),
        width: 350,
        color: AppColors.primaryAppColor,
        child: CustomSideDrawer(
          drawerItems: sideDrawerItems,
          patient: patient,
        ),
      ),
      endDrawer: const NonAttemptedQuestions(),
      drawerScrimColor: Colors.transparent,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 100),
        child: Responsive(
          tablet: TabletAppBar(
            headingText: widget.appBarString,
            openDrawer: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ), desktop: SizedBox(),
          
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  size: 12,
                                  color: AppColors.greyShade400,
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  'Back',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        PatientProfileWidget(
                          "${patient.firstName} ${patient.lastName}",
                          patient.imageUrl,
                          patient.dateOfBirth,
                          chartNumber:
                          patient.chartNo.toString(),
                        ),
                        Expanded(
                          flex: 12,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: width/6,
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

  SideDrawerItem _buildSidebarItem(PatientForm form, PatientSubForm subForm) {
    //Return Static Screens Here With Their Case. [Case is Subform ID]
    switch (subForm.subFormID) {
      case 19:
      case 164:
      case 300:
      case 539:
      case 701:
      case 760:
      case 892:
      case 998:
        return SideDrawerItem(
          itemTitle: subForm.subFormName,
          widget: WoundScreen(
            subFormId: subForm.subFormID,
            formId: form.formID,
            patientFormID: subForm.patientFormID,
            formTitle: subForm.subFormName,
            templateName: form.formName,
          ),
          commentCount: subForm.commentCount
        );
      case 129:
      case 271:
      case 407:
      case 591:
      case 659:
      case 867:
      case 972:
      case 1082:
        return SideDrawerItem(
          itemTitle: subForm.subFormName,
          widget: StaticFunctionalAssessment(
            subFormId: subForm.subFormID,
            formId: form.formID,
            patientFormID: subForm.patientFormID,
            formTitle: subForm.subFormName,
            templateName: form.formName,
          ),
          commentCount: subForm.commentCount
        );
      default:
        return SideDrawerItem(
          itemTitle: subForm.subFormName,
          widget: OasisFormBuilder(
            subFormId: subForm.subFormID,
            formId: form.formID,
            patientFormID: subForm.patientFormID,
            formTitle: subForm.subFormName,
            templateName: form.formName,
            userRole: widget.userRole,
            onOrderAdded:(newFormId)=> _reloadFormMapper(newFormId),
            formStatus: widget.formStatus,
            lastFormFillByAssist: widget.lastFormFillByAssist,
            visitId: widget.visitId,
            onFormChange: (nextFormId){
              _reloadFormMapper(nextFormId);
              widget.lastFormFillByAssist = "Clinician";
           }
          ),
          commentCount:  subForm.commentCount


        );
    }
  }

  Widget _getNonAttemptedWidget(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      onTap: () {
        _scaffoldKey.currentState!.openEndDrawer();
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        padding: const EdgeInsets.only(top: 56, bottom: 56, right: 8, left: 8),
        // alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.primaryAppColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: RotatedBox(
          quarterTurns: 1, // Rotates 90 degrees clockwise
          child: Text(
            'Not Attempted Questions',
            style:
                FormBuilderTextStyle.bold10Style.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
