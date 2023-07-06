import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataC extends StatelessWidget {
  DataC({this.title, this.val, this.icon});

  var title, val, icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(5)),

          // height: Get.height / 5,
          width: Get.width / 2.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'orkney',
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                )
              ]),
              Row(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Colors.blue),
                  //       borderRadius: BorderRadius.circular(30)),
                  //   child: Icon(icon ?? Icons.access_alarm),
                  // ),
                  Container(
                    child: Text(val,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'orkney',
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
