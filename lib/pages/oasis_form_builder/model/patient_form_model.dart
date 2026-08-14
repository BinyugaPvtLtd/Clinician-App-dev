class PatientForm {
  int formID;
  String formName;
  String fillStatus;
  // bool initStatus;
  List<PatientSubForm> subForms;

  PatientForm({
    required this.formID,
    required this.formName,
    required this.fillStatus,
    // required this.initStatus,
    required this.subForms,
  });

  factory PatientForm.fromJson(Map<String, dynamic> json) {
    final form  =PatientForm(
      formID: json['formId']??json["form_id"] as int? ?? 0,
      formName: json['formName'] as String? ?? "Unknown",
      fillStatus: json['status'] ?? "Unknown",
      // initStatus: json['initStatus'] as bool? ?? false,
      subForms: json['subForms'] != null
          ? PatientSubForm.fromJsonList(json['subForms'] as List,
          formID: (json['form_id'] as int? ?? 0),patientFormID: (json['patient_form_id']  ?? -1))
          : <PatientSubForm>[],
    );
    // form.initStatus = form.subForms.where((subForm)=>subForm.patientFormID==-1).isEmpty;
    return form;
  }

  Map<String, dynamic> toJson() {
    return {
      'formId': formID,
      'formName': formName,
      'status': fillStatus,
      // 'initStatus': initStatus,
      'subForms': PatientSubForm.toJsonList(subForms),
    };
  }

  static List<PatientForm> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => PatientForm.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<PatientForm> modelList) {
    return modelList.map((model) => model.toJson()).toList();
  }

  PatientForm? getFilledForm() {
    final filledSubForms = subForms.where((sf) => sf.fillStatus == true).toList();
    if (filledSubForms.isEmpty) return null;

    return PatientForm(
      formID: formID,
      formName: formName,
      fillStatus: fillStatus,
      // initStatus: initStatus,
      subForms: filledSubForms,
    );
  }

  PatientForm? getUnfilledForm() {
    final unfilledSubForms = subForms.where((sf) => sf.fillStatus == false).toList();
    if (unfilledSubForms.isEmpty) return null;

    return PatientForm(
      formID: formID,
      formName: formName,
      fillStatus: fillStatus,
      // initStatus: initStatus,
      subForms: unfilledSubForms,
    );
  }
}

class PatientSubForm {
  int formID;
  int subFormID;
  String subFormName;
  int patientFormID;
  bool fillStatus;
  int commentCount;

  PatientSubForm({
    required this.formID,
    required this.subFormID,
    required this.subFormName,
    required this.patientFormID,
    required this.fillStatus,
    required this.commentCount
  });

  factory PatientSubForm.fromJson(Map<String, dynamic> json, {int? formID, int? patientFormID}) {
    return PatientSubForm(
      formID: formID ?? json['formId'] as int? ?? -1,
      subFormID: json['subFormId'] as int? ?? -1,
      subFormName: json['subFormName'] as String? ?? "Unknown",
      patientFormID: patientFormID ?? -1,
      fillStatus: json['status'] as bool? ?? false,
      commentCount: json["comment_count"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'formId': formID,
      'subFormID': subFormID,
      'subFormName': subFormName,
      'patient_form_id': patientFormID,
      'status': fillStatus,
      "comment_count" : commentCount,
    };
  }

  static List<PatientSubForm> fromJsonList(List<dynamic> jsonList,
      {int? formID, int? patientFormID}) {
    return jsonList
        .map((json) => PatientSubForm.fromJson(json, formID: formID, patientFormID: patientFormID))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<PatientSubForm> modelList) {
    return modelList.map((model) => model.toJson()).toList();
  }
}

class PatentDataEpisode {
  final int pt_id;
  final int ptEpisodeId;
  final int episodeId;
  final int chartId;
  final String label;
  final String? episodeFrom;
  final String? episodeTo;

  const PatentDataEpisode({
    required this.pt_id,
    required this.ptEpisodeId,
    required this.episodeId,
    required this.chartId,
    required this.label,
    this.episodeFrom,
    this.episodeTo,
  });
}
