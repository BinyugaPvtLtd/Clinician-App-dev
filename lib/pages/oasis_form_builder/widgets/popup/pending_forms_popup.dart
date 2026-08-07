// import 'package:flutter/material.dart';
// import '../../../../services/token_manager/token_manager_service.dart';
// import '../../constants/constant_import.dart';
//
// // ── Add these imports for _onTap navigation ───────────────────────────────────
// import '../../model/chart_patient_referral_data_model.dart';
// import '../../model/patient_form_model.dart';
// import '../../oasis_form_mapper.dart';
// import '../../services/api/managers/patient_form_manager.dart';
//
// // ─── Color Constants ───────────────────────────────────────────────────────────
//
// const Color _kPrimaryBlue = Color(0xFF1EB0D9);
// const Color _kHeaderBg    = Color(0xFFEAF4F9);
// const Color _kDivider     = Color(0xFFDDE6EC);
// const Color _kBodyText    = Color(0xFF3D3D3D);
// const Color _kLightText   = Color(0xFF6B7280);
//
// const int _kItemsPerPage = 5;
//
// // ─── Badge Color Helper ───────────────────────────────────────────────────────
//
// Color _badgeColorForType(String abbreviation) {
//   switch (abbreviation.toUpperCase()) {
//     case 'PTA':
//       return const Color(0xFFE91E63);
//     case 'COTA':
//       return const Color(0xFF9C27B0);
//     case 'HHA':
//       return const Color(0xFF1565C0);
//     default:
//       return const Color(0xFF607D8B);
//   }
// }
//
// // ─── Main Widget ──────────────────────────────────────────────────────────────
//
// class PendingReviewFormPopup extends StatefulWidget {
//   final int visitId;
//   final int patientId;
//   final bool isLastEpisode;
//   final VisitPrefillByIdModel visitData;
//   const PendingReviewFormPopup({
//     super.key,
//     required this.visitId,
//     required this.patientId,
//     required this.isLastEpisode, required this.visitData,
//   });
//
//   @override
//   State<PendingReviewFormPopup> createState() => _PendingReviewFormPopupState();
// }
//
// class _PendingReviewFormPopupState extends State<PendingReviewFormPopup> {
//   int currentPage = 1;
//   final int itemsPerPage = _kItemsPerPage;
//
//   // Controls the initial data-fetch skeleton (hides the whole table)
//   bool _isLoading = true;
//
//   // Controls the Review-button spinner overlay (table stays visible)
//   bool _isReviewLoading = false;
//
//   // Which patientFormId is currently being reviewed (to highlight the row)
//   int? _reviewingFormId;
//
//   String? _errorMessage;
//   List<PendingReviewAssistanceForm> items = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }
//
//   // ─── Initial data fetch ─────────────────────────────────────────────────────
//
//   Future<void> _loadData() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });
//
//     try {
//       final result = await getEmrPendingReviewForm(
//         context: context,
//         patientId: widget.patientId,
//       );
//       if (mounted) {
//         setState(() {
//           items = result;
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       if (mounted) {
//         setState(() {
//           _errorMessage = 'Failed to load pending forms.';
//           _isLoading = false;
//         });
//       }
//     }
//   }
//
//   // ─── Review tap handler ─────────────────────────────────────────────────────
//
//   Future<void> _onReviewPressed(
//       PendingReviewAssistanceForm item, int visitId) async {
//     // Prevent double-tap while a review is already in flight
//     if (_isReviewLoading) return;
//
//     await _onTap(
//       ptId: item.patientId,
//       patientFormId: item.patientFormId,
//       visitId: visitId,
//       lastFormFillByAssist: 'assistant',
//     );
//   }
//
//   Future<void> _onTap({
//     required int patientFormId,
//     required int ptId,
//     required int visitId,
//     required String lastFormFillByAssist,
//   }) async {
//     // ── Show a small overlay spinner; keep the table intact ──────────────────
//     setState(() {
//       _isReviewLoading  = true;
//       _reviewingFormId  = patientFormId;
//     });
//
//     try {
//       final result = await getPatientFormByPatientID(
//         context,
//         patientFormId: patientFormId,
//       );
//
//       final String userRole = await TokenManager.getUserStatus();
//
//       if (!mounted) return;
//
//       // Clear the overlay spinner before doing anything with the Navigator
//       setState(() {
//         _isReviewLoading = false;
//         _reviewingFormId = null;
//       });
//
//       // Guard: bail out if result is null
//       if (result == null) {
//         debugPrint('_onTap: result is null — aborting navigation');
//         return;
//       }
//
//       // Close this popup, then push the form screen
//       Navigator.pop(context);
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => OasisFormMapper(
//             form: PatientForm(
//               formID: result.formId,
//               formName: result.formName,
//               fillStatus: result.status,
//               subForms: result.subForms
//                   .map(
//                     (e) => PatientSubForm(
//                   formID: result.formId,
//                   subFormID: e.id,
//                   subFormName: e.subFormName,
//                   patientFormID: result.patientFormId,
//                   fillStatus: e.isFilled,
//                   commentCount: e.comment_count,
//                 ),
//               )
//                   .toList(),
//             ),
//             subForm: PatientSubForm(
//               formID: result.formId,
//               subFormID:
//               result.subForms.isNotEmpty ? result.subForms.first.id : 0,
//               subFormName: result.subForms.isNotEmpty
//                   ? result.subForms.first.subFormName
//                   : '',
//               patientFormID: result.patientFormId,
//               commentCount: result.subForms.isNotEmpty
//                   ? result.subForms.first.comment_count
//                   : 0,
//               fillStatus: result.subForms.isNotEmpty
//                   ? result.subForms.first.isFilled
//                   : false,
//             ),
//             patient: ChartPatientReferral(
//               patientId: ptId,
//               firstName: result.referralData.patientFirstname,
//               lastName: result.referralData.patientLastname,
//               contactNumber: result.referralData.patientPhone,
//               address: result.referralData.patientAddress,
//               imageUrl: result.referralData.patientImageUrl,
//               gender: Gender(genderID: 1, genderName: 'Male'),
//               dateOfBirth:
//               DateTime.tryParse(result.referralData.patientDob ?? '') ??
//                   DateTime.now(),
//               chartNo: result.referralData.patientChartNo,
//               episodes: [],
//             ),
//             appBarString: 'EMR - Clinical',
//             userRole: userRole,
//             lastFormFillByAssist: lastFormFillByAssist,
//             visitId: visitId,
//           ),
//         ),
//       );
//     } catch (e, stack) {
//       debugPrint('_onTap error: $e\n$stack');
//       if (mounted) {
//         setState(() {
//           _isReviewLoading = false;
//           _reviewingFormId = null;
//         });
//       }
//     }
//   }
//
//   // ─── Pagination helper ──────────────────────────────────────────────────────
//
//   List<PendingReviewAssistanceForm> get _pagedItems {
//     final start = (currentPage - 1) * itemsPerPage;
//     final end = (start + itemsPerPage).clamp(0, items.length);
//     return items.sublist(start, end);
//   }
//
//   // ─── Build ──────────────────────────────────────────────────────────────────
//
//   @override
//   Widget build(BuildContext context) {
//     return DialogueTemplateNoButtonsColoum(
//       width: AppSize.s800,
//       height: AppSize.s700,
//       title: 'Pending Forms',
//       body: [
//         // ── Table scrolls inside a fixed-height box ────────────────────────
//         SizedBox(
//           height: 430,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
//             child: Column(
//               children: [
//                 _TableHeader(),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: _buildTableBody(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//         // ── Pagination — fixed above buttons ──────────────────────────────
//         if (!_isLoading && _errorMessage == null && items.isNotEmpty)
//           Padding(
//             padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
//             child: PaginationControlsWidget(
//               currentPage: currentPage,
//               items: items,
//               itemsPerPage: itemsPerPage,
//               onPreviousPagePressed: () {
//                 setState(() {
//                   currentPage = currentPage > 1 ? currentPage - 1 : 1;
//                 });
//               },
//               onPageNumberPressed: (pageNumber) {
//                 setState(() {
//                   currentPage = pageNumber;
//                 });
//               },
//               onNextPagePressed: () {
//                 final totalPages = (items.length / itemsPerPage).ceil();
//                 setState(() {
//                   currentPage =
//                   currentPage < totalPages ? currentPage + 1 : totalPages;
//                 });
//               },
//             ),
//           ),
//
//         // ── Cancel / Skip & Continue — always at bottom ───────────────────
//         widget.isLastEpisode == true
//             ? const Offstage() :Padding(
//           padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               CustomButtonTransparent(
//                 width: 110,
//                 height: AppSize.s38,
//                 text: "Cancel",
//                 onPressed: () => Navigator.of(context).pop(true),
//               ),
//               const SizedBox(width: 16),
//               CustomButtonTransparent(
//                 width: 140,
//                 height: AppSize.s38,
//                 text: 'Skip & Continue',
//                 onPressed: () {
//                   Navigator.pop(context);
//                   showDialog(context: context,
//                       builder: (_) =>
//                           ViewStartVisit(
//                             visitData: widget.visitData,
//                             onRefresh: (){},
//                           ));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTableBody() {
//     // ── Loading state (initial fetch only) ────────────────────────────────
//     if (_isLoading) {
//       return const SizedBox(
//         height: 200,
//         child: Center(
//           child: CircularProgressIndicator(color: _kPrimaryBlue),
//         ),
//       );
//     }
//
//     // ── Error state ────────────────────────────────────────────────────────
//     if (_errorMessage != null) {
//       return SizedBox(
//         height: 200,
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Icon(Icons.error_outline, color: Colors.redAccent, size: 36),
//               const SizedBox(height: 8),
//               Text(
//                 _errorMessage!,
//                 style: const TextStyle(fontSize: 13, color: _kLightText),
//               ),
//               const SizedBox(height: 12),
//               TextButton(
//                 onPressed: _loadData,
//                 child: const Text(
//                   'Retry',
//                   style: TextStyle(color: _kPrimaryBlue),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//
//     // ── Empty state ────────────────────────────────────────────────────────
//     if (items.isEmpty) {
//       return const SizedBox(
//         height: 200,
//         child: Center(
//           child: Text(
//             'No pending forms found.',
//             style: TextStyle(fontSize: 13, color: _kLightText),
//           ),
//         ),
//       );
//     }
//
//     // ── Populated list ─────────────────────────────────────────────────────
//     return ListView.separated(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//       itemCount: _pagedItems.length,
//       separatorBuilder: (_, __) => Divider(
//         height: 1,
//         thickness: 1,
//         color: _kDivider,
//       ),
//       itemBuilder: (context, index) {
//         final item = _pagedItems[index];
//         final isBeingReviewed = _reviewingFormId == item.patientFormId;
//         return _TableRow(
//           item: item,
//           isBeingReviewed: isBeingReviewed,
//           onReviewPressed: () => _onReviewPressed(item, item.visitId),
//         );
//       },
//     );
//   }
// }
//
// // ─── Table Header ─────────────────────────────────────────────────────────────
//
// class _TableHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//       decoration: BoxDecoration(
//         color: _kHeaderBg,
//         borderRadius: BorderRadius.circular(3),
//       ),
//       child: const Row(
//         children: [
//           _HeaderCell(label: 'Form Name',      flex: 4),
//           _HeaderCell(label: 'Assistant Name', flex: 4, center: true),
//           _HeaderCell(label: 'Action',         flex: 2, center: true),
//         ],
//       ),
//     );
//   }
// }
//
// class _HeaderCell extends StatelessWidget {
//   final String label;
//   final int flex;
//   final bool center;
//
//   const _HeaderCell({
//     required this.label,
//     required this.flex,
//     this.center = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: flex,
//       child: Text(
//         label,
//         textAlign: center ? TextAlign.center : TextAlign.left,
//         style: const TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.w600,
//           color: _kBodyText,
//           letterSpacing: 0.1,
//         ),
//       ),
//     );
//   }
// }
//
// // ─── Table Row ────────────────────────────────────────────────────────────────
//
// class _TableRow extends StatelessWidget {
//   final PendingReviewAssistanceForm item;
//   final VoidCallback onReviewPressed;
//   // When true, the Review button shows a mini spinner instead of text
//   final bool isBeingReviewed;
//
//   const _TableRow({
//     required this.item,
//     required this.onReviewPressed,
//     this.isBeingReviewed = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//       child: Row(
//         children: [
//           // Form Name
//           Expanded(
//             flex: 4,
//             child: Text(
//               item.formName,
//               style: const TextStyle(fontSize: 13, color: _kBodyText),
//             ),
//           ),
//           // Assistant Name
//           Expanded(
//             flex: 3,
//             child: _ClinicianCell(item: item),
//           ),
//           // Action
//           Expanded(
//             flex: 2,
//             child: Center(
//               child: _ReviewButton(
//                 onPressed: onReviewPressed,
//                 isLoading: isBeingReviewed,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // ─── Clinician Cell ───────────────────────────────────────────────────────────
//
// class _ClinicianCell extends StatelessWidget {
//   final PendingReviewAssistanceForm item;
//
//   const _ClinicianCell({required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     final abbreviation = item.assistantEmployeeTypeAbbreviation;
//     final badgeColor = _badgeColorForType(abbreviation);
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(
//           width: 44,
//           height: 44,
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               // Avatar: network image with person fallback
//               CircleAvatar(
//                 radius: 20,
//                 backgroundColor: const Color(0xFFD0C8C0),
//                 backgroundImage: item.assistantImage.isNotEmpty
//                     ? NetworkImage(item.assistantImage)
//                     : null,
//                 child: item.assistantImage.isEmpty
//                     ? const Icon(Icons.person, size: 22, color: Colors.white)
//                     : null,
//               ),
//               // Role badge
//               if (abbreviation.isNotEmpty)
//                 Positioned(
//                   bottom: -4,
//                   right: -4,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 5,
//                       vertical: 2,
//                     ),
//                     decoration: BoxDecoration(
//                       color: badgeColor,
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: Text(
//                       abbreviation,
//                       style: const TextStyle(
//                         fontSize: 8,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white,
//                         letterSpacing: 0.3,
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//
//         const SizedBox(width: 10),
//         Flexible(
//           child: Text(
//             item.assistantName,
//             style: const TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.w600,
//               color: _kBodyText,
//             ),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// // ─── Review Button ────────────────────────────────────────────────────────────
//
// class _ReviewButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   // When true, show a small spinner in place of the label
//   final bool isLoading;
//
//   const _ReviewButton({
//     required this.onPressed,
//     this.isLoading = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: isLoading ? null : onPressed,
//       child: isLoading
//           ? const SizedBox(
//         width: 16,
//         height: 16,
//         child: CircularProgressIndicator(
//           strokeWidth: 2,
//           color: _kPrimaryBlue,
//         ),
//       )
//           : Text(
//         'Review',
//         style: TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.w700,
//           color: AppColors.primaryAppColor,
//         ),
//       ),
//     );
//   }
// }