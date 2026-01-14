/// ================= ROOT MODEL =================
class VisitDetailModel {
  final VisitHeader visitHeader;
  final Patient patient;
  final List<PlanOfCare> planOfCare;
  final List<VisitInstruction> visitInstructions;
  final List<OtherClinician> otherClinicians;
  final List<Week> weeks;

  VisitDetailModel({
    required this.visitHeader,
    required this.patient,
    required this.planOfCare,
    required this.visitInstructions,
    required this.otherClinicians,
    required this.weeks,
  });
}

/// ================= VISIT HEADER =================
class VisitHeader {
  final int visitId;
  final int visitTypeId;
  final String visitTypeName;
  final String timeRange;

  VisitHeader({
    required this.visitId,
    required this.visitTypeId,
    required this.visitTypeName,
    required this.timeRange,
  });
}

/// ================= PATIENT =================
class Patient {
  final String name;
  final String imageUrl;
  final String primaryDiagnosis;
  final String summary;
  final String address;

  Patient({
    required this.name,
    required this.imageUrl,
    required this.primaryDiagnosis,
    required this.summary,
    required this.address,
  });
}

/// ================= PLAN OF CARE =================
class PlanOfCare {
  final int employeeTypeId;
  final String abbreviation;

  PlanOfCare({
    required this.employeeTypeId,
    required this.abbreviation,
  });
}

/// ================= VISIT INSTRUCTION =================
/// Currently empty but future-safe
class VisitInstruction {
  VisitInstruction();
}

/// ================= OTHER CLINICIAN =================
/// Currently empty but future-safe
class OtherClinician {
  final int employeeId;
  final String name;
  final String employeeTypeAbbreviation;
  final String phone;
  final String imageUrl;
  OtherClinician({
    required this.employeeId,
    required this.name,
    required this.employeeTypeAbbreviation,
    required this.phone,
    required this.imageUrl,
  });

}

/// ================= WEEK =================
class Week {
  final int weekNo;
  final String socLabel;
  final List<WeekItem> items;

  Week({
    required this.weekNo,
    required this.socLabel,
    required this.items,
  });
}

/// ================= WEEK ITEM =================
class WeekItem {
  final int visitId;
  final String date;
  final String employeeTypeAbbreviation;
  final String timeRange;
  final bool isCompleted;

  WeekItem({
    required this.visitId,
    required this.date,
    required this.employeeTypeAbbreviation,
    required this.timeRange,
    required this.isCompleted,
  });
}
