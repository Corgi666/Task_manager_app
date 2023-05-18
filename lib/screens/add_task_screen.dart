// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/controller/data_controller.dart';
// import 'package:taskmanager/colors/app_colors.dart';
import 'package:taskmanager/widgets/screens_widget.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: 'Name Task');
    TextEditingController detialController =
        TextEditingController(text: 'Detial');

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 20),
            height: MediaQuery.of(context).size.width / 2.05715,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/header1.jpg'), fit: BoxFit.cover),
            ),
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.purple,
              ),
            ),
          ),
          SizedBox(height: 70),
          TaskBody(nameController, detialController, context),
        ],
      )),
    );
  }

  Widget TaskBody(TextEditingController nameController,
      TextEditingController detialController, BuildContext context) {
    bool _dataValidation() {
      if (nameController.text.trim() == '') {
        Get.snackbar('Task name', "Task name is emtry");
        return false;
      } else if (detialController.text.trim() == '') {
        Get.snackbar('TaskDetial', "Task Detial is Emptry");
        return false;
      } else {
        return true;
      }
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextFieldWidget(nameController, 'Task name'),
          SizedBox(height: 20),
          TextFieldWidget(detialController, 'Task detial'),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              _dataValidation();
            },
            child: GestureDetector(
              onTap: () {
                Get.find<DataController>()
                    .postData(nameController.text, detialController.text);
                print(nameController.text);
              },
              child: buttonWidget(context, 'Add', 0),
            ),
          ),
        ],
      ),
    );
  }
}
