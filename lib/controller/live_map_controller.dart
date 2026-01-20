

import 'dart:async';

import 'package:clinician_app/controller/repository/live_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/liveMap/live_data_model.dart';
import '../services/auth_api_services/auth_services.dart';

class LiveMapController extends GetxController{
  final ApiService _api = Get.put(ApiService());
  final isDashboardLoading = false.obs;
  final isDetailsLoading = false.obs;
  final isMapListLoading = false.obs;
  final error = ''.obs;

  final visitsMapModel = VisitsMapModel(visits: []).obs;
  final visitDashboardDetails = VisitDashboardDetailsModel(
    visit: VisitDashData(
      visitType: '',
      timeRange: '',
      visitCount: '',
      distance: null,
      visitCharge: 0,
    ),
    patient: PatientDash(
      name: '',
      imageUrl: '',
      gender: '',
      age: 0,
      primaryDiagnosis: '',
      about: '',
      address: '',
    ),
    planOfCare: [],
  ).obs;
  final clinicianStats = ClinicianStats(
    clinician: ClinicianDashboardData(
      name: '',
      imageUrl: '',
      employeeTypeAbbreviation: '',
      employeeTypeColor: '',
    ),
    activePatientCount: 0,
    potentialEarning: 0,
    activePatients: [],
  ).obs;
  Timer? _visitTimer;

  void startVisitListening() {
    _visitTimer?.cancel();

    // ✅ first time call (will show loader only once)
    fetchListOfVisitMap();

    // ✅ then every 10 seconds (no loader after first time)
    _visitTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      fetchListOfVisitMap();
    });
  }

  void stopVisitListening() {
    _visitTimer?.cancel();
    _visitTimer = null;
  }
  Future<void> fetchListOfVisitMap() async {
visitsMapModel.value = await getMapListVisit();
  }

  Future<void> fetchVisitMapDetails({required int visitId}) async {
    visitDashboardDetails.value = await getVisitDetailsDashboardData(visitId: visitId);
  }

  Future<void> fetchClinicianDashoardDetails() async {
    clinicianStats.value = await getLiveMapDashboardData();
    await fetchVisitMapDetails(visitId: 199);
  }


  Future<ClinicianStats> getLiveMapDashboardData() async {
    var itemData;
    try {
      isDashboardLoading.value = true;
      error.value = '';

      final res = await _api.get(LiveMapRepo.getLiveMapDashboart());

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data;

        // ✅ Clinician object
        final clinicianData = data['clinician'] ?? {};
        final clinician = ClinicianDashboardData(
          name: clinicianData['name'] ?? '',
          imageUrl: clinicianData['imageUrl'] ?? '',
          employeeTypeAbbreviation:
          clinicianData['employeeTypeAbbreviation'] ?? '',
          employeeTypeColor: clinicianData['employeeTypeColor'] ?? '',
        );

        // ✅ ActivePatients list
        final List<ActivePatient> activePatients = [];
        if (data['activePatients'] != null) {
          for (var p in data['activePatients']) {
            activePatients.add(
              ActivePatient(
                ptId: p['pt_id'] ?? 0,
                imageUrl: p['imageUrl'] ?? '',
              ),
            );
          }
        }

        // ✅ Final ClinicianStats object
        itemData = ClinicianStats(
          clinician: clinician,
          activePatientCount: data['activePatientCount'] ?? 0,
          potentialEarning: data['potentialEarning'] ?? 0,
          activePatients: activePatients,
        );

      } else {
        error.value = "failed to load data";
      }
    } catch (e) {
      error.value = e.toString();
      debugPrint('error live map dashboard: $e');
    } finally {
      isDashboardLoading.value = false;
    }

    return itemData ?? ClinicianStats(
      clinician: ClinicianDashboardData(
        name: '',
        imageUrl: '',
        employeeTypeAbbreviation: '',
        employeeTypeColor: '',
      ),
      activePatientCount: 0,
      potentialEarning: 0,
      activePatients: [],
    );
  }

  Future<VisitDashboardDetailsModel> getVisitDetailsDashboardData({
    required int visitId,
  }) async {
    VisitDashboardDetailsModel? itemData;

    try {
      isDetailsLoading.value = true;
      error.value = '';

      final res = await _api.get(LiveMapRepo.getLiveMapDetails(visitId: visitId));

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data;

        // ✅ Visit object
        final visitData = data['visit'] ?? {};
        final visit = VisitDashData(
          visitType: visitData['visitType'] ?? '',
          timeRange: visitData['timeRange'] ?? '',
          visitCount: visitData['visitCount'] ?? '',
          distance: visitData['distance'], // can be null
          visitCharge: visitData['visit_charge'] ?? 0,
        );

        // ✅ Patient object
        final patientData = data['patient'] ?? {};
        final patient = PatientDash(
          name: patientData['name'] ?? '',
          imageUrl: patientData['imageUrl'] ?? '',
          gender: patientData['gender'] ?? '',
          age: patientData['age'] ?? 0,
          primaryDiagnosis: patientData['primaryDiagnosis'] ?? '',
          about: patientData['about'] ?? '',
          address: patientData['address'] ?? '',
        );

        // ✅ PlanOfCare list
        final List<PlanOfCareLive> planOfCareList = [];
        if (data['planOfCare'] != null) {
          for (var p in data['planOfCare']) {
            planOfCareList.add(
              PlanOfCareLive(
                abbreviation: p['abbreviation'] ?? '',
                color: p['color'] ?? '',
              ),
            );
          }
        }

        // ✅ Final Model
        itemData = VisitDashboardDetailsModel(
          visit: visit,
          patient: patient,
          planOfCare: planOfCareList,
        );
      } else {
        error.value = "failed to load data";
      }
    } catch (e) {
      error.value = e.toString();
      debugPrint('error live map dashboard: $e');
    } finally {
      isDetailsLoading.value = false;
    }

    return itemData ?? VisitDashboardDetailsModel(
      visit: VisitDashData(
        visitType: '',
        timeRange: '',
        visitCount: '',
        distance: null,
        visitCharge: 0,
      ),
      patient: PatientDash(
        name: '',
        imageUrl: '',
        gender: '',
        age: 0,
        primaryDiagnosis: '',
        about: '',
        address: '',
      ),
      planOfCare: [],
    );
  }

  Future<VisitsMapModel> getMapListVisit() async {
    VisitsMapModel? itemData;
    String formatTimeToAMPM(String? dateTimeString) {
      if (dateTimeString == null || dateTimeString.isEmpty) return '';

      try {
        final DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
        return DateFormat('h.mm a').format(dateTime).replaceAll(' ', '');
      } catch (e) {
        return '';
      }
    }
    try {
      isMapListLoading.value = true;
      error.value = '';

      final res = await _api.get(
        LiveMapRepo.getLiveMapTodayList(),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data;

        // ✅ Visits list
        final List<VisitMapItem> visitsList = [];

        if (data['visits'] != null) {
          for (var v in data['visits']) {
            visitsList.add(
              VisitMapItem(
                visitId: v['visitId'] ?? 0,
                patientId: v['patientId'] ?? 0,
                patientName: v['patientName'] ?? '',
                patientImgUrl: v['patientImgUrl'] ?? '',
                visiteDateTimeFrom: v['visiteDateTimeFrom'] != null ?formatTimeToAMPM(v['visiteDateTimeFrom']) : '',
                visitDateTimeTo: v['visitDateTimeTo'] != null ?formatTimeToAMPM(v['visitDateTimeTo']) : '',
                isVisitCompleted: v['isVisitCompleted'] ?? false,
                isVisitMissed: v['isVisitMissed'] ?? false,
                onWay: v['onWay'] ?? false,
                visitCharge: double.parse(((v['visit_charge'] as num?)?.toDouble() ?? 0.0).toStringAsFixed(2)),
              ),
            );
          }
        }

        // ✅ Final Model
        itemData = VisitsMapModel(visits: visitsList);
      } else {
        error.value = "failed to load data";
      }
    } catch (e) {
      error.value = e.toString();
      debugPrint('error live map details: $e');
    } finally {
      isMapListLoading.value = false;
    }

    return itemData ?? VisitsMapModel(visits: []);
  }


}