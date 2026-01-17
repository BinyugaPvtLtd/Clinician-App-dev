// visit_models_required_non_nullable.dart

class VisitModelData {
  final int visitId;
  final int ptId;
  final int employeeTypeId;
  final int employeeId;
  final int visitType;

  final String visiteDateTimeFrom;
  final String visitDateTimeTo;

  final bool isVisitCompleted;
  final bool isVisitMissed;
  final bool onWay;
  final int recordTypeId;
  final bool inZone;

  final Patient patient;
  final Employee employee;
  final EmployeeType employeeType;

  const VisitModelData({
    required this.visitId,
    required this.ptId,
    required this.employeeTypeId,
    required this.employeeId,
    required this.visitType,
    required this.visiteDateTimeFrom,
    required this.visitDateTimeTo,
    required this.isVisitCompleted,
    required this.isVisitMissed,
    required this.onWay,
    required this.recordTypeId,
    required this.inZone,
    required this.patient,
    required this.employee,
    required this.employeeType,
  });
}

class Patient {
  final int ptId;
  final String ptFirstName;
  final String ptLastName;
  final String ptContactNo;
  final String ptZipCode;
  final int ptChartNo;
  final String ptSummary;

  final String ptRefferalDate;
  final int fkSrvId;
  final int fkPtPrimaryDiagnosis;
  final List<dynamic> fkPtSecondaryDiagnosis;
  final int fkPtRefferalSource;
  final int fkPtPcp;
  final int fkPtMarketer;
  final List<int> fkPtDiscplines;
  final int ptCoverageArea;

  final bool isIntake;
  final String intakeTime;

  final bool isArchieved;
  final String archievedTime;
  final String createdAt;

  final String ptDateOfBirth;
  final String ptImgUrl;

  final int fkEmpIdArchived;
  final int fkRptiId;
  final bool isSelfPay;

  final String documentName;
  final bool moveToScheduler;
  final String moveToSchedulerDatetime;

  final String admitDateTime;
  final bool isNonAdmit;

  final int ptMrn;
  final String ptSocDate;
  final bool ptSocStatus;

  final String potentialDischargeDate;

  final String ptAddress;
  final String ptMedicalNote;

  final bool isDemographicFilled;
  final bool isDocumentationUpload;
  final bool isInitialContactFilled;
  final bool isOrdersFilled;
  final bool isPhysicianFilled;
  final bool isPrimaryInsuranceFilled;

  final int companyId;
  final int genderId;

  final bool potentialDuplicate;
  final String fkPtPrimaryDiagnosisName;

  const Patient({
    required this.ptId,
    required this.ptFirstName,
    required this.ptLastName,
    required this.ptContactNo,
    required this.ptZipCode,
    required this.ptChartNo,
    required this.ptSummary,
    required this.ptRefferalDate,
    required this.fkSrvId,
    required this.fkPtPrimaryDiagnosis,
    required this.fkPtSecondaryDiagnosis,
    required this.fkPtRefferalSource,
    required this.fkPtPcp,
    required this.fkPtMarketer,
    required this.fkPtDiscplines,
    required this.ptCoverageArea,
    required this.isIntake,
    required this.intakeTime,
    required this.isArchieved,
    required this.archievedTime,
    required this.createdAt,
    required this.ptDateOfBirth,
    required this.ptImgUrl,
    required this.fkEmpIdArchived,
    required this.fkRptiId,
    required this.isSelfPay,
    required this.documentName,
    required this.moveToScheduler,
    required this.moveToSchedulerDatetime,
    required this.admitDateTime,
    required this.isNonAdmit,
    required this.ptMrn,
    required this.ptSocDate,
    required this.ptSocStatus,
    required this.potentialDischargeDate,
    required this.ptAddress,
    required this.ptMedicalNote,
    required this.isDemographicFilled,
    required this.isDocumentationUpload,
    required this.isInitialContactFilled,
    required this.isOrdersFilled,
    required this.isPhysicianFilled,
    required this.isPrimaryInsuranceFilled,
    required this.companyId,
    required this.genderId,
    required this.potentialDuplicate,
    required this.fkPtPrimaryDiagnosisName,
  });
}

class Employee {
  final int employeeId;
  final String code;
  final String firstName;
  final String lastName;
  final String expertise;
  final String gender;
  final String imgurl;
  final String regOfficId;
  final String onboardingStatus;
  final int userId;

  final String ssnNbr;
  final String address;
  final int cityId;
  final String dateOfBirth;

  final int departmentId;
  final String emergencyContact;
  final int employeeTypeId;
  final String employment;
  final String personalEmail;
  final String primaryPhoneNbr;
  final String secondryPhoneNbr;
  final String service;
  final String status;
  final String workEmail;
  final String workPhoneNbr;

  final int companyId;
  final String createdAt;

  final String resumeurl;
  final String covreage;

  final dynamic approved;
  final dynamic terminationFlag;

  final int zoneId;
  final int countryId;

  final String checkDate;
  final String dateofResignation;
  final String dateofTermination;

  final String finalAddress;
  final num finalPayCheck;
  final num grossPay;
  final String materials;
  final String methods;
  final num netPay;
  final String reason;
  final String rehirable;

  final String type;
  final String dateofHire;
  final String position;

  final String driverLicenceNbr;
  final String race;
  final String rating;
  final String signatureURL;
  final int countyId;

  final bool active;
  final dynamic summary;

  const Employee({
    required this.employeeId,
    required this.code,
    required this.firstName,
    required this.lastName,
    required this.expertise,
    required this.gender,
    required this.imgurl,
    required this.regOfficId,
    required this.onboardingStatus,
    required this.userId,
    required this.ssnNbr,
    required this.address,
    required this.cityId,
    required this.dateOfBirth,
    required this.departmentId,
    required this.emergencyContact,
    required this.employeeTypeId,
    required this.employment,
    required this.personalEmail,
    required this.primaryPhoneNbr,
    required this.secondryPhoneNbr,
    required this.service,
    required this.status,
    required this.workEmail,
    required this.workPhoneNbr,
    required this.companyId,
    required this.createdAt,
    required this.resumeurl,
    required this.covreage,
    required this.approved,
    required this.terminationFlag,
    required this.zoneId,
    required this.countryId,
    required this.checkDate,
    required this.dateofResignation,
    required this.dateofTermination,
    required this.finalAddress,
    required this.finalPayCheck,
    required this.grossPay,
    required this.materials,
    required this.methods,
    required this.netPay,
    required this.reason,
    required this.rehirable,
    required this.type,
    required this.dateofHire,
    required this.position,
    required this.driverLicenceNbr,
    required this.race,
    required this.rating,
    required this.signatureURL,
    required this.countyId,
    required this.active,
    required this.summary,
  });
}

class EmployeeType {
  final int employeeTypeId;
  final String employeeType;
  final String color;
  final String abbreviation;
  final int departmentId;
  final bool isAssistant;
  final int assistantMasterId;

  const EmployeeType({
    required this.employeeTypeId,
    required this.employeeType,
    required this.color,
    required this.abbreviation,
    required this.departmentId,
    required this.isAssistant,
    required this.assistantMasterId,
  });
}
