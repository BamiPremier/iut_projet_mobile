import 'package:Fahkap/controller/MyController.dart';
import 'package:Fahkap/styles/colorApp.dart';
import 'package:Fahkap/styles/textStyle.dart';
import 'package:Fahkap/utils/Services/storageService.dart';
import 'package:Fahkap/utils/constants/assets.dart';
import 'package:get/get.dart';
import 'package:Fahkap/utils/Services/routing.dart';
import 'package:Fahkap/utils/api/apiUrl.dart';
import 'package:Fahkap/utils/functions/route.dart';
import 'package:Fahkap/utils/provider/refresh_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_storage/get_storage.dart';

import 'package:jwt_decode/jwt_decode.dart';
import 'dart:async';

import 'package:flutter/services.dart' show PlatformException;

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  var box;

  start() {
    var tok = box.read('token');
    print('------------------toke ${tok}');
    Future.delayed(Duration(seconds: 10), () async {
      print('------------------toke ${tok}');
      if (box.read('token') == null) {
        box.write('first', 1);
        Get.offNamedUntil(AppLinks.LOGIN, (route) => false);
      } else {
        Get.offNamedUntil(AppLinks.HOME, (route) => false);
      }

      // MyBinding().onGetAll();
    });
  }

  @override
  void initState() {
    box = GetStorage();
    start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorsApp.blue,
        body: Container(
            alignment: Alignment.center,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                      child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text(
                        'IUT - FV',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      )),
                      Container(
                        padding: EdgeInsets.only(top: kMdHeight / 4),
                        child: SpinKitRing(
                          lineWidth: 4,
                          color: ColorsApp.skyBlue,
                          size: 45,
                        ),
                      ),
                    ],
                  ))
                ])));
  }
}
