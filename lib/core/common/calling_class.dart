import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/calling_controller.dart';
import '../../pages/video_calling/callingconst_screen.dart';


class InitiateClass{
  final callController = Get.put(CallingController());
  void CallInitiateFunction({required BuildContext context,
    required List<int> participentId, required String callType, required bool isVideo}) async{
    var callResponse = await callController.addCallInitiate(context,
        participantUserIds: participentId,
        callType: callType,
        isVideo: isVideo);
    if(callResponse.statusCode == 201 || callResponse.statusCode == 200){
      print('Call response ${callResponse.data}');
      final data = callResponse.data as Map<String, dynamic>;
      Navigator.push(context, MaterialPageRoute(builder: (_)=>
          VideoCallAgoraScreen(
            isVideoOn: isVideo,
            isAudioOn: true,
            channelName: data['channelName'] ?? '',
            groupImage: data['groupImage'] ?? '',
            groupName:data['groupName'] ?? '',
            token: data['token'] ?? '',
            callId: data['callId'] ?? '',
            receiverImages: (data['receiverImages'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
            receiverNames: (data['receiverNames'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
            receiverIds: (data['receiverUserId'] as List<dynamic>?)?.map((e) => int.tryParse(e.toString()) ?? 0).toList() ?? [],
          )));
    }else{
      print('Call error ${callResponse.message}');
    }
  }
}