import 'package:iut/styles/colorApp.dart';
import 'package:flutter/material.dart'; 
class AppTitleRight extends StatelessWidget {
  AppTitleRight({required this.title, required this.description});
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Row(
        children: [
          Container(
              child: Text(
            title,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                color: ColorsApp.black,
                fontWeight: FontWeight.bold),
          )),
        ],
      ),
      Container(
          child: Text(
        description,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: TextStyle(
          fontSize: 11,
          color: ColorsApp.black,
          fontFamily: 'Montserrat',
        ),
      ))
    ]));
  }
}
