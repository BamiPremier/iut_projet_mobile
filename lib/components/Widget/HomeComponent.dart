import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeComponent extends StatelessWidget {
  HomeComponent({this.title, this.onTap});

  var title, onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 3),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          height: Get.height / 5,
          width: Get.width / 2.5,
          child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'orkney',
                  color: Colors.black,
                  fontWeight: FontWeight.bold))),
      onTap: onTap,
    );
  }
}
