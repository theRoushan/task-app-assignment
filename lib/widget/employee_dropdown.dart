import 'package:etask/model/employee.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final List<Employee> employees;
  final ValueChanged<Employee?> onChanged;

  const CustomDropdownButtonFormField({
    super.key,
    required this.employees,
    required this.onChanged,
  });

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Employee>(
      decoration: InputDecoration(
        labelText: 'Assigned To',
        hintText: 'Select the employee',
        border: _border(Colors.grey.shade400),
        errorBorder: _border(Colors.red),
        focusedErrorBorder: _border(Colors.grey.shade400),
        focusedBorder: _border(Colors.grey.shade400),
        enabledBorder: _border(Colors.grey.shade400),
      ),
      items: employees
          .map(
            (e) => DropdownMenuItem<Employee>(
              value: e,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(e.dp),
                  ),
                  const SizedBox(width: 10),
                  Text(e.name),
                ],
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
