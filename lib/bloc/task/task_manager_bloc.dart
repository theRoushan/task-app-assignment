import 'dart:developer';

import 'package:etask/model/task.dart';
import 'package:etask/repositories/task_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'task_manager_events.dart';
part 'task_manager_state.dart';

class TaskManagerBloc extends Bloc<TaskManagerEvents, TaskManagerState> {
  TaskManagerBloc() : super(TaskManagerInitial()) {
    on<CreateTask>(_onCreateTask);
    on<GetTasks>(_onGetTasks);
    on<LoadTasks>(_onLoadTasks);
  }

  void _onCreateTask(CreateTask event, Emitter<TaskManagerState> emit) async {
    try {
      final task = event.task;
      log('Task: $task');

      final oldTasks = (state as TaskManagerLoaded).tasks;

      final allTasks = [...oldTasks, task];
      log('All Tasks: $allTasks');

      await TaskRepository().saveTasks(allTasks);
      emit(TaskManagerLoaded(allTasks));
    } catch (e) {
      emit(TaskManagerError(e.toString()));
    }
  }

  void _onGetTasks(GetTasks event, Emitter<TaskManagerState> emit) async {
    emit(TaskManagerLoading());
    try {
      final tasks = await TaskRepository().getTasks();
      emit(TaskManagerLoaded(tasks));
    } catch (e) {
      emit(TaskManagerError(e.toString()));
    }
  }

  void _onLoadTasks(LoadTasks event, Emitter<TaskManagerState> emit) {
    emit(TaskManagerLoading());
    try {
      final tasks = event.tasks;
      emit(TaskManagerLoaded(tasks));
    } catch (e) {
      emit(TaskManagerError(e.toString()));
    }
  }
}
