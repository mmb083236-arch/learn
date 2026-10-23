import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/core/colors/colors.dart';
import 'package:learn/feat/to_do_list/ui/cubit/task_list_cubit.dart';
import 'package:learn/feat/to_do_list/ui/cubit/task_list_state.dart';
import 'package:learn/feat/to_do_list/ui/prp/edit.dart';
import 'package:learn/feat/to_do_list/ui/screen/edit_screen.dart';

class Cart extends StatefulWidget {
  final String name;
  final String discrption;
  final bool chak;
  final int index;

  final List<TextEditingController> controllers;
  new({
    super.key,
    required this.name,
    required this.discrption,
    required this.chak,
    required this.index,
    required this.controllers,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool showDiscription = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: BlocBuilder<TaskListCubit, TaskListState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    checkColor: blue,
                    value: widget.chak,
                    onChanged: ((val) =>
                        context.read<TaskListCubit>().chak(widget.index, val!)),
                  ),

                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      context.read<TaskListCubit>().delete(widget.index);
                    },
                    icon: Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      edit.index = widget.index;
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditScreen()),
                      );
                      context.read<TaskListCubit>().showTextField();
                    },
                    icon: Icon(
                      Icons.edit,
                      color: context.read<TaskListCubit>().show
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        showDiscription = !showDiscription;
                      });
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                ],
              ),
              showDiscription == true
                  ? Container(
                      alignment: Alignment.centerRight,
                      child: Text(state.taskList[widget.index].dicription!),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
