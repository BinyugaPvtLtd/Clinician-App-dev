import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/core/ui/buttons/primary_button.dart';

import '../../../services/token_manager/token_manager_service.dart';
import '../../../core/ui/const_sucess_popup.dart';
import '../../oasis_form_builder/model/chart_patient_referral_data_model.dart';
import '../../oasis_form_builder/model/patient_form_model.dart';
import '../../oasis_form_builder/oasis_form_mapper.dart';
import '../../oasis_form_builder/services/api/managers/form_builder_manager.dart';
import '../../oasis_form_builder/services/api/managers/patient_form_manager.dart';
import '../../oasis_form_builder/side_drawer/side_drawer_provider.dart';
import 'miss_visit_discharge_popup.dart';

class MissVisitFormPopup extends StatefulWidget {
  final int visitId;
  // ── NEW: params required by _onTap ──────────────────────────────────────
  final int ptId;
  final String lastFormFillByAssist;

  const MissVisitFormPopup({
    super.key,
    required this.visitId,
    required this.ptId,
    required this.lastFormFillByAssist,
  });

  @override
  State<MissVisitFormPopup> createState() => _MissVisitFormPopupState();
}

class _MissVisitFormPopupState extends State<MissVisitFormPopup> {
  final TextEditingController _reasonController = TextEditingController();
  bool _attemptedVisit = false;
  bool _isLoading = false;

  // ── Photo ─────────────────────────────────────────────────────────────────
  String? _uploadedFileName;
  String? _uploadedBase64;

  // Notifications
  DateTime? _notificationDate;
  TimeOfDay? _notificationTime;
  bool _clinicalManager = true;
  bool _physician = false;
  bool _phone = false;
  bool _fax = false;
  bool _other = false;

  // Actions taken
  bool _contactedRep = false;
  bool _rescheduled = false;
  bool _contactedPhysician = false;
  bool _actionOther = false;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _notificationDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _notificationDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) setState(() => _notificationTime = picked);
  }

  // ── Pick image → base64 ───────────────────────────────────────────────────
  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file == null) return;
      final bytes = await file.readAsBytes();
      setState(() {
        _uploadedBase64 = base64Encode(bytes);
        _uploadedFileName = file.name;
      });
    } catch (e) {
      print("Image pick error $e");
      showDocErrorDialog(
        context: context,
        title: 'Failed',
        message: 'Failed to pick image.\nPlease try again.',
      );
    }
  }

  // ── Build actionsTaken list ───────────────────────────────────────────────
  List<String> get _actionsTaken {
    final list = <String>[];
    if (_contactedRep) list.add('contracted_representative');
    if (_rescheduled) list.add('rescheduled');
    if (_contactedPhysician) list.add('contacted_physician');
    if (_actionOther) list.add('other');
    return list;
  }

  // ── Build individualsNotified list ────────────────────────────────────────
  List<String> get _individualsNotified {
    final list = <String>[];
    if (_clinicalManager) list.add('clinical_manager');
    if (_physician) list.add('physician');
    return list;
  }

  // ── Build notificationMethods list ───────────────────────────────────────
  List<String> get _notificationMethods {
    final list = <String>[];
    if (_phone) list.add('phone');
    if (_fax) list.add('fax');
    if (_other) list.add('other');
    return list;
  }

  // ── Format date ───────────────────────────────────────────────────────────
  String get _formattedDate {
    if (_notificationDate == null) return '';
    return '${_notificationDate!.year}-'
        '${_notificationDate!.month.toString().padLeft(2, '0')}-'
        '${_notificationDate!.day.toString().padLeft(2, '0')}';
  }

  // ── Format time ───────────────────────────────────────────────────────────
  String get _formattedTime {
    if (_notificationTime == null) return '';
    return _notificationTime!.format(context);
  }

  // ── Open patient form (called automatically after successful submit) ───────
  Future<void> _openPatientForm({required int patientFormId}) async {
    try {
      final result = await getPatientFormByPatientID(
        context,
        patientFormId: patientFormId,
      );

      String userRole = await TokenManager.getUserStatus();

      if (!mounted) return;

      // Guard: bail out if result is null
      if (result == null) {
        debugPrint('_openPatientForm: result is null — aborting navigation');
        return;
      }

      // Close this popup, then push the form screen
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<SideDrawerProvider>(
            create: (_) => SideDrawerProvider(),
            child: OasisFormMapper(
            form: PatientForm(
              formID: result.formId,
              formName: result.formName,
              fillStatus: result.status,
              subForms: result.subForms
                  .map(
                    (e) => PatientSubForm(
                      formID: result.formId,
                      subFormID: e.id,
                      subFormName: e.subFormName,
                      patientFormID: result.patientFormId,
                      fillStatus: e.isFilled,
                      commentCount: e.comment_count,
                    ),
                  )
                  .toList(),
            ),
            subForm: PatientSubForm(
              formID: result.formId,
              subFormID:
                  result.subForms.isNotEmpty ? result.subForms.first.id : 0,
              subFormName: result.subForms.isNotEmpty
                  ? result.subForms.first.subFormName
                  : '',
              patientFormID: result.patientFormId,
              commentCount: result.subForms.isNotEmpty
                  ? result.subForms.first.comment_count
                  : 0,
              fillStatus: result.subForms.isNotEmpty
                  ? result.subForms.first.isFilled
                  : false,
            ),
            patient: ChartPatientReferral(
              patientId: widget.ptId,
              firstName: result.referralData.patientFirstname,
              lastName: result.referralData.patientLastname,
              contactNumber: result.referralData.patientPhone,
              address: result.referralData.patientAddress,
              imageUrl: result.referralData.patientImageUrl,
              gender: Gender(genderID: 1, genderName: 'Male'),
              dateOfBirth:
                  DateTime.tryParse(result.referralData.patientDob ?? '') ??
                      DateTime.now(),
              chartNo: result.referralData.patientChartNo,
              episodes: [],
            ),
            appBarString: 'EMR - Clinical',
            userRole: userRole,
            lastFormFillByAssist: widget.lastFormFillByAssist,
            visitId: widget.visitId,
            ),
          ),
        ),
      );
    } catch (e, stack) {
      debugPrint('_openPatientForm error: $e\n$stack');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // ── Submit ────────────────────────────────────────────────────────────────
  Future<void> _submit() async {
    setState(() => _isLoading = true);
    try {
      // Step 1 — upload photo if selected
      String? photoUrl;
      if (_uploadedBase64 != null) {
        final photoResult = await FormBuilderManager().uploadVisitPhoto(
          context,
          widget.visitId,
          _uploadedBase64!,
        );
        if (!photoResult.success) {
          showDocErrorDialog(
            context: context,
            title: 'Failed',
            message: photoResult.message,
          );
          setState(() => _isLoading = false);
          return;
        }
        print("Photo uploaded successfully");
        photoUrl = photoResult.message;
      }

      // Step 2 — mark visit missed
      final result = await FormBuilderManager().markVisitMissed(
        context,
        widget.visitId,
        reason: _reasonController.text.trim(),
        isAttemptedVisit: _attemptedVisit,
        photoUrl: photoUrl,
        actionsTaken: _actionsTaken,
        notificationDate: _formattedDate,
        notificationTime: _formattedTime,
        individualsNotified: _individualsNotified,
        notificationMethods: _notificationMethods,
      );

      if (result.success) {
        // ── Step 3: automatically open the patient form ──────────────────
        if (result.requiredEpisodEnd == true) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (_) => DischargeMissedVisitTypePopup(
              visitId: widget.visitId,
              onNevigate: () async {
                await _openPatientForm(patientFormId: result.missVisitFormID!);
              },
              patientFormId: result.missVisitFormID!,
            ),
          );
          return;
        }
        await _openPatientForm(
          patientFormId: result.missVisitFormID != 0
              ? result.missVisitFormID!
              : result.dischardeFormPatientId!,
        );
      } else {
        Navigator.pop(context);
        showDocErrorDialog(
          context: context,
          title: 'Failed',
          message: result.message,
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Cap the dialog width so it looks good on tablets/desktop,
    // but shrink gracefully on small phones.
    final dialogWidth = screenWidth < 700 ? screenWidth * 0.94 : 700.0;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: dialogWidth,
          maxHeight: screenHeight * 0.85,
        ),
        child: Container(
          width: dialogWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header bar
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryAppColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                ),
                height: 37.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Text(
                        'Miss Visit',
                        style: AppTextStyle.bold14style
                            .copyWith(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),

              // Scrollable, single-column body — every field stacks
              // vertically so nothing gets cramped or overflows on a phone.
              Flexible(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reason for Missed Visit',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mediumgrey,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      SizedBox(
                        height: 40.h,
                        child: TextField(
                          controller: _reasonController,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.mediumgrey,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Text',
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.hintGrey,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide:
                                  const BorderSide(color: Colors.black45),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide:
                                  const BorderSide(color: Colors.black45),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Attempted Visit
                      Row(
                        children: [
                          SizedBox(
                            width: 18.w,
                            height: 18.h,
                            child: Checkbox(
                              value: _attemptedVisit,
                              activeColor: AppColors.primaryAppColor,
                              onChanged: (v) =>
                                  setState(() => _attemptedVisit = v ?? false),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            'Attempted Visit',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.mediumgrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),

                      // ── Upload Photo ──────────────────────────────────
                      Text(
                        'Upload Photo',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mediumgrey,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 36.h,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  _uploadedFileName ?? 'Upload',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: _uploadedBase64 != null
                                        ? AppColors.primaryAppColor
                                        : Colors.black45,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Icon(
                                Icons.upload_outlined,
                                size: 16.sp,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Actions Taken
                      Text(
                        'Actions taken',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mediumgrey,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      _checkRow(
                        value: _contactedRep,
                        label:
                            'Contracted authorized representative, caregivers, family, friends',
                        onChanged: (v) =>
                            setState(() => _contactedRep = v ?? false),
                      ),
                      SizedBox(height: 6.h),
                      _checkRow(
                        value: _rescheduled,
                        label: 'Rescheduled for later in week',
                        onChanged: (v) =>
                            setState(() => _rescheduled = v ?? false),
                      ),
                      SizedBox(height: 6.h),
                      _checkRow(
                        value: _contactedPhysician,
                        label: 'Contacted Physician',
                        onChanged: (v) =>
                            setState(() => _contactedPhysician = v ?? false),
                      ),
                      SizedBox(height: 6.h),
                      _checkRow(
                        value: _actionOther,
                        label: 'Other',
                        onChanged: (v) =>
                            setState(() => _actionOther = v ?? false),
                      ),
                      SizedBox(height: 24.h),

                      // Text(
                      //   'Notification(s)',
                      //   style: TextStyle(
                      //     fontSize: 12.sp,
                      //     fontWeight: FontWeight.w600,
                      //     color: AppColors.mediumgrey,
                      //   ),
                      // ),
                      // SizedBox(height: 12.h),

                      // Date of notification
                      Row(
                        children: [
                          Text(
                            'Date of notification:',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.mediumgrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: _pickDate,
                              child: Container(
                                height: 36.h,
                                padding:
                                    EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _notificationDate != null
                                          ? '${_notificationDate!.month.toString().padLeft(2, '0')}/'
                                              '${_notificationDate!.day.toString().padLeft(2, '0')}/'
                                              '${_notificationDate!.year}'
                                          : ' ',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.mediumgrey,
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_month_sharp,
                                      size: 18.sp,
                                      color: Colors.black45,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Time of notification
                      Row(
                        children: [
                          Text(
                            'Time of notification:',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.mediumgrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: _pickTime,
                              child: Container(
                                height: 36.h,
                                padding:
                                    EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _notificationTime != null
                                          ? _notificationTime!.format(context)
                                          : ' ',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.mediumgrey,
                                      ),
                                    ),
                                    Icon(
                                      Icons.access_time,
                                      size: 18.sp,
                                      color: Colors.black45,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Individuals notified
                      Text(
                        'Individuals notified:',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mediumgrey,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Wrap(
                        spacing: 12.w,
                        runSpacing: 6.h,
                        children: [
                          _checkRow(
                            value: _clinicalManager,
                            label: 'Clinical Manager',
                            onChanged: (v) => setState(
                                () => _clinicalManager = v ?? false),
                          ),
                          _checkRow(
                            value: _physician,
                            label: 'Physician',
                            onChanged: (v) =>
                                setState(() => _physician = v ?? false),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),

                      // Method of notification
                      Text(
                        'Method(s) of notification:',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mediumgrey,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Wrap(
                        spacing: 10.w,
                        runSpacing: 6.h,
                        children: [
                          _checkRow(
                            value: _phone,
                            label: 'Phone',
                            onChanged: (v) =>
                                setState(() => _phone = v ?? false),
                          ),
                          _checkRow(
                            value: _fax,
                            label: 'Fax',
                            onChanged: (v) =>
                                setState(() => _fax = v ?? false),
                          ),
                          _checkRow(
                            value: _other,
                            label: 'Other',
                            onChanged: (v) =>
                                setState(() => _other = v ?? false),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ── Submit ────────────────────────────────────────────────────
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _isLoading
                      ? SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryAppColor,
                          ),
                        )
                      : SizedBox(
                          height: 34.h,
                          width: 120.w,
                          child: PrimaryButton(
                            label: 'Submit',
                            onTap: _submit,
                            borderRadius: 8.r,
                            padding: EdgeInsets.zero,
                            labelStyle: AppTextStyle.normal12style.copyWith(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkRow({
    required bool value,
    required String label,
    required ValueChanged<bool?> onChanged,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 18.w,
          height: 18.h,
          child: Checkbox(
            splashRadius: 0,
            focusColor: Colors.transparent,
            value: value,
            activeColor: AppColors.primaryAppColor,
            onChanged: onChanged,
          ),
        ),
        SizedBox(width: 4.w),
        Flexible(
          child: Text(
            label,
            style: TextStyle(fontSize: 11.sp, color: AppColors.mediumgrey),
          ),
        ),
      ],
    );
  }
}
