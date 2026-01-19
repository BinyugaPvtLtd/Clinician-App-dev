import 'dart:io';

import 'package:clinician_app/controller/repository/profile_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core/common/base64_conversation.dart';
import '../core/constant/app_string.dart';
import '../model/profile/update_documents_model.dart';
import '../model/request/request_data_model.dart';
import '../services/auth_api_services/auth_services.dart';

class UpdateDocumentsController extends GetxController {
  final ApiService _api = Get.put(ApiService());
  final isDocListLoading = false.obs;
  final isDocumentSaveLoading = false.obs;
  final error = ''.obs;
  final documentResponseModel = DocumentResponseModel(
      document: []).obs;
  final RxString fileName = ''.obs;
  final RxString filePath = ''.obs;

  Future<void> pickDocument() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );

      if (result == null || result.files.isEmpty) {
        // user canceled
        return;
      }

      final picked = result.files.first;

      fileName.value = picked.name;
      filePath.value = picked.path ?? '';

      if (filePath.value.isEmpty) {
        Get.snackbar("Error", "File path not found");
        return;
      }

      // If you want File object:
      final file = File(filePath.value);
      // Use file for upload API...
      // uploadFile(file);

      Get.snackbar("Selected", picked.name);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void clearFile() {
    fileName.value = '';
    filePath.value = '';
  }
  Future<void> fetchDocListDetails({required int empId,
    required String approveOnly,
    required String searchText,}) async {
    documentResponseModel.value = await getDocumentListData(empId: empId, approveOnly: approveOnly, searchText: searchText);
  }

  Future<DocumentResponseModel> getDocumentListData({
    required int empId,
    required String approveOnly,
    required String searchText,
  }) async {
    DocumentResponseModel? itemData;

    String formatIOSDate(String iosDate) {
      if (iosDate.isEmpty) return '';

      DateTime dateTime = DateTime.parse(iosDate);

      return DateFormat('dd/MM/yyyy')
          .format(dateTime)
          .toLowerCase();
    }

    try {
      isDocListLoading.value = true;
      error.value = '';

      final res = await _api.get(
        ProfileRepository.getUpdateListDocument(
          employeeId: empId,
          approveOnly: approveOnly, search: searchText,
        ),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        List<DocumentGroup> docData = [];

        if (res.data["document"] != null) {
          for (var d in res.data["document"]) {

            List<EmployeeDocument> docList = [];

            if (d["docList"] != null) {
              for (var doc in d["docList"]) {
                docList.add(
                  EmployeeDocument(
                    employeeDocumentId: doc['employeeDocumentId'] ?? 0,
                    employeeId: doc['employeeId'] ?? 0,
                    documentUrl: doc['DocumentUrl'] ?? '',
                    employeeDocumentTypeMetaDataId:
                    doc['EmployeeDocumentTypeMetaDataId'] ?? 0,
                    employeeDocumentTypeSetupId:
                    doc['EmployeeDocumentTypeSetupId'] ?? 0,
                    uploadDate: doc['UploadDate'] ?? '',
                    approved: doc['approved'] ?? false,
                    documentName: doc['documentName'] ?? '',
                    expiryDate: doc['expiry_date'] != null ? formatIOSDate(doc['expiry_date']) : '--',
                    docStatus: doc['docStatus'] ?? '',
                  ),
                );
              }
            }

            docData.add(
              DocumentGroup(
                docName: d['docName'] ?? '',
                metaId: d['metaId'] ?? 0,
                docList: docList,
              ),
            );
          }
        }


        itemData = DocumentResponseModel(document: docData);

      } else {
        error.value = "Failed to list data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isDocListLoading.value = false;
    }

    // ✅ GUARANTEED NON-NULL RETURN
    return itemData ?? DocumentResponseModel(document: []);
  }


  Future<List<EmployeeDubDocumentDropDownModel>> getSubDocumentListDropdown({
    required int docMetaId,

  }) async {
    List<EmployeeDubDocumentDropDownModel> itemData = [];

    String formatIOSDate(String iosDate) {
      if (iosDate.isEmpty) return '';

      DateTime dateTime = DateTime.parse(iosDate);

      return DateFormat('dd/MM/yyyy')
          .format(dateTime)
          .toLowerCase();
    }

    try {
      isDocListLoading.value = true;
      error.value = '';

      final res = await _api.get(
        ProfileRepository.getSubDocListDocument(docMetaId: docMetaId

        ),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        for(var item in res.data){
          itemData.add(EmployeeDubDocumentDropDownModel(
              employeeDocumentTypeSetupId: item['EmployeeDocumentTypeSetupId'] ?? 0,
              documentName: item['DocumentName'] ?? '',
              expiry: item['Expiry'] ?? '',
              reminderThreshold: item['ReminderThreshold'] ?? '',
              employeeDocumentTypeMetaDataId: item['EmployeeDocumentTypeMetaDataId'] ?? 0,
              idOfDocument: item['idOfDocument'] ?? '',
              companyId: item['companyId'] ?? 0,
              expiry_type: item['expiry_type'] ?? '',
              threshold: item['threshold'] ?? 0));
        }
      } else {
        error.value = "Failed to list data";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isDocListLoading.value = false;
    }

    // ✅ GUARANTEED NON-NULL RETURN
    return itemData;
  }

  /// upload document
  Future<ApiData> postUploadDocumentData({
    required int docMetaId,
    required int docTypeSetupId,
    required int empId,
  }) async {
    try {
      isDocumentSaveLoading.value = true;
      error.value = '';

      final res = await _api.post(ProfileRepository.postUploadDocument(
          docMetaId: docMetaId,
          docTypeSetupId: docTypeSetupId,
          empId: empId), {
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        // final data = res.data as Map<String, dynamic>;
        return ApiData(
            success: true,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }else{
        error.value = res.statusMessage!;
        return ApiData(
            success: false,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }
    } catch (e) {
      error.value = e.toString();
      return ApiData(
          success: false,
          message:AppString.somethingWentWrong,
          statusCode: 404
      );
    } finally {
      isDocumentSaveLoading.value = false;
    }
  }

  /// Upload base 64
  Future<ApiData> postUploadDocumentBase64Data({
    required int docMetaId,
    required int docTypeSetupId,
    required int empId,
    required dynamic base64File,
    required String documentName,
    required String expiryDate,
  }) async {
    try {
      isDocumentSaveLoading.value = true;
      error.value = '';
      final String base64 = await FileUtils.fileToBase64(base64File!);
      final res = await _api.post(ProfileRepository.postUploadDocumentBase64(
          docMetaId: docMetaId,
          docTypeSetupId: docTypeSetupId,
          empId: empId), {
        "base64": base64,
        "expiry_date": expiryDate,
        "documentName": documentName
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        // final data = res.data as Map<String, dynamic>;
        return ApiData(
            success: true,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }else{
        error.value = res.statusMessage!;
        return ApiData(
            success: false,
            message: res.statusMessage!,
            statusCode: res.statusCode!
        );
      }
    } catch (e) {
      error.value = e.toString();
      return ApiData(
          success: false,
          message:AppString.somethingWentWrong,
          statusCode: 404
      );
    } finally {
      isDocumentSaveLoading.value = false;
    }
  }
}