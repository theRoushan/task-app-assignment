import 'package:etask/bloc/task/task_manager_bloc.dart';
import 'package:etask/model/employee.dart';
import 'package:etask/model/task.dart';
import 'package:etask/widget/custom_text_field.dart';
import 'package:etask/widget/employee_dropdown.dart';
import 'package:etask/widget/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  List<Employee> employees = [
    Employee(
      name: 'John Doe',
      email: 'john@gmail.com',
      dp: "https://randomuser.me/api/portraits/women/29.jpg",
    ),
    Employee(
      name: 'Jane Doe',
      email: 'jane@gmail.com',
      dp: "https://randomuser.me/api/portraits/men/29.jpg",
    ),
    Employee(
      name: 'John Smith',
      email: 'john@gmail.com',
      dp: "https://randomuser.me/api/portraits/women/29.jpg",
    ),
  ];

  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  Employee? selectedEmployee;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            //title. description and list of employees in a dropdown
            CustomTextField(
              controller: titleController,
              labelText: 'Title',
              hintText: 'Enter the title of the task',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the title';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            CustomTextField(
              maxLength: 150,
              maxLines: 4,
              controller: descriptionController,
              labelText: 'Description',
              hintText: 'Enter the description of the task',
            ),

            const SizedBox(height: 20),

            //dropdown
            CustomDropdownButtonFormField(
              employees: employees,
              onChanged: (value) {
                setState(() {
                  selectedEmployee = value;
                });
              },
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //save the task in bloc
                  BlocProvider.of<TaskManagerBloc>(context).add(
                    CreateTask(
                      task: Task(
                        title: titleController.text,
                        description: descriptionController.text,
                        assignedTo: selectedEmployee,
                      ),
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              label: 'Add Task',
            )
          ],
        ),
      ),
    );
  }
}
