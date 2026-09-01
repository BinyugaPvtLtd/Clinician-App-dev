import '../../../ui_components/tablet_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/oasis_form_builder.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_item.dart';
import 'package:provider/provider.dart';

import '../../../side_drawer/side_drawer_provider.dart';
import '../../../ui_components/patient_profile_widget.dart';

class SkilledNursingVisitNote extends StatefulWidget {
  const SkilledNursingVisitNote({super.key});

  @override
  State<SkilledNursingVisitNote> createState() => _SkilledNursingVisitNoteState();
}

class _SkilledNursingVisitNoteState extends State<SkilledNursingVisitNote> {
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

  final int initialDrawerIndex = 0  ;
  List<SideDrawerItem> sideDrawerItems = [
    SideDrawerItem(
      itemTitle: 'Patient History & Signature',
      widget: OasisFormBuilder(formId: 36, subFormId: 4),
    ),
    SideDrawerItem(
      itemTitle: 'Clinical Record Items',
      widget: OasisFormBuilder(formId: 36, subFormId: 3),
    ),
    SideDrawerItem(
      itemTitle: 'Vital Signs, Height & Weight',
      widget: OasisFormBuilder(formId: 36, subFormId: 8),
    ),
    SideDrawerItem(
      itemTitle: 'Pain',
      widget: OasisFormBuilder(formId: 36, subFormId: 9),
    ),
    SideDrawerItem(
      itemTitle: 'Neurological/Cognitive',
      widget: OasisFormBuilder(formId: 36, subFormId: 12),
    ),
    SideDrawerItem(
      itemTitle: 'Respiratory',
      widget: OasisFormBuilder(formId: 36, subFormId: 15),
    ),
    SideDrawerItem(
      itemTitle: 'Cardiovascular',
      widget: OasisFormBuilder(formId: 36, subFormId: 16),
    ),
    SideDrawerItem(
      itemTitle: 'Genitourinary',
      widget: OasisFormBuilder(formId: 36, subFormId: 17),
    ),
    SideDrawerItem(
      itemTitle: 'Gastrointestinal/Nutrition/Endocrine',
      widget: OasisFormBuilder(formId: 36, subFormId: 18),
    ),SideDrawerItem(
      itemTitle: 'Integumentary/Wound Care',
      widget: OasisFormBuilder(formId: 36, subFormId: 19),
    ),SideDrawerItem(
      itemTitle: 'Musculoskeletal',
      widget: OasisFormBuilder(formId: 36, subFormId: 21),
    ),SideDrawerItem(
      itemTitle: 'Infusion/Lab Draw',
      widget: OasisFormBuilder(formId: 36, subFormId: 26),
    ),SideDrawerItem(
      itemTitle: 'Interventions/ Education Provided',
      widget: OasisFormBuilder(formId: 36, subFormId: 29),
    ),SideDrawerItem(
      itemTitle: 'Assessment Summary',
      widget: OasisFormBuilder(formId: 36, subFormId: 30),
    ),SideDrawerItem(
      itemTitle: 'Supplies',
      widget: OasisFormBuilder(formId: 36, subFormId: 31),
    ),SideDrawerItem(
      itemTitle: 'Care Planning/coordination',
      widget: OasisFormBuilder(formId: 36, subFormId: 33),
    ),SideDrawerItem(
      itemTitle: 'Supervision',
      widget: OasisFormBuilder(formId: 36, subFormId: 38),
    ),
  ];
}
