// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taskmanager/colors/app_colors.dart';
import 'package:taskmanager/controller/data_controller.dart';
import 'package:taskmanager/widgets/screens_widget.dart';
import 'package:get/get.dart';
class AllTaskScreen extends StatelessWidget {
  const AllTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DataController controller = Get.put(DataController());
    
    List myData = ['Try harder', 'Try smarter'];

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
                onTap: () =>Get.back(),
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.purple,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              width: double.maxFinite,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [GestureDetector(onTap: () => Get.find<DataController>().getData(),child: iconWidget(Icons.home),), iconWidget(Icons.add)],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        iconWidget(Icons.library_books),
                        Text(
                          '2',
                          style: TextStyle(fontSize: 26),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftEditIcon(),
                    secondaryBackground: rightDeleteIcon(),
                    onDismissed: (direction) {},
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return bottomSheetEditor(context);
                            });
                        return false;
                      } else if (direction == DismissDirection.endToStart) {
                        // return true;
                        return Future.delayed(Duration(milliseconds: 30),
                            () => direction == DismissDirection.startToEnd);
                      }
                    },
                    key: ObjectKey(index),
                    child: Container(
                      child: TaskList(myData[index]),
                    ),
                  );
                },
                itemCount: myData.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
