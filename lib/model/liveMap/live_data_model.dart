class ClinicianDashboardData {
  final int  clinicianId;
  final String name;
  final String imageUrl;
  final String employeeTypeAbbreviation;
  final String employeeTypeColor;

  ClinicianDashboardData({
    required this.clinicianId,
    required this.name,
    required this.imageUrl,
    required this.employeeTypeAbbreviation,
    required this.employeeTypeColor,
  });
}

class ActivePatient {
  final int ptId;
  final String imageUrl;

  ActivePatient({
    required this.ptId,
    required this.imageUrl,
  });
}

class ClinicianStats {
  final ClinicianDashboardData clinician;
  final int activePatientCount;
  final int potentialEarning;
  final List<ActivePatient> activePatients;

  ClinicianStats({
    required this.clinician,
    required this.activePatientCount,
    required this.potentialEarning,
    required this.activePatients,
  });
}

/// visit details
class VisitDashData {
  final String visitType;
  final String timeRange;
  final String visitCount;// can be null or number/string
  final double visitCharge;
  final String distanceKm;
  final String timeToReach;
  final String distanceInMiles;

  VisitDashData({
    required this.visitType,
    required this.timeRange,
    required this.visitCount,
    required this.visitCharge, required this.distanceKm, required this.timeToReach, required this.distanceInMiles,
  });
}

class PatientDash {
  final String name;
  final String imageUrl;
  final String gender;
  final int age;
  final String primaryDiagnosis;
  final String about;
  final String address;

  PatientDash({
    required this.name,
    required this.imageUrl,
    required this.gender,
    required this.age,
    required this.primaryDiagnosis,
    required this.about,
    required this.address,
  });
}

class PlanOfCareLive {
  final String abbreviation;
  final String color;

  PlanOfCareLive({
    required this.abbreviation,
    required this.color,
  });
}

class VisitDashboardDetailsModel {
  final VisitDashData visit;
  final PatientDash patient;
  final List<PlanOfCareLive> planOfCare;

  VisitDashboardDetailsModel({
    required this.visit,
    required this.patient,
    required this.planOfCare,
  });
}

/// visit map list
class VisitMapItem {
  final int visitId;
  final int patientId;
  final String patientName;
  final String patientImgUrl;
  final String visiteDateTimeFrom;
  final String visitDateTimeTo;
  final bool isVisitCompleted;
  final bool isVisitMissed;
  final bool onWay;
  final double visitCharge;

  VisitMapItem({
    required this.visitId,
    required this.patientId,
    required this.patientName,
    required this.patientImgUrl,
    required this.visiteDateTimeFrom,
    required this.visitDateTimeTo,
    required this.isVisitCompleted,
    required this.isVisitMissed,
    required this.onWay,
    required this.visitCharge,
  });
}

class VisitsMapModel {
  final List<VisitMapItem> visits;

  VisitsMapModel({
    required this.visits,
  });
}

