import 'package:flutter/material.dart';
import '../../../constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/oasis_form_builder.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_item.dart';
import 'package:provider/provider.dart';

import '../../../side_drawer/side_drawer_provider.dart';
import '../../../ui_components/patient_profile_widget.dart';
import '../../../ui_components/tablet_app_bar.dart';


class OccupationalTherapyDischargeSummaryNonVisitHome extends StatefulWidget {
  const OccupationalTherapyDischargeSummaryNonVisitHome({super.key});

  @override
  State<OccupationalTherapyDischargeSummaryNonVisitHome> createState() => _OccupationalTherapyDischargeSummaryNonVisitHomeState();
}

class _OccupationalTherapyDischargeSummaryNonVisitHomeState extends State<OccupationalTherapyDischargeSummaryNonVisitHome> {
  final int initialDrawerIndex = 0;
  bool isLoading = true;
  GlobalKey notAttemptedWidgetKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      drawer: Container(
        padding: const EdgeInsets.all(15),
        width: 350,
        color: AppColors.primaryAppColor,
        child: CustomSideDrawer(drawerItems: sideDrawerItems),
      ),
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
            /* _getNonAttemptedWidget(),*/
          ],
        ),
      ),
    );
  }

    

  List<SideDrawerItem> sideDrawerItems = [
    SideDrawerItem(
      itemTitle: 'Supervision',
      widget: OasisFormBuilder(formId: 20, subFormId: 38),
    ),
    SideDrawerItem(
      itemTitle: 'Discharge Summary',
      widget: OasisFormBuilder(formId: 20, subFormId: 39),
    ),
    SideDrawerItem(
      itemTitle: 'Summary Sent To',
      widget: OasisFormBuilder(formId: 20, subFormId: 40),
    ),
  ];
}
