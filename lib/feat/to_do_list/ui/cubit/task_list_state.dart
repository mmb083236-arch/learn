import 'package:learn/feat/to_do_list/data/module/task.dart';

sealed class TaskListState {
  final List<Task> taskList;
 const   TaskListState({required this.taskList});

}

final class InitTaskList extends TaskListState {
 InitTaskList() : super(taskList: []); 
}

class UpdateTaskList extends TaskListState {
const   UpdateTaskList({required super.taskList});
}