import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/feat/to_do_list/ui/cubit/task_list_cubit.dart';
import 'package:learn/feat/to_do_list/ui/cubit/task_list_state.dart';
import 'package:learn/feat/to_do_list/ui/prp/edit.dart';

class EditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskListCubit(),
      child: Scaffold(
        body: BlocBuilder<TaskListCubit, TaskListState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    width: 500,
                    margin: EdgeInsets.all(20),
                    color: Colors.cyan,
                    child: TextField(
                      controller: edit.textEditingControllerName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "new task name",
                      ),
                    ),
                  ),

                  Container(
                    width: 500,
                    margin: EdgeInsets.all(20),
                    color: Colors.cyan,
                    child: TextField(
                      controller: edit.textEditingControllerDiscription,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "new discription",
                      ),
                    ),
                  ),

                  MaterialButton(
                    onPressed: () {
                      context.read<TaskListCubit>().edit(
                        edit.index,
                        edit.textEditingControllerName.text,
                        newDiscription:
                            edit.textEditingControllerDiscription.text,
                      );
                      Navigator.of(context).pop();
                    },
                    child: Container(child: Text("edit")),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
