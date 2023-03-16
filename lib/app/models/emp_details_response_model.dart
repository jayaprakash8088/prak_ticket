class EmployeeDetailsResponseModel {
  String? empid;
  String? employee_Name;
  String? password;
  String? status;
  String? user_Code;
  String? user_Type;
  int? user_level;
  String? venue;

  EmployeeDetailsResponseModel(
      {this.empid,
      this.employee_Name,
      this.password,
      this.status,
      this.user_Code,
      this.user_Type,
      this.user_level,
      this.venue});

  factory EmployeeDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return EmployeeDetailsResponseModel(
      empid: json['empid'],
      employee_Name: json['employee_Name'],
      password: json['password'],
      status: json['status'],
      user_Code: json['user_Code'],
      user_Type: json['user_Type'],
      user_level: json['user_level'],
      venue: json['venue'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empid'] = empid;
    data['employee_Name'] = employee_Name;
    data['password'] = password;
    data['status'] = status;
    data['user_Code'] = user_Code;
    data['user_Type'] = user_Type;
    data['user_level'] = user_level;
    data['venue'] = venue;
    return data;
  }
}
