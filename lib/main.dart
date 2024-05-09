import 'package:etask/bloc/task/task_manager_bloc.dart';
import 'package:etask/screens/task_list.dart';
import 'package:etask/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appThemeData,
      home: BlocProvider(
        create: (context) => TaskManagerBloc(),
        child: const TaskListScreen(),
      ),
    );
  }
}
