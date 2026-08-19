

import 'package:clinician_app/controller/repository/live_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/constant/api_app_constant.dart';
import '../model/liveMap/live_data_model.dart';
import '../model/liveMap/see_route_model.dart';
import '../model/liveMap/visit_data_model.dart';
import '../services/auth_api_services/auth_services.dart';

class LiveMapController extends GetxController{
  final ApiService _api = Get.put(ApiService());
  final isDashboardLoading = false.obs;
  final isDetailsLoading = false.obs;
  final isMapListLoading = false.obs;
  final isSeeRouteLoading = false.obs;
  final error = ''.obs;

  final RxBool isLoading = false.obs;
  bool _isFirstLoad = true;
  final selectedPatientId = 0.obs;
  final selectedPatientName = ''.obs;
  final visitsMapModel = VisitsMapModel(visits: []).obs;
  final mapVisitDataModel = MapVisitDataModel(
      visitDone: 0,
      visitsRemaining: 0,
      earned: 0,
      visitExpected: 0).obs;
  final visitDashboardDetails = VisitDashboardDetailsModel(
    visit: VisitDashData(
      visitType: '',
      timeRange: '',
      visitCount: '',
      distanceKm: '',
      visitCharge: 0,
      timeToReach: '',
      distanceInMiles: '',
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
  final viewRouteModelData = ViewRouteModelData(
      sourceLatitude: 0.0,
      sourceLongitude: 0.0,
      destinyLatitude: 0.0,
      destinyLongitude: 0.0,
      distance: ''
  ).obs;
  final clinicianStats = ClinicianStats(
    clinician: ClinicianDashboardData(
      clinicianId: 0,
      name: '',
      imageUrl: '',
      employeeTypeAbbreviation: '',
      employeeTypeColor: '',
    ),
    activePatientCount: 0,
    potentialEarning: 0,
    activePatients: [],
  ).obs;
  /// One-time initial load (shows the full loader).
  void loadInitial() {
    fetchListOfVisitMap();
    fetchClinicianDashoardDetails(showLoader: true);
  }

  /// Re-fetch on user interaction (e.g. returning to this screen) — no loader.
  void refreshNow() {
    fetchListOfVisitMap();
    fetchClinicianDashoardDetails();
  }
  Future<void> fetchViewRoutetMap({required int clinitianId,required int patientId}) async {
    viewRouteModelData.value = await getViewRouteData(clinitianId: clinitianId, patientId: patientId);
  }
  Future<void> fetchListOfVisitMap() async {
visitsMapModel.value = await getMapListVisit();
  }

  Future<void> fetchVisitMapDetails({required int visitId}) async {
    visitDashboardDetails.value = await getVisitDetailsDashboardData(visitId: visitId);
  }

  Future<void> fetchClinicianDashoardDetails({bool showLoader = false}) async {
    try {
      if (showLoader) isLoading.value = true;

      clinicianStats.value = await getLiveMapDashboardData();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (showLoader) isLoading.value = false;
    }
  }


  Future<void> fetchVisitData({required int clinitianId}) async {
    mapVisitDataModel.value = await getVisitData(clinicianId: clinitianId);
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
          clinicianId: clinicianData[ "clinicianId"] ?? 0,
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
        clinicianId: 0,
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
            distanceKm: visitData['distanceKm'] ?? '',
          distanceInMiles: visitData['distanceMiles'] ?? '',
          timeToReach: visitData['timeToReach'] ?? '',
          visitCharge: double.parse(((visitData['visit_charge'] as num?)?.toDouble() ?? 0.0).toStringAsFixed(2)),
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
        distanceKm: '',
        visitCharge: 0,
        timeToReach: '',
        distanceInMiles: '',
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
        return DateFormat('h.mm a').format(dateTime);
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

  Future<MapVisitDataModel> getVisitData({required int clinicianId}) async {
    MapVisitDataModel? itemData;
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
        LiveMapRepo.getVisitData(clinicianId: clinicianId),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {


        // ✅ Final Model
        itemData = MapVisitDataModel(
            visitDone: res.data['visitsDone'] ?? 0,
            visitsRemaining: res.data['visitsRemaining'] ?? 0,
            earned: res.data['earned'] ?? 0,
            visitExpected: res.data['visitExpected'] ?? 0);
      } else {
        error.value = "failed to load data";
      }
    } catch (e) {
      error.value = e.toString();
      debugPrint('error live map details: $e');
    } finally {
      isMapListLoading.value = false;
    }

    return itemData ?? MapVisitDataModel(
        visitDone: 0,
        visitsRemaining: 0,
        earned: 0,
        visitExpected: 0);
  }



  Future<ViewRouteModelData> getViewRouteData({
    required int clinitianId,
    required int patientId,
  }) async {
    var itemData;

    try {
      isSeeRouteLoading.value = true;
      error.value = '';

      final res = await _api.get(LiveMapRepo.getViewRoute(
          clinicianId: clinitianId, patientId: patientId));

      if (res.statusCode == 200 || res.statusCode == 201) {
        // ✅ Final Model
      return  itemData = ViewRouteModelData(
            sourceLatitude: res.data['sourceLatitude']?.toDouble() ?? 0.0,
            sourceLongitude: res.data['sourceLongitude']?.toDouble() ?? 0.0,
            destinyLatitude: res.data['destinyLatitude']?.toDouble() ?? 0.0,
            destinyLongitude: res.data['destinyLongitude']?.toDouble() ?? 0.0,
            distance: res.data['distance'] ?? '0.0 miles'
        );
      } else {
        error.value = "failed to load data";
      }
    } catch (e) {
      error.value = e.toString();
      debugPrint('error live map view route: $e');
    } finally {
      isSeeRouteLoading.value = false;
    }
    return  itemData ?? ViewRouteModelData(
        sourceLatitude: 0.0,
        sourceLongitude: 0.0,
        destinyLatitude: 0.0,
        destinyLongitude: 0.0,
        distance: ''
    );
  }



  /// Google map route polyline points fetching can be added here



  GoogleMapController? mapController;

  final RxSet<Polyline> polylines = <Polyline>{}.obs;
  final RxSet<Marker> markers = <Marker>{}.obs;

  // Put your Google Directions key here
  final String googleApiKey = "YOUR_GOOGLE_MAPS_API_KEY";

  Future<void> drawRoute() async {
    // ✅ your fields
    final sLat = viewRouteModelData.value.sourceLatitude;
    final sLng = viewRouteModelData.value.sourceLongitude ;
    final dLat = viewRouteModelData.value.destinyLatitude;
    final dLng = viewRouteModelData.value.destinyLongitude;

    if (sLat == null || sLng == null || dLat == null || dLng == null) return;

    final source = LatLng(sLat, sLng);
    final dest = LatLng(dLat, dLng);

    // ✅ markers
    markers.value = {
      Marker(markerId: const MarkerId("source"), position: source),
      Marker(markerId: const MarkerId("dest"), position: dest),
    };

    // ✅ route points from Google Directions
    final polylinePoints = PolylinePoints(apiKey: ApiAppConstant.googleApiKey);
    final result = await polylinePoints.getRouteBetweenCoordinates(
      // googleApiKey: googleApiKey,
      request: PolylineRequest(
        origin: PointLatLng(source.latitude, source.longitude),
        destination: PointLatLng(dest.latitude, dest.longitude),
        mode: TravelMode.driving,
      ),
    );

    if (result.points.isEmpty) return;

    final routePoints = result.points
        .map((p) => LatLng(p.latitude, p.longitude))
        .toList();

    polylines.value = {
      Polyline(
        polylineId: const PolylineId("route"),
        points: routePoints,
        width: 5,
      ),
    };

    // ✅ fit camera
    final bounds = _boundsFromLatLngList([source, dest]);
    await mapController?.animateCamera(CameraUpdate.newLatLngBounds(bounds, 60));
  }

  LatLngBounds _boundsFromLatLngList(List<LatLng> list) {
    double x0 = list.first.latitude, x1 = list.first.latitude;
    double y0 = list.first.longitude, y1 = list.first.longitude;

    for (final latLng in list) {
      if (latLng.latitude > x1) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > y1) y1 = latLng.longitude;
      if (latLng.longitude < y0) y0 = latLng.longitude;
    }
    return LatLngBounds(
      northeast: LatLng(x1, y1),
      southwest: LatLng(x0, y0),
    );
  }


  Future<void> openInGoogleMaps() async {
    final sLat = viewRouteModelData.value.sourceLatitude;
    final sLng = viewRouteModelData.value.sourceLongitude;
    final dLat = viewRouteModelData.value.destinyLatitude;
    final dLng = viewRouteModelData.value.destinyLongitude;

    if (sLat == null || sLng == null || dLat == null || dLng == null) return;

    final url = Uri.parse(
      "https://www.google.com/maps/dir/?api=1"
          "&origin=$sLat,$sLng"
          "&destination=$dLat,$dLng"
          "&travelmode=driving",
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // ✅ opens Google Maps app
      );
    }
  }

}