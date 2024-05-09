part of 'task_manager_bloc.dart';

@immutable
abstract class TaskManagerEvents {}

class CreateTask extends TaskManagerEvents {
  final Task task;
  CreateTask({required this.task});
}

class GetTasks extends TaskManagerEvents {}

class LoadTasks extends TaskManagerEvents {
  final List<Task> tasks;
  LoadTasks({required this.tasks});
}
