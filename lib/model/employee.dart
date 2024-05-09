class Employee {
  final String name;
  final String email;
  final String dp;

  Employee({required this.name, required this.email, required this.dp});

  @override
  String toString() {
    return 'Employee{name: $name, email: $email, dp: $dp}';
  }

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      email: json['email'],
      dp: json['dp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'dp': dp,
    };
  }
}
