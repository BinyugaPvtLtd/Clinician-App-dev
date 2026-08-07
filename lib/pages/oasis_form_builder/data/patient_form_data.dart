class PatientByPtIdFormModel {
  final int patientFormId;
  final int formId;
  final String formName;
  final int patientId;
  final int chartId;
  final int episodeId;
  final String status;
  final dynamic faceToFace;
  final String createdAt;
  final String updatedAt;
  final AssignedTo assignedTo;
  final List<StatusHistory> statusHistory;
  final List<SubFormList> subForms;
  final PatientFormReferralData  referralData;

  PatientByPtIdFormModel({
    required this.patientFormId,
    required this.formId,
    required this.formName,
    required this.patientId,
    required this.chartId,
    required this.episodeId,
    required this.status,
    required this.faceToFace,
    required this.createdAt,
    required this.updatedAt,
    required this.assignedTo,
    required this.statusHistory,
    required this.subForms,
    required this.referralData,
  });
}

// ─────────────────────────────────────────────

class AssignedTo {
  final Clinician clinician;
  final StaffMember qa;
  final StaffMember coder;

  AssignedTo({
    required this.clinician,
    required this.qa,
    required this.coder,
  });
}

// ─────────────────────────────────────────────

class Clinician {
  final int staffId;
  final String name;
  final String imgurl;
  final String color;
  final String abbreviation;

  Clinician({
    required this.staffId,
    required this.name,
    required this.imgurl,
    required this.color,
    required this.abbreviation,
  });
}

// ─────────────────────────────────────────────

class StaffMember {
  final int staffId;
  final String name;
  final String color;
  final String abbreviation;

  StaffMember({
    required this.staffId,
    required this.name,
    required this.color,
    required this.abbreviation,
  });
}

// ─────────────────────────────────────────────

class StatusHistory {
  final String fromStatus;
  final String toStatus;
  final dynamic note;
  final ChangedBy changedBy;
  final String changedAt;

  StatusHistory({
    required this.fromStatus,
    required this.toStatus,
    required this.note,
    required this.changedBy,
    required this.changedAt,
  });
}

// ─────────────────────────────────────────────

class ChangedBy {
  final int employeeId;
  final String name;

  ChangedBy({
    required this.employeeId,
    required this.name,
  });
}

// ─────────────────────────────────────────────

class SubFormList {
  final int id;
  final int subFormId;
  final String subFormName;
  final bool isFilled;
  final int comment_count;

  SubFormList({
    required this.comment_count,
    required this.id,
    required this.subFormId,
    required this.subFormName,
    required this.isFilled,
  });
}

class PatientFormReferralData{
  final int patientId;
  final String patientFirstname;
  final String patientLastname;
  final String patientDob;
  final int patientGenderId;
  final String patientPhone;
  final String patientAddress;
  final String patientImageUrl;
  final int patientChartNo;

  PatientFormReferralData({
    required this.patientId,
    required this.patientFirstname,
    required this.patientLastname,
    required this.patientDob,
    required this.patientGenderId,
    required this.patientPhone,
    required this.patientAddress,
    required this.patientImageUrl,
    required this.patientChartNo,
  });
}