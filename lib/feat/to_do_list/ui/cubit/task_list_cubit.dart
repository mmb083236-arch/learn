import 'package:bloc/bloc.dart';
import 'package:learn/feat/to_do_list/data/module/task.dart';
import 'package:learn/feat/to_do_list/data/repo/storage_Task_List_control.dart';
import 'package:learn/feat/to_do_list/ui/cubit/task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  TaskListCubit() : super(InitTaskList()) {
    get();
  }

  bool show = false;
  // if you want save or get data use StorageTaskListControl don't use  StorageTaskList

  Future<void> add(Task task) async {
    List<Task> loadedData = (await StorageTaskListControl().get())!;

    loadedData.add(task);
    await StorageTaskListControl().save(loadedData);
     emit(UpdateTaskList(taskList: loadedData));
  }

  void clear() async {
    await StorageTaskListControl().save([]);
    emit(UpdateTaskList(taskList: []));
  }

  void delete(int index) async {
    List<Task> loadedData = (await StorageTaskListControl().get())!;

    loadedData.removeAt(index);
    StorageTaskListControl().save(loadedData);
    emit(UpdateTaskList(taskList: loadedData));
  }

  void chak(int index, bool val) async {
    List<Task> loadedData = (await StorageTaskListControl().get())!;
    // here we chaging all task with old propreates and chak prop we changing valeu with pram val
    loadedData[index] = Task(
      name: loadedData[index].name,
      dicription: loadedData[index].dicription,
      chak: val,
    );
    await StorageTaskListControl().save(loadedData);
    emit(UpdateTaskList(taskList: loadedData));
  }

  Future<void> edit(
    int index,
    String? newName, {
    String? newDiscription,
  }) async {
    List<Task> loadedData = (await StorageTaskListControl().get())!;
    print(newName);
    loadedData[index] = Task(
      name: newName != null || newName!.isNotEmpty
          ? newName
          : loadedData[index].name,
      dicription: newDiscription != null ? newDiscription : "",
      chak: loadedData[index].chak,
    );
    
    await StorageTaskListControl().save(loadedData);
    emit(UpdateTaskList(taskList: loadedData));
  }

  void showTextField() async {
    show = !show;
    final storage = StorageTaskListControl();
    emit(UpdateTaskList(taskList: (await storage.get())!));
  }

  Future<void> get() async {
    final storage = StorageTaskListControl();
    emit(UpdateTaskList(taskList: (await storage.get())!));
  }
}
