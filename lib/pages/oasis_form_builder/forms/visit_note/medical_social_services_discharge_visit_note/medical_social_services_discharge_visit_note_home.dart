import '../../../ui_components/tablet_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/oasis_form_builder.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_item.dart';
import 'package:provider/provider.dart';

import '../../../side_drawer/side_drawer_provider.dart';
import '../../../ui_components/patient_profile_widget.dart';

class MedicalSocialServicesDischargeVisitNote extends StatefulWidget {
  const MedicalSocialServicesDischargeVisitNote({super.key});

  @override
  State<MedicalSocialServicesDischargeVisitNote> createState() => _MedicalSocialServicesDischargeVisitNoteState();
}

class _MedicalSocialServicesDischargeVisitNoteState extends State<MedicalSocialServicesDischargeVisitNote> {
  bool isLoading = true;
  GlobalKey notAttemptedWidgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      final sideDrawerProvider =
          Provider.of<SideDrawerProvider>(context, listen: false);
      sideDrawerProvider.updateSideBarItem(sideDrawerItems[initialDrawerIndex]);
      setState(() {
        isLoading = false;
      });
    });
  }

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

  final int initialDrawerIndex = 0;
  List<SideDrawerItem> sideDrawerItems = [
    SideDrawerItem(
      itemTitle: 'Patient History & Signature',
      widget: OasisFormBuilder(formId: 67, subFormId: 4),
    ),
    SideDrawerItem(
      itemTitle: 'Clinical Record Items',
      widget: OasisFormBuilder(formId: 67, subFormId: 3),
    ),
    SideDrawerItem(
      itemTitle: 'Interventions/Education Provided',
      widget: OasisFormBuilder(formId: 67, subFormId: 29),
    ),
    SideDrawerItem(
      itemTitle: 'Assessment',
      widget: OasisFormBuilder(formId: 67, subFormId: 30),
    ),
    SideDrawerItem(
      itemTitle: 'Care Planning/Coordination',
      widget: OasisFormBuilder(formId: 67, subFormId: 33),
    ),
    SideDrawerItem(
      itemTitle: 'Discharge Summary',
      widget: OasisFormBuilder(formId: 67, subFormId: 39),
    ),
    SideDrawerItem(
      itemTitle: 'Summary Sent To',
      widget: OasisFormBuilder(formId: 67, subFormId: 40),
    ),
  ];
}
