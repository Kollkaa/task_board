import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_board/components/loader.dart';
import '../controllers/home_controller.dart';
import 'package:task_board/storage/colors/colors_macket.dart';
import 'package:task_board/storage/styles/text_style_macket.dart';
import 'tasks_list.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  HomeController _homeController = Get.put(HomeController());

@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: colorBasic0,
      appBar: AppBar(
        title: Text(
          "TASK BOARD",style: styleTitle,
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Obx(
          ()=>_homeController.load.value?
              TasksList():
              Loader()
      ),
    );
  }
}