part of 'task_manager_bloc.dart';

@immutable
abstract class TaskManagerState {}

class TaskManagerInitial extends TaskManagerState {}

class TaskManagerLoading extends TaskManagerState {}

class TaskManagerLoaded extends TaskManagerState {
  final List<Task> tasks;

  TaskManagerLoaded(this.tasks);
}

class TaskManagerError extends TaskManagerState {
  final String message;

  TaskManagerError(this.message);
}
