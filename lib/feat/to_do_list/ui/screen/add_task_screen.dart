import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/core/colors/colors.dart';
import 'package:learn/feat/pomodoro/ui/screen/pomodoro_screen.dart';
import 'package:learn/feat/to_do_list/data/module/task.dart';
import 'package:learn/feat/to_do_list/ui/cubit/task_list_cubit.dart';
import 'package:learn/feat/to_do_list/ui/cubit/task_list_state.dart';

class AddTaskScreen extends StatelessWidget {
  new({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController discrption = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskListCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: BlocBuilder<TaskListCubit, TaskListState>(
            builder: (context, state) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      width: 500,
                      child: TextField(
                        controller: name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "task",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      width: 500,
                      child: TextField(
                        controller: discrption,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "discription",
                        ),
                      ),
                    ),
                    Container(
                      color: blue,
                      width: 500,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: MaterialButton(
                        onPressed: () {
                          context.read<TaskListCubit>().add(
                            Task(
                              name: name.text,
                              dicription: discrption.text,
                              chak: false,
                            ),
                          );
          
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          child: Text(
                            "add",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
