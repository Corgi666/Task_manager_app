

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taskmanager/colors/app_colors.dart';

Widget buttonWidget(BuildContext context, String text, int typeButton) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    width: double.maxFinite,
    height: MediaQuery.of(context).size.height / 14,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: typeButton == 0 ? AppColors.smallTextColor : Colors.white),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 26,
            color: typeButton == 0
                ? Colors.white
                : typeButton == 1
                    ? AppColors.secondaryColor
                    : AppColors.mainColor),
      ),
    ),
  );
}

Widget TextFieldWidget(TextEditingController textContoller, String hintText) {
  return TextField(
    maxLines: hintText == 'Task name' ? 1 : 3,
    controller: textContoller,onChanged: (value) {
      
    },
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.textHolder,
      hintText: hintText,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(hintText == 'Task name' ? 30 : 15),
        borderSide: const BorderSide(color: Colors.white, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(hintText == 'Task name' ? 30 : 15),
        borderSide: const BorderSide(color: Colors.white, width: 1),
      ),
    ),
  );
}

Widget iconWidget(IconData icon) {
  return Container(
    margin: const EdgeInsets.only(right: 5),
    height: 40,
    width: 40,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: icon == Icons.add ? AppColors.mainColor : Colors.transparent),
    child: Icon(
      icon,
      size: 30,
      color: icon == Icons.add ? Colors.white : AppColors.secondaryColor,
    ),
  );
}

Widget TaskList(String text) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    width: double.maxFinite,
    height: 75,
    alignment: Alignment.center,
    color: AppColors.textGrey,
    child: Text(
      text,
      style: const TextStyle(fontSize: 20, color: Colors.black54),
    ),
  );
}

Widget leftEditIcon() {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    color: AppColors.smallTextColor,
    alignment: Alignment.centerRight,
    child: Row(
      children: const [
        Text(
          'Edit',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(Icons.edit, color: Colors.white)
      ],
    ),
  );
}

Widget rightDeleteIcon() {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    color: Colors.red,
    alignment: Alignment.centerRight,
    child: Row(
      children: const [
        Icon(
          Icons.delete,
          color: Colors.white,
        ),
        SizedBox(width: 5),
        Text('Delete', style: TextStyle(fontSize: 16, color: Colors.white)),
      ],
    ),
  );
}

Widget bottomSheetEditor(BuildContext context) {
  return Container(
    height: 500,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: AppColors.mainColor.withOpacity(0.5),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [buttonWidget(context, 'View', 0),buttonWidget(context, 'Edit', 1)],
        )),
  );
}

