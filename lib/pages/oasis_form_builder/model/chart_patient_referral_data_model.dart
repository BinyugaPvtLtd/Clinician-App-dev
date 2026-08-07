import 'package:clinician_app/pages/oasis_form_builder/model/patient_chart.dart';

class ChartPatientReferral {
  int patientId;
  String firstName;
  String lastName;
  String contactNumber;
  String address;
  String imageUrl;
  Gender? gender;
  DateTime dateOfBirth;
  int chartNo;
  List<Episode> episodes;
  List<PatientChart> charts=[];

  ChartPatientReferral({
    required this.patientId,
    required this.firstName,
    required this.lastName,
    required this.contactNumber,
    required this.address,
    required this.imageUrl,
    required this.gender,
    required this.dateOfBirth,
    required this.chartNo,
    required this.episodes,
  }) {
    if (imageUrl.isEmpty) {
      imageUrl = gender == null
          ? 'https://avatar.iran.liara.run/username?username=$firstName+$lastName'
          : gender!.genderName.toLowerCase() == "male"
              ? "https://avatar.iran.liara.run/public/boy"
              : "https://avatar.iran.liara.run/public/girl";
    }
  }

  factory ChartPatientReferral.fromJson(Map<String, dynamic> json) {
    return ChartPatientReferral(
      patientId: json['pt_id'] as int? ?? 0,
      firstName: json['pt_first_name'] as String? ?? "Unknown",
      lastName: json['pt_last_name'] as String? ?? "Unknown",
      contactNumber: json['pt_contact_no'] as String? ?? "N/A",
      address: json['pt_address'] as String? ?? "N/A",
      imageUrl: json['pt_img_url'] as String? ?? "",
      gender: json['gender'] == null ? null : Gender.fromJson(json['gender']),
      dateOfBirth: json['pt_date_of_birth'] != null
          ? DateTime.tryParse(json['pt_date_of_birth']) ?? DateTime(1900)
          : DateTime(1900),
      chartNo: json['pt_chart_no'] as int? ?? 0,
      episodes: Episode.fromJsonList(json['episodes'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pt_id': patientId,
      'pt_first_name': firstName,
      'pt_last_name': lastName,
      'pt_contact_no': contactNumber,
      'pt_address': address,
      'pt_img_url': imageUrl,
      'gender': gender?.toJson(),
      'pt_date_of_birth': dateOfBirth.toIso8601String(),
      'pt_chart_no': chartNo,
      'episodes': Episode.toJsonList(episodes),
    };
  }

  static List<ChartPatientReferral> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ChartPatientReferral.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(
      List<ChartPatientReferral> modelList) {
    return modelList.map((model) => model.toJson()).toList();
  }
}

class Gender {
  int genderID;
  String genderName;

  Gender({
    required this.genderID,
    required this.genderName,
  });

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(genderID: json['gender_id'], genderName: json['gender_name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'gender_id': genderID,
      'gender_name': genderName,
    };
  }
}

class Episode {
  int patientEpisodeID;
  int patientID;
  int chartID;
  int episodeID;

  Episode({
    required this.patientEpisodeID,
    required this.patientID,
    required this.chartID,
    required this.episodeID,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      patientEpisodeID: json['patient_episode_id'] as int? ?? 0,
      patientID: json['patient_id'] as int? ?? 0,
      chartID: json['chart_id'] as int? ?? 0,
      episodeID: json['episode_id'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patient_episode_id': patientEpisodeID,
      'patient_id': patientID,
      'chart_id': chartID,
      'episode_id': episodeID,
    };
  }

  static List<Episode> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Episode.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Episode> modelList) {
    return modelList.map((model) => model.toJson()).toList();
  }
}
