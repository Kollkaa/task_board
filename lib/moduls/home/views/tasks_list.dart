import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_board/moduls/home/components/create_new_task.dart';
import 'package:task_board/moduls/home/components/item_task.dart';
import 'package:task_board/moduls/home/controllers/home_controller.dart';

class TasksList extends StatelessWidget{
  HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CreateNewTaskWidget(),
        Expanded(
          child: ReorderableListView(
            children: [
              ..._homeController.listTasks.map(
                      (task) => Container(
                        key: ObjectKey(task),
                        child: ItemTask(task),
                      )
              ).toList()
            ],
            onReorder: _homeController.onReorder,
          ),
        )
      ],
    );
  }

}