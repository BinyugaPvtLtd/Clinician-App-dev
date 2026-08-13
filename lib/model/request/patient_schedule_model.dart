class PatientScheduleModel {
  final String imageUrl;
  final String patientName;
  final String diagnosisName;
  final String zoneName;
  final bool inZone;
  final String visitTypeName;
  final String address;
  final double visitCharge;
  final List<WeekSchedule> weeks;

  PatientScheduleModel({
    required this.imageUrl,
    required this.patientName,
    required this.diagnosisName,
    required this.zoneName,
    required this.inZone,
    required this.visitTypeName,
    required this.address,
    required this.visitCharge,
    required this.weeks,
  });
}

class WeekSchedule {
  final int week;
  final int patientId;
  final int chartId;
  final List<VisitScheduleItem> visits;

  WeekSchedule({
    required this.patientId,
    required this.chartId,
    required this.week,
    required this.visits,
  });
}

class VisitScheduleItem {
  final int visitId;
  final String visitName;
  final String visitDate; // "yyyy-MM-dd"
  final String visitTimeFrom; // "HH:mm"
  final String visitTimeTo;   // "HH:mm"
  final int employeeTypeId;
  final String employeeTypeAbbreviation;
  final String employeeTypeColor;
  final int employeeId;
  final int visitType;
  final bool isVisitCompleted;
  final bool isVisitMissed;
  final bool onWay;
  final int? recordTypeId;
  final bool isRescheduled;
  final String rescheduledAt; // "yyyy-MM-dd HH:mm:ss"
  final int? rescheduleReasonId;
  final String visitPhotoUrl;
  final bool isAttemptedVisit;
  final bool isSecondLastEpisodeVisit;
  final String lastVisitPerformedBy;
  final List<int> pendingAssistantFormIds;
  final List<int> lastVisitIds;
  final String episodeTriggerType;
  final int daysToEpisodeEnd;
  final int remainingVisitsCount;

  VisitScheduleItem({
    required this.visitId,
    required this.visitName,
    required this.visitDate,
    required this.visitTimeFrom,
    required this.visitTimeTo,
    required this.employeeTypeId,
    required this.employeeTypeAbbreviation,
    required this.employeeTypeColor,
    required this.employeeId,
    required this.visitType,
    required this.isVisitCompleted,
    required this.isVisitMissed,
    required this.onWay,
    required this.recordTypeId,
    required this.isRescheduled,
    required this.rescheduledAt,
    required this.rescheduleReasonId,
    required this.visitPhotoUrl,
    required this.isAttemptedVisit,
    required this.isSecondLastEpisodeVisit,
    required this.lastVisitPerformedBy,
    required this.pendingAssistantFormIds,
    required this.lastVisitIds,
    required this.episodeTriggerType,
    required this.daysToEpisodeEnd,
    required this.remainingVisitsCount,
  });
}
