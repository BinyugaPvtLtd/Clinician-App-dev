class PatientChart {
  int chartId;
  int patientId;

  PatientChart({required this.chartId, required this.patientId});

  static PatientChart fromJson(Map<String, dynamic> json) {
    return PatientChart(
        chartId: json['pt_chart_no'] ?? -1, patientId: json['pt_id'] ?? -1);
  }

  static List<PatientChart> listFromJson(List jsonList)
  {
    return jsonList.map((json)=>fromJson(json)).toList(

    );
  }
}
