// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taskmanager/colors/app_colors.dart';
import 'package:taskmanager/widgets/screens_widget.dart';
import 'package:get/get.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/welcome.jpg'), fit: BoxFit.cover),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 30, top: 100, right: 30),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'start your beautiful day',
                style: TextStyle(
                    color: AppColors.smallTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 400),
              GestureDetector(
                onTap: () => Get.toNamed('addtask'),
                child: buttonWidget(context, 'Add Task', 0),
              ),
              GestureDetector(
                onTap: () => Get.toNamed('alltask'),
                child: buttonWidget(context, 'View All', 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
