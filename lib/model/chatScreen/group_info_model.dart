
class PatientsGroupInfoData {
  final int ptGroupId;
  final String groupName;
  final String groupDescription;
  final String groupProfileUrl;
  final bool isActive;
  final String createdAt;
  final int totalMessages;
  final int unseenMessageCount;
  final List<ParticipantGroup> allParticipants;
  final List<MediaLinksData> mediaLinksAndDocs;
  final PatientGroupInfo patientInfo;

  PatientsGroupInfoData({
    required this.ptGroupId,
    required this.groupName,
    required this.groupDescription,
    required this.groupProfileUrl,
    required this.isActive,
    required this.createdAt,
    required this.totalMessages,
    required this.unseenMessageCount,
    required this.allParticipants,
    required this.mediaLinksAndDocs,
    required this.patientInfo,
  });
}

class ParticipantGroup {
  final int participantId;
  final String participantType;
  final String firstName;
  final String lastName;
  final String fullName;
  final String imgUrl;
  final String email;
  final String? address;
  final String? treatment;
  final String? lastOnline;

  ParticipantGroup({
    required this.participantId,
    required this.participantType,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.imgUrl,
    required this.email,
    this.address,
    this.treatment,
    this.lastOnline,
  });
}

class PatientGroupInfo {
  final int ptUserId;
  final String ptUserName;
  final String ptUserEmail;
  final String ptUserProfileUrl;
  final String ptUserAddress;
  final String ptUserTreatment;
  final String ptUserLastOnline;

  PatientGroupInfo({
    required this.ptUserId,
    required this.ptUserName,
    required this.ptUserEmail,
    required this.ptUserProfileUrl,
    required this.ptUserAddress,
    required this.ptUserTreatment,
    required this.ptUserLastOnline,
  });
}

class MediaLinksData{
  final String mediaID;
  final String mediaType;
  final String mediaUrl;
  final String description;
  final String datecreated;

  MediaLinksData({required this.mediaID, required this.mediaType, required this.mediaUrl,
    required this.description, required this.datecreated});

}





//
// Future<PatientsGroupInfoData?> getAllPatientsGroupInfo(BuildContext context,
//     final int id) async {
//   try {
//     final response = await Api(context).get(
//       path: CommunicationManagerRepository.getGroupInfoPatientsChats(id: id),
//     );
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       print("Patients Group Info API Response: ${response.data}");
//
//       final data = response.data;
//
//       List<Participant> participants = [];
//       if (data["allParticipants"] != null) {
//         for (var p in data["allParticipants"]) {
//           participants.add(
//             Participant(
//               participantId: p["participantId"] ?? 0,
//               participantType: p["participantType"] ?? "",
//               firstName: p["firstName"] ?? "",
//               lastName: p["lastName"] ?? "",
//               fullName: p["fullName"] ?? "",
//               imgUrl: p["imgurl"] ?? "",
//               email: p["email"] ?? "",
//               address: p["address"],
//               treatment: p["treatment"],
//               lastOnline: p["lastOnline"],
//             ),
//           );
//         }
//       }
//
//       final patientInfo = PatientInfo(
//         ptUserId: data["patientInfo"]["pt_user_id"] ?? 0,
//         ptUserName: data["patientInfo"]["pt_user_name"] ?? "",
//         ptUserEmail: data["patientInfo"]["pt_user_email"] ?? "",
//         ptUserProfileUrl: data["patientInfo"]["pt_user_profile_url"] ?? "",
//         ptUserAddress: data["patientInfo"]["pt_user_address"] ?? "",
//         ptUserTreatment: data["patientInfo"]["pt_user_treatment"] ?? "",
//         ptUserLastOnline: data["patientInfo"]["pt_user_last_online"] ?? "",
//       );
//       List<MediaLinksData> mediaData = [];
//       if (data["mediaLinksAndDocs"] != null) {
//         for (var p in data["mediaLinksAndDocs"]) {
//           mediaData.add(
//             MediaLinksData(
//                 mediaID: p['mediaId'] ?? '',
//                 mediaType: p['mediaType'] ?? '',
//                 mediaUrl: p['mediaUrl'] ?? '',
//                 description: p['description'] ?? '',
//                 datecreated: p['dateCreated'] ?? ''
//
//             ),
//           );
//         }
//       }
//
//       final groupInfo = PatientsGroupInfoData(
//         ptGroupId: data["pt_group_id"] ?? 0,
//         groupName: data["group_name"] ?? "",
//         groupDescription: data["group_description"] ?? "",
//         groupProfileUrl: data["group_profile_url"] ?? "",
//         isActive: data["is_active"] ?? false,
//         createdAt: data["created_at"] ?? "",
//         totalMessages: data["totalMessages"] ?? 0,
//         unseenMessageCount: data["unseenMessageCount"] ?? 0,
//         allParticipants: participants,
//         mediaLinksAndDocs: mediaData,
//         patientInfo: patientInfo,
//       );
//       return groupInfo;
//     } else {
//       print("Patients Group Info API Error: ${response.statusMessage}");
//       return null;
//     }
//   } catch (e) {
//     print("Patients Group Info API Exception: $e");
//     return null;
//   }
// }