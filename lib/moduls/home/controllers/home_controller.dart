import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_board/models/task.dart';

class HomeController extends GetxController {
  //Хранилище приложения
  final GetStorage storage = GetStorage();

  //Чекер загрузки
  RxBool load=false.obs;

  //Лист тасок
  RxList listTasks=[].obs;

  //Чекер создания новой таски
  RxBool creating=false.obs;

  TextEditingController titleTextEditingControllerCreateTask = new TextEditingController();

  @override
  void onInit() {
    super.onInit();
    readStorage();
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Стчитывание с памяти устройства списка тасок
  readStorage(){
    var tasks=  storage.read("tasks");
    print(tasks);
    if(tasks!=null){
      listTasks.addAll(Task().getListFromJson(tasks));
    }
    load.value=true;
  }

  //Добавление новой таски
  void addNewTask()async{
    listTasks.add(new Task(
      title: titleTextEditingControllerCreateTask.text,
      done: false
    ));
    await storage.write("tasks", Task().getListToJson(listTasks));
    creating.value=false;
    titleTextEditingControllerCreateTask.text="";
    Get.appUpdate();
  }

  //Удаление таски
  void removeTask(Task task)async{
    listTasks.remove(task);
    await storage.write("tasks", Task().getListToJson(listTasks));
  }

  //Обновление таски
  void updateTask(Task task,bool value)async{
    int index = listTasks.indexWhere((element) => element==task);
    Task updateTask = listTasks[index];
    print(updateTask.title);
    updateTask.done=value;
    listTasks[index]=updateTask;
    await storage.write("tasks", Task().getListToJson(listTasks));
    print(storage.read("tasks"));
    Get.appUpdate();
  }

  //Перемещение таски
  void onReorder(int oldIndex, int newIndex) async{
    print('oldIndex: $oldIndex , newIndex: $newIndex');
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final  item = listTasks.removeAt(oldIndex);
    listTasks.insert(newIndex, item);
    await storage.write("tasks", Task().getListToJson(listTasks));
    Get.appUpdate();
  }

  void startCreate() {
    creating.value=true;
  }

  void doneTask(bool value) {

  }
}
