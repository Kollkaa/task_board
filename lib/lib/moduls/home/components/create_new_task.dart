import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_board/moduls/home/controllers/home_controller.dart';
import 'package:task_board/storage/colors/colors_macket.dart';
import 'package:task_board/storage/styles/text_style_macket.dart';

class CreateNewTaskWidget extends StatelessWidget{
  HomeController homeController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            width: Get.width,
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.add,color: colorBrandPrimary,),
                Text("Создать таску", style: styleCreateTask,)
              ],
            ),
          ),
          onTap: homeController.startCreate,
        ),
        Obx(
            ()=>homeController.creating.value?
                getCreateTask()
                :Container()
        )
      ],
    );
  }

  Widget getCreateTask() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20
      ),
      width: Get.width,
      height: 60,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 15),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      width: 1,
                      color: colorSemanticAttention
                  )
              ),
              child: Icon(Icons.done,color: colorBrandPrimary,),
            ),
            onTap: homeController.addNewTask,
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              controller: homeController.titleTextEditingControllerCreateTask,
              decoration: InputDecoration(
                  hintText: "Придумайте название заданию",
                  isDense: true,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero
              ),
            ),
          )
        ],
      ),
    );
  }


}