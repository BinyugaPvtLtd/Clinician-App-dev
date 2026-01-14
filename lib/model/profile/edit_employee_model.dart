class EmployeePrefill{
  final int employeeId;
  final String employeeFirstName;
  final String employeeLastName;
  final String employeeEmail;
  final String employeePhone;
  final String employeeAddress;
  final String employeeImage;

  EmployeePrefill({
    required this.employeeId,
    required this.employeeFirstName,
    required this.employeeLastName,
    required this.employeeEmail,
    required this.employeePhone,
    required this.employeeAddress,
    required this.employeeImage,
  });
}

class EmployeeIdByEmail{
  final int employeeId;
  EmployeeIdByEmail({
    required this.employeeId,
  });
}