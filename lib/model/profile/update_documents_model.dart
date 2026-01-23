class DocumentResponseModel {
  final List<DocumentGroup> document;

  const DocumentResponseModel({
    required this.document,
  });
}

class DocumentGroup {
  final String docName;
  final int metaId;
  final List<EmployeeDocument> docList;

  const DocumentGroup({
    required this.docName,
    required this.metaId,
    required this.docList,
  });
}

class EmployeeDocument {
  final int employeeDocumentId;
  final int employeeId;
  final String documentUrl;
  final int employeeDocumentTypeMetaDataId;
  final int employeeDocumentTypeSetupId;
  final String uploadDate;
  final bool approved;
  final String documentName;
  final String expiryDate;
  final String docStatus;

  const EmployeeDocument({
    required this.employeeDocumentId,
    required this.employeeId,
    required this.documentUrl,
    required this.employeeDocumentTypeMetaDataId,
    required this.employeeDocumentTypeSetupId,
    required this.uploadDate,
    required this.approved,
    required this.documentName,
    required this.expiryDate,
    required this.docStatus,
  });
}

/// Employee Doc dropdown
class EmployeeDubDocumentDropDownModel{
  final int employeeDocumentTypeSetupId;
  final String documentName;
  final String expiry;
  final String reminderThreshold;
  final int employeeDocumentTypeMetaDataId;
  final String idOfDocument;
  final int companyId;
  final String expiry_type;
  final int threshold;
  EmployeeDubDocumentDropDownModel({
    required this.employeeDocumentTypeSetupId,
    required this.documentName,
    required this.expiry,
    required this.reminderThreshold,
    required this.employeeDocumentTypeMetaDataId,
    required this.idOfDocument,
    required this.companyId,
    required this.expiry_type,
    required this.threshold,
  });
}

/// Document meta data model
class DocumentMetaDataModel {
  final int employeeDocumentTypeMetaDataId;
  final String documentName;

  DocumentMetaDataModel({
    required this.employeeDocumentTypeMetaDataId,
    required this.documentName,
  });
}
