class EmployeeType {
  final int employeeTypeId;
  final String employeeType;
  final String color;
  final String abbreviation;
  final int departmentId;

  EmployeeType({
    required this.employeeTypeId,
    required this.employeeType,
    required this.color,
    required this.abbreviation,
    required this.departmentId,
  });

  /// Factory constructor to create an instance from JSON map
  factory EmployeeType.fromJson(Map<String, dynamic> json) {
    return EmployeeType(
      employeeTypeId: (json['employeeTypeId']??-1) as int,
      employeeType: (json['employeeType']??'UNKNOWN') as String,
      color: (json['color']??'000000') as String,
      abbreviation: (json['abbreviation']??'UK') as String,
      departmentId: (json['DepartmentId']??-1) as int,
    );
  }

  /// Convert an instance to JSON map
  Map<String, dynamic> toJson() {
    return {
      'employeeTypeId': employeeTypeId,
      'employeeType': employeeType,
      'color': color,
      'abbreviation': abbreviation,
      'DepartmentId': departmentId,
    };
  }

  /// Convert a list of JSON objects to a list of EmployeeType instances
  static List<EmployeeType> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => EmployeeType.fromJson(json)).toList();
  }

  /// Convert a list of EmployeeType instances to a list of JSON objects
  static List<Map<String, dynamic>> toJsonList(List<EmployeeType> list) {
    return list.map((item) => item.toJson()).toList();
  }
}
