import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/feat/pomodoro/ui/screen/pomodoro_screen.dart';
import 'package:learn/feat/to_do_list/ui/cubit/task_list_cubit.dart';
import 'package:learn/feat/to_do_list/ui/cubit/task_list_state.dart';
import 'package:learn/feat/to_do_list/ui/prp/edit.dart';

import 'package:learn/feat/to_do_list/ui/screen/add_task_screen.dart';
import 'package:learn/feat/to_do_list/ui/widget/Cart.dart';

class ToDoListScreen extends StatelessWidget {
  ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskListCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PomodoroScreen()),
                );
              },
              icon: Icon(Icons.timer),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<TaskListCubit, TaskListState>(
            builder: (context, state) {
              return BlocListener<TaskListCubit, TaskListState>(
                listener: (context, state) {
                  
                },
                child: Container(
                  child: Stack(
                    children: [
                      state.taskList.isEmpty
                          ? Container(
                              alignment: Alignment.center,
                              child: Text(
                                "you don't have tasks",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: state.taskList.length,
                                itemBuilder: ((context, index) {
                                  var task = state.taskList[index];
                                  return Cart(
                                    name: task.name!,
                                    discrption: task.dicription!,
                                    chak: task.chak!,
                                    index: index,
                                    controllers: [
                                      edit.textEditingControllerName,
                                      edit.textEditingControllerDiscription,
                                    ],
                                  );
                                }),
                              ),
                            ),

                      Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: [
                            FloatingActionButton(
                              child: Text(
                                "refresh",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              onPressed: () {
                                context.read<TaskListCubit>().get();
                              },
                            ),

                            FloatingActionButton(
                              child: Text(
                                "add",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AddTaskScreen(),
                                  ),
                                );
                              },
                            ),

                            FloatingActionButton(
                              child: Text(
                                "clear",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              onPressed: () {
                                context.read<TaskListCubit>().clear();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
