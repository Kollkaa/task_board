import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:task_board/models/task.dart';
import 'package:task_board/moduls/home/controllers/home_controller.dart';
import 'package:task_board/storage/colors/colors_macket.dart';
import 'package:task_board/storage/styles/text_style_macket.dart';

class ItemTask extends StatelessWidget{
  Task task;

  ItemTask(this.task);

  HomeController homeController =Get.find();
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        width: Get.width,
        height: 40,
        child: Row(
          children: [
            SizedBox(
              height: 15,
              width: 15,
              child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: task.done,
                  onChanged: (value){
                    homeController.updateTask(task,value);
                  }
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                task.title,
                style: styleTitleTask,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
      actions: [],
      secondaryActions: [
        GestureDetector(
          onTap: () {
            homeController.removeTask(task);
          },
          child: Container(
            width: 80,
            height: 80,
            color: colorSemanticError,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete)

              ],
            ),
          ),
        )
      ],
    );

  }

}