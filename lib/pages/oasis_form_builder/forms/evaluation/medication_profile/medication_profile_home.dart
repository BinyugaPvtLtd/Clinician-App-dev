import '../../../ui_components/tablet_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/oasis_form_builder.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_item.dart';
import 'package:provider/provider.dart';

import '../../../side_drawer/side_drawer_provider.dart';
import '../../../ui_components/patient_profile_widget.dart';

class MedicationProfileHome extends StatefulWidget {
  const MedicationProfileHome({super.key});

  @override
  State<MedicationProfileHome> createState() =>
      _MedicationProfileHomeState();
}

class _MedicationProfileHomeState
    extends State<MedicationProfileHome> {
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
      itemTitle: 'Medication Profile',
      widget: OasisFormBuilder(formId: 74, subFormId: 76),
    ),
  ];
}
