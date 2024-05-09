import 'package:etask/bloc/task/task_manager_bloc.dart';
import 'package:etask/screens/add_task.dart';
import 'package:etask/widget/user_dp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late TaskManagerBloc _taskManagerBloc;

  @override
  void initState() {
    _taskManagerBloc = BlocProvider.of<TaskManagerBloc>(context);
    _taskManagerBloc.add(GetTasks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.space_dashboard_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Text(
                  'Task List',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const UserDp()
          ],
        ),
      ),
      body: BlocBuilder<TaskManagerBloc, TaskManagerState>(
        builder: (context, state) {
          if (state is TaskManagerLoaded) {
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 280,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 30,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.square_favorites_alt,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '10',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.mail,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '3',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20).copyWith(top: 30),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.tasks[index].title,
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                height: 1.2),
                                          ),
                                          const SizedBox(height: 12),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 48.0),
                                            child: Text(
                                              state.tasks[index].description,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                height: 1.2,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: SizedBox.shrink(),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              CircleAvatar(
                                                radius: 45,
                                                backgroundImage: NetworkImage(
                                                  state.tasks[index]
                                                              .assignedTo !=
                                                          null
                                                      ? state.tasks[index]
                                                          .assignedTo!.dp
                                                      : "",
                                                ),
                                              ),
                                              //hand icon
                                              Positioned(
                                                left: 0,
                                                bottom: 0,
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors
                                                        .orangeAccent[700],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons.back_hand_sharp,
                                                    color: Colors.white,
                                                    size: 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          //start button
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.orange,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Text(
                                                  'Start',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BlocProvider.value(
                value: _taskManagerBloc, child: const AddTask());
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
