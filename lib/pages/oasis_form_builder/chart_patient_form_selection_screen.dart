// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:clinician_app/pages/oasis_form_builder/model/patient_chart.dart';
// import 'package:clinician_app/pages/oasis_form_builder/services/api/managers/form_builder_manager.dart';
// import 'package:clinician_app/pages/oasis_form_builder/ui_components/tablet_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
//
//
//
// import '../../core/constant/app_colors.dart';
// import 'constants/app_text_style.dart';
// import 'constants/responsive.dart';
// import 'model/chart_patient_referral_data_model.dart';
// import 'model/patient_form_model.dart';
// import 'oasis_form_mapper.dart';
//
// class ChartPatientFormSelectionScreen extends StatefulWidget {
//   final ChartPatientReferral patientData;
//   final String userRole;
//   const ChartPatientFormSelectionScreen({super.key, required this.patientData, required this.userRole});
//
//   @override
//   State<ChartPatientFormSelectionScreen> createState() =>
//       _ChartPatientFormSelectionScreenState();
// }
//
// class _ChartPatientFormSelectionScreenState
//     extends State<ChartPatientFormSelectionScreen> {
//   late ChartPatientReferral patientData;
//   bool isLoading = true;
//   bool isPatientDataLoading = true;
//   int formInitLoadingIndex = -1;
//   Episode? selectedEpisode;
//
//   @override
//   void initState() {
//     patientData = widget.patientData;
//     if (patientData.episodes.isNotEmpty) {
//       selectedEpisode = patientData.episodes.first;
//     }
//     Future.delayed(Duration.zero).then((_) async {
//       await loadChartDataForPatient();
//       await loadFormData();
//     });
//     super.initState();
//   }
//
//   List<PatientForm> filledForms = [];
//   List<PatientForm> forms = [];
//   List<PatientForm> unfilledForms = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.grey100,
//       body: Column(
//         children: [
//           Container(
//             color: Colors.white,
//             child: Responsive(
//               tablet: TabletAppBar(
//                 headingText: 'Patient Charts',
//                 openDrawer: () {},
//                 showDrawer: false,
//               ),
//               desktop:  ApplicationAppBar(
//                 headingText: 'Patient Charts',
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: isPatientDataLoading
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Responsive(
//                       tablet: _getDesktopView(),
//                       desktop: _getDesktopView(),
//                       mobile: ListView(
//                         children: [
//                           Container(
//                             color: Colors.white,
//                             margin: const EdgeInsets.all(10),
//                             padding: const EdgeInsets.all(10),
//                             child: _getProfileWidget(),
//                           ),
//                           Container(
//                             color: Colors.white,
//                             margin: const EdgeInsets.all(10),
//                             padding: const EdgeInsets.all(10),
//                             child: _getFilledFormWidget(),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.all(10),
//                             padding: const EdgeInsets.all(10),
//                             color: Colors.white,
//                             child: _getUnfilledFormWidget(),
//                           )
//                         ],
//                       ),
//                     ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(top: 5),
//             color: Colors.white,
//             child: const BottomBarRow(),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _getDesktopView() {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // Available height in the view (below the app bar)
//         final totalHeight = constraints.maxHeight;
//
//         // Fixed top container height
//         const topContainerHeight = 400.0;
//
//         // Calculate remaining space
//         final remainingHeight =
//             totalHeight - topContainerHeight - 40; // adjust for margin/padding
//
//         // Determine bottom height (min 400)
//         final bottomContainerHeight =
//             remainingHeight > 400 ? remainingHeight : 400.0;
//
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: topContainerHeight,
//                 color: Colors.white,
//                 margin: const EdgeInsets.all(10),
//                 padding: const EdgeInsets.all(20),
//                 child: Row(
//                   children: [
//                     _getProfileWidget(),
//                     SizedBox(
//                       height: 200.h,
//                       child: VerticalDivider(),
//                       width: 30,
//                     ),
//                     Expanded(child: _getFilledFormWidget()),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: bottomContainerHeight,
//                 margin: const EdgeInsets.all(10),
//                 padding: const EdgeInsets.all(20),
//                 color: Colors.white,
//                 child: _getUnfilledFormWidget(),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _getProfileWidget() {
//     return PatientProfileBox(
//       patientData: patientData,
//       onEpisodeChange: (Episode? episode) async {
//         selectedEpisode = episode;
//         await loadFormData();
//       },
//       onChartChange: (PatientChart? chart) async {
//         if (chart == null) {
//           return;
//         }
//         await loadPatientDataOnChartChange(chart.patientId);
//       },
//     );
//   }
//
//   Widget _getFilledFormWidget() {
//     return FormListWidget(
//       title: "Filled Forms",
//       forms: filledForms,
//       isFilledSection: true,
//       isLoading: isLoading,
//       onFillTapped: (form, subForm) {
//         print('subForms in tap ${subForm}');
//         navigateToForm(form, subForm, widget.patientData, true);
//       },
//     );
//   }
//
//   Widget _getUnfilledFormWidget() {
//     return FormListWidget(
//       title: "Unfilled Forms",
//       isFilledSection: false,
//       forms: unfilledForms,
//       isLoading: isLoading,
//       onFillTapped: (form, subForm) async {
//         await processUnfilledFormTap(form, subForm);
//       },
//     );
//   }
//
//   Future<void> processUnfilledFormTap(
//       PatientForm form, PatientSubForm subForm) async {
//     print('form fill ${form.fillStatus}');
//     if (form.fillStatus == "Unknown") {
//       final initForm = await FormBuilderManager().initPatientForm(context,
//           patientID: patientData.patientId,
//           chartID: patientData.chartNo,
//           episodeID: selectedEpisode!.episodeID,
//           formID: form.formID);
//       if (initForm != null) {
//         //Updating Init Form into All Form List
//         forms[forms.indexWhere(
//             (formElement) => formElement.formID == initForm.formID)] = initForm;
//         //Updating Init Form into Unfilled Form List
//         unfilledForms[unfilledForms.indexWhere(
//             (formElement) => formElement.formID == initForm.formID)] = initForm;
//         //Passing Init SubForm
//         subForm = initForm.subForms.firstWhere(
//             (initSubForm) => initSubForm.subFormID == subForm.subFormID);
//         print('Patient form id init ${subForm.patientFormID}');
//         navigateToForm(initForm, subForm, widget.patientData, false);
//       } else {
//         print('Error while init Form');
//       }
//     } else {
//       print('SubForm data in selection ${subForm.toJson()}');
//       navigateToForm(form, subForm, widget.patientData, false);
//     }
//   }
//
//   void navigateToForm(PatientForm form, PatientSubForm subForm,
//       ChartPatientReferral patient, bool isFilled) {
//     print('Patient form id  navigation ${subForm.patientFormID}');
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (ctx) => OasisFormMapper(
//           form: forms.firstWhere(
//             (formElement) => formElement.formID == form.formID,
//           ),
//           subForm: subForm,
//           patient: patient,
//           appBarString: 'Patient-chart',
//           userRole: widget.userRole,
//         ),
//       ),
//     ).then((_) async {
//       await loadFormData();
//     });
//   }
//
//   Future<void> loadPatientDataOnChartChange(int patientId) async {
//     setState(() {
//       isPatientDataLoading = true;
//     });
//     final formBuilderManager = FormBuilderManager();
//     try {
//       final newPatientData = await formBuilderManager
//           .getPatientReferral(context, referralID: patientId);
//       if (newPatientData != null) {
//         patientData = newPatientData;
//         await loadChartDataForPatient();
//         await loadFormData();
//       }
//     } catch (e) {
//       print(e);
//     }
//     setState(() {
//       isPatientDataLoading = false;
//     });
//   }
//
//   Future<void> loadChartDataForPatient() async {
//     setState(() {
//       isPatientDataLoading = true;
//     });
//     final formBuilderManager = FormBuilderManager();
//     try {
//       patientData.charts = await formBuilderManager.getPatientCharts(context,
//           patientId: patientData.patientId);
//     } catch (e) {
//       print(e);
//     }
//     setState(() {
//       isPatientDataLoading = false;
//     });
//   }
//
//   Future<void> loadFormData() async {
//     if (selectedEpisode == null) {
//       setState(() {
//         isLoading = false;
//       });
//       return;
//     }
//     setState(() {
//       isLoading = true;
//     });
//     final formBuilderManager = FormBuilderManager();
//     try {
//       forms = await formBuilderManager.getAllFormsData(context);
//       final formsData = await formBuilderManager.getInitFormData(
//         context,
//         patientID: patientData.patientId,
//         chartID: patientData.chartNo,
//         episodeID: selectedEpisode!.episodeID,
//       );
//       filledForms = formsData['filled'];
//       unfilledForms = formsData['unfilled'];
//       constructAllForms();
//     } catch (e) {
//       print(e);
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   void constructAllForms() {
//     final filledMap = {
//       for (final form in filledForms) form.formID: form.subForms
//     };
//
//     final unfilledMap = {
//       for (final form in unfilledForms) form.formID: form.subForms
//     };
//
//     for (final form in forms) {
//       form.subForms.clear();
//       form.subForms.addAll(filledMap[form.formID] ?? []);
//       form.subForms.addAll(unfilledMap[form.formID] ?? []);
//       form.subForms.sort((a, b) => a.subFormID.compareTo(b.subFormID));
//     }
//   }
// }
//
// class FormListWidget extends StatefulWidget {
//   final Function(PatientForm formID, PatientSubForm subForm) onFillTapped;
//   final String title;
//   final List<PatientForm> forms;
//   final bool isFilledSection;
//   final bool isLoading;
//
//   const FormListWidget({
//     super.key,
//     required this.title,
//     required this.forms,
//     required this.isFilledSection,
//     required this.isLoading,
//     required this.onFillTapped,
//   });
//
//   @override
//   State<FormListWidget> createState() => _FormListWidgetState();
// }
//
// class _FormListWidgetState extends State<FormListWidget> {
//   int isInitLoadingIndex = -1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.title,
//           style: FormBuilderTextStyle.bold14style.copyWith(color: Colors.black),
//         ),
//         const Divider(),
//         Responsive.isMobile(context) ? _getMobileView() : _getDesktopView(),
//       ],
//     );
//   }
//
//   Widget _getMobileView() {
//     return _getListView();
//   }
//
//   Widget _getDesktopView() {
//     return Expanded(
//       child: _getListView(),
//     );
//   }
//
//   Widget _getListView() {
//     if (widget.isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }
//
//     if (widget.forms.isEmpty) {
//       return Center(
//         child: Text(
//           'No ${widget.isFilledSection ? "Filled" : "Unfilled"} Forms Found!',
//           style: FormBuilderTextStyle.normal10style,
//         ),
//       );
//     }
//
//     return Responsive.isMobile(context)
//         ? Column(
//             children: [
//               ...widget.forms.map(
//                 (form) => _getExpansionFormTile(form),
//               ),
//             ],
//           )
//         : ListView.separated(
//             shrinkWrap: true,
//             physics: const AlwaysScrollableScrollPhysics(),
//             itemCount: widget.forms.length,
//             separatorBuilder: (_, __) => const Divider(height: 0),
//             itemBuilder: (ctx, index) {
//               final form = widget.forms[index];
//               return _getExpansionFormTile(form);
//             },
//           );
//   }
//
//   Widget _getExpansionFormTile(PatientForm form) {
//     return ExpansionTile(
//       childrenPadding: EdgeInsets.zero,
//       title: Text(
//         form.formName,
//         style: FormBuilderTextStyle.bold10Style.copyWith(color: Colors.black),
//       ),
//       children: form.subForms.map((subForm) {
//         return ListTile(
//           dense: true,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 15),
//           onTap: widget.isFilledSection
//               ? () => processFilledFormTap(form, subForm)
//               : isInitLoadingIndex == subForm.subFormID
//                   ? null
//                   : () async {
//                       await processUnfilledFormTap(form, subForm);
//                     },
//           title: Text(
//             subForm.subFormName,
//             style: FormBuilderTextStyle.normal10style,
//           ),
//           trailing: widget.isFilledSection
//               ? InkWell(
//                   onTap: () => processFilledFormTap(form, subForm),
//                   child: const Icon(Icons.check_circle_outline_rounded),
//                 )
//               : isInitLoadingIndex == subForm.subFormID
//                   ? const Padding(
//                       padding: EdgeInsets.only(right: 15),
//                       child: SizedBox(
//                         width: 25,
//                         height: 25,
//                         child: CircularProgressIndicator(),
//                       ),
//                     )
//                   : TextButton(
//                       onPressed: () async {
//                         await processUnfilledFormTap(form, subForm);
//                       },
//                       child: Text(
//                         "+ Fill",
//                         style: FormBuilderTextStyle.normal10style.copyWith(
//                           color: AppColors.primaryAppColor,
//                         ),
//                       ),
//                     ),
//         );
//       }).toList(),
//     );
//   }
//
//   void processFilledFormTap(PatientForm form, PatientSubForm subForm) {
//     widget.onFillTapped(form, subForm);
//   }
//
//   Future<void> processUnfilledFormTap(
//       PatientForm form, PatientSubForm subForm) async {
//     setState(() {
//       isInitLoadingIndex = subForm.subFormID;
//     });
//     await widget.onFillTapped(form, subForm);
//     setState(() {
//       isInitLoadingIndex = -1;
//     });
//   }
// }
//
// class PatientProfileBox extends StatelessWidget {
//   final ChartPatientReferral patientData;
//   final Function(Episode? episode) onEpisodeChange;
//   final Function(PatientChart? chart) onChartChange;
//
//   const PatientProfileBox({
//     super.key,
//     required this.patientData,
//     required this.onEpisodeChange,
//     required this.onChartChange,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.grey50,
//         borderRadius: BorderRadius.circular(15.r),
//       ),
//       constraints: BoxConstraints(
//           maxWidth: Responsive.isMobile(context) ? 600.w : 250.w),
//       padding: const EdgeInsets.all(20),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               spacing: 10.w,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(15.r),
//                   child: CachedNetworkImage(
//                     imageUrl: patientData.imageUrl,
//                     width: 80,
//                     height: 80,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Expanded(
//                   child: RichText(
//                     text: TextSpan(
//                       text:
//                           "${patientData.firstName} ${patientData.lastName}  |  ",
//                       children: [
//                         TextSpan(
//                           text: patientData.patientId.toString(),
//                           style: FormBuilderTextStyle.bold14style.copyWith(
//                             color: AppColors.primaryAppLightColor,
//                           ),
//                         ),
//                       ],
//                       style: FormBuilderTextStyle.bold14style
//                           .copyWith(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _getTitleValueTile(
//                     "Gender:  ",
//                     patientData.gender == null
//                         ? 'NA'
//                         : patientData.gender!.genderName),
//                 _getTitleValueTile("DOB:  ",
//                     DateFormat('MMM dd, yyyy').format(patientData.dateOfBirth)),
//               ],
//             ),
//             SizedBox(height: 8),
//             _getTitleValueTile("Phone:  ", patientData.contactNumber),
//             SizedBox(height: 8),
//             _getTitleValueTile(
//               "Address:  ",
//               patientData.address,
//             ),
//             SizedBox(height: 15),
//             CustomDropdown<PatientChart>(
//               key: ValueKey('chartDropdown'),
//               items: patientData.charts,
//               onChanged: onChartChange,
//               initialItem: patientData.charts.isNotEmpty
//                   ? patientData.charts.firstWhere(
//                       (chart) => chart.chartId == patientData.chartNo)
//                   : null,
//               hintText: '(Select)',
//               listItemBuilder: (context, chart, _, __) {
//                 return Text(
//                   "Chart ${chart.chartId}",
//                   style: FormBuilderTextStyle.normal10style,
//                 );
//               },
//               headerBuilder: (context, chart, ___) {
//                 return Text(
//                   "Chart ${chart.chartId}",
//                   style: FormBuilderTextStyle.normal10style
//                       .copyWith(fontWeight: FontWeight.bold),
//                 );
//               },
//               decoration: CustomDropdownDecoration(
//                   closedBorder:
//                       Border.all(color: AppColors.textFieldBorderColor),
//                   closedBorderRadius: BorderRadius.circular(8),
//                   closedFillColor: Colors.transparent,
//                   hintStyle: FormBuilderTextStyle.normal10style),
//               closedHeaderPadding:
//                   const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//             ),
//             SizedBox(height: 15),
//             CustomDropdown<Episode>(
//               items: patientData.episodes,
//               onChanged: onEpisodeChange,
//               initialItem: patientData.episodes.isNotEmpty
//                   ? patientData.episodes.first
//                   : null,
//               hintText: '(Select)',
//               listItemBuilder: (context, option, _, __) {
//                 return Text(
//                   "Episode ${option.episodeID}",
//                   style: FormBuilderTextStyle.normal10style,
//                 );
//               },
//               headerBuilder: (context, option, ___) {
//                 return Text(
//                   "Episode ${option.episodeID}",
//                   style: FormBuilderTextStyle.normal10style
//                       .copyWith(fontWeight: FontWeight.bold),
//                 );
//               },
//               decoration: CustomDropdownDecoration(
//                   closedBorder:
//                       Border.all(color: AppColors.textFieldBorderColor),
//                   closedBorderRadius: BorderRadius.circular(8),
//                   closedFillColor: Colors.transparent,
//                   hintStyle: FormBuilderTextStyle.normal10style),
//               closedHeaderPadding:
//                   const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _getTitleValueTile(String title, String value) {
//     return RichText(
//       text: TextSpan(
//         text: title,
//         children: [
//           TextSpan(
//             text: value,
//             style: FormBuilderTextStyle.normal10style.copyWith(
//               color: Colors.black,
//             ),
//           ),
//         ],
//         style: FormBuilderTextStyle.normal10style,
//       ),
//     );
//   }
// }
