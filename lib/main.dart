import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/controller/data_controller.dart';
import 'package:taskmanager/screens/add_task_screen.dart';
import 'package:taskmanager/screens/all_task_screen.dart';

import 'screens/home_screen.dart';

void main(List<String> args) {
Get.put(DataController());
Get.find<DataController>().getData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const homescreen()),
        GetPage(
          name: '/addtask',
          page: () => const AddTaskScreen(),
          transition: Transition.cupertinoDialog,
        ),
        GetPage(
            name: '/alltask',
            page: () => const AllTaskScreen(),
            transition: Transition.cupertino)
      ],
      title: 'TASK MANAGER',
      home: homescreen(),
    );
  }
}
