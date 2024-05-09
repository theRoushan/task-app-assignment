import 'package:etask/model/employee.dart';

class Task {
  final String title;
  final String description;
  final Employee? assignedTo;

  Task({required this.title, required this.description, this.assignedTo});

  @override
  String toString() {
    return 'Task{title: $title, description: $description, assignedTo: $assignedTo}';
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      assignedTo: json['assignedTo'] != null
          ? Employee.fromJson(json['assignedTo'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'assignedTo': assignedTo?.toJson(),
    };
  }
}
