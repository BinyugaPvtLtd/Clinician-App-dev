import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clinician_app/pages/oasis_form_builder/chart_patient_form_selection_screen.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/services/api/managers/form_builder_manager.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/custom_search_bar.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/tablet_app_bar.dart';

import 'constants/responsive.dart';
import 'model/chart_patient_referral_data_model.dart';

class ChartPatientSelectionScreen extends StatefulWidget {
  final String userRole;
  const ChartPatientSelectionScreen({super.key, required this.userRole});

  @override
  State<ChartPatientSelectionScreen> createState() =>
      _ChartPatientSelectionScreenState();
}

class _ChartPatientSelectionScreenState
    extends State<ChartPatientSelectionScreen> {
  TextEditingController searchController = TextEditingController();
  List<ChartPatientReferral> patients = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      await loadData();
      //TODO Remove In PROD
      // Future.delayed(Duration.zero).then((_) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (ctx) =>
      //           ChartPatientFormSelectionScreen(patientData: patients[1]),
      //     ),
      //   );
      // });
      //TODO Till Here
    });
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (!isLoading &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      if (nextPage != -1) {
        await loadData();
      }
    }
  }

  bool isLoading = false;
  int nextPage = 1;

  void resetPaginationData() {
    nextPage = 1;
  }

  Future<void> loadData({String? searchString}) async {
    if (nextPage == 1) {
      patients.clear();
    }
    setState(() {
      isLoading = true;
    });
    final patientData = await FormBuilderManager().getAllPatientReferral(
      context,
      page: nextPage,
      perPage: 20,
      patientName: searchString,
    );

    patients.addAll(patientData["patients"].cast<ChartPatientReferral>());
    if (patientData["nextPageAvailable"]) {
      nextPage++;
    } else {
      nextPage = -1;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Responsive(
                tablet: TabletAppBar(
                  headingText: 'Patient Charts',
                  openDrawer: () {},
                  showDrawer: false,
                ),
                desktop:  TabletAppBar(
            headingText: 'Patient Charts',
            openDrawer: () {},
            showDrawer: false,
          ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding:  EdgeInsets.all(20),
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Patient List',
                          style: FormBuilderTextStyle.bold14style
                              .copyWith(color: Colors.black),
                        ),
                        sbh(10),
                        CustomSearchBar(
                          searchController: searchController,
                          onChanged: (searchString) async {
                            resetPaginationData();
                            await loadData(searchString: searchString);
                          },
                          onDismiss: () {
                            searchController.clear();
                            resetPaginationData();
                            loadData();
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          hintText: "Search Patient Name",
                          backgroundColor: AppColors.grey50,
                          borderColor: AppColors.textFieldBorderColor,
                          borderRadius: 5,
                        ),
                        sbh(10),
                        Expanded(
                          child: isLoading && patients.isEmpty
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : patients.isEmpty
                                  ? Center(
                                      child: Text(
                                        'No Patient Founds!',
                                        style:
                                            FormBuilderTextStyle.normal10style,
                                      ),
                                    )
                                  : ListView.separated(
                                      controller: _scrollController,
                                      itemBuilder: (ctx, index) {
                                        return Column(
                                          children: [
                                            PatientListTile(
                                              patient: patients[index],
                                              userRole: widget.userRole,
                                            ),
                                            if (isLoading &&
                                                patients.length - 1 == index)
                                              const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                          ],
                                        );
                                      },
                                      itemCount: patients.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Divider(
                                          color: AppColors.textFieldBorderColor,
                                          height: 20.h,
                                        );
                                      },
                                    ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // const BottomBarRow()
            ],
          ),
        ],
      ),
    );
  }
}

class PatientListTile extends StatelessWidget {
  final ChartPatientReferral patient;
  final String userRole;
  const PatientListTile({super.key, required this.patient, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(23.r),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (ctx) => ChartPatientFormSelectionScreen(
        //       patientData: patient,
        //       userRole: userRole,
        //     ),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 10.w,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                imageUrl: patient.imageUrl,
                width: 60.w,
                height: 60.w,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "${patient.firstName} ${patient.lastName}  |  ",
                      children: [
                        TextSpan(
                          text: patient.patientId.toString(),
                          style: FormBuilderTextStyle.bold14style.copyWith(
                            color: AppColors.primaryAppLightColor,
                          ),
                        ),
                      ],
                      style: FormBuilderTextStyle.bold14style
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  Wrap(
                    spacing: 15.w,
                    children: [
                      _getTitleValueTile(
                          "DOB: ",
                          DateFormat('MMM dd, yyyy')
                              .format(patient.dateOfBirth)),
                      _getTitleValueTile("Phone: ", patient.contactNumber),
                      _getTitleValueTile(
                          "Gender: ",
                          patient.gender == null
                              ? "NA"
                              : patient.gender!.genderName),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getTitleValueTile(String title, String value) {
    return RichText(
      text: TextSpan(
        text: title,
        children: [
          TextSpan(
            text: value,
            style: FormBuilderTextStyle.normal10style.copyWith(
              color: Colors.black,
            ),
          ),
        ],
        style: FormBuilderTextStyle.normal10style,
      ),
    );
  }
}
