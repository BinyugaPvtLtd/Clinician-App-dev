import 'package:clinician_app/controller/repository/profile_repo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/profile/update_documents_model.dart';
import '../services/auth_api_services/auth_services.dart';

class UpdateDocumentsController extends GetxController {
  final ApiService _api = Get.put(ApiService());
  final isDocListLoading = false.obs;
  final error = ''.obs;
  final documentResponseModel = DocumentResponseModel(
      document: []).obs;
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
}