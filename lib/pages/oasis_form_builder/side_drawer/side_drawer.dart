import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/responsive.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/custom_search_bar.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_item.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_provider.dart';
import 'package:provider/provider.dart';

import '../constants/constant_import.dart';
import '../model/chart_patient_referral_data_model.dart';
import '../ui_components/patient_profile_widget.dart';

class CustomSideDrawer extends StatefulWidget {
  final List<SideDrawerItem> drawerItems;
  final ChartPatientReferral? patient;

  const CustomSideDrawer({
    super.key,
    required this.drawerItems,
    this.patient,
  });

  @override
  State<CustomSideDrawer> createState() => _CustomSideDrawerState();
}

class _CustomSideDrawerState extends State<CustomSideDrawer> {
  TextEditingController searchController = TextEditingController();
  List<SideDrawerItem> filteredDrawerItems = [];

  @override
  void initState() {
    applyFilter('');
    super.initState();
  }

  late SideDrawerItem activeDrawerItem;

  void applyFilter(String searchTerm) {
    filteredDrawerItems.clear();
    filteredDrawerItems.addAll(
      widget.drawerItems.where(
        (drawerItem) => drawerItem.itemTitle.toLowerCase().contains(
              searchTerm.toLowerCase().trim(),
            ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SideDrawerProvider>(
      builder: (BuildContext context, SideDrawerProvider data, Widget? child) {
        return ListView(
          children: [
            Responsive(
                tablet: PatientProfileWidget(
                  "${widget.patient?.firstName} ${widget.patient?.lastName}",
                  widget.patient?.imageUrl ?? "",
                  widget.patient?.dateOfBirth ?? DateTime.now(),
                ),
                desktop: Container()),
            CustomSearchBar(
                searchController: searchController,
                onChanged: applyFilter,
                onDismiss: () {
                  searchController.clear();
                  applyFilter('');
                }),
            const SizedBox(
              height: 10,
            ),
            ...filteredDrawerItems.map(
              (drawerItem) {
                final isSelected = drawerItem == data.activeSideDrawerItem;
                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    if (!Responsive.isDesktop(context)) {
                      Navigator.pop(context);
                    }
                    data.updateSideBarItem(drawerItem);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: isSelected
                          ? Border.all(color: Colors.white, width: 2)
                          : Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            drawerItem.itemTitle,
                            style: isSelected
                                ? FormBuilderTextStyle.bold10Style
                                .copyWith(color: Colors.white)
                                : FormBuilderTextStyle.normal10style
                                .copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        if (drawerItem.commentCount != 0) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              drawerItem.commentCount.toString(),
                              style: FormBuilderTextStyle.bold10Style
                                  .copyWith(color: AppColors.primaryAppColor),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
