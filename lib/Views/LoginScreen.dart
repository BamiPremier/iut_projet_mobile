import 'package:iut/components/Button/app_button.dart';
import 'package:iut/components/Widget/app_input.dart';
import 'package:iut/components/Widget/app_title_right.dart';
import 'package:iut/controller/MyController.dart';
import 'package:iut/styles/colorApp.dart';
import 'package:iut/styles/textStyle.dart';
import 'package:iut/utils/Services/validators.dart';
import 'package:iut/utils/constants/assets.dart';
import 'package:flutter/material.dart';

import 'package:iut/utils/Services/routing.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        Container(
            margin: EdgeInsets.only(top: Get.height * .020),
            padding: EdgeInsets.only(
                left: Get.width * .030, right: Get.width * .030),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: AppTitleRight(
                      title: 'Login',
                      description: 'Welcome dear',
                    ),
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .005),
                  ),
                ])),
      ]),
      body: GetBuilder<MyController>(
        builder: (_manager) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: kMarginX),
            child: Form(
              key: _manager.formKeyLog,
              child: Column(children: [
                new Hero(
                  tag: "login screen",
                  child: new Container(
                      child: Image.asset(Assets.logImg, height: kHeight / 3.5)),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: Get.size.height * .02,
                  ),
                  child: Text(
                    " ".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Text(
                //   "Your Welcome.",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                Container(
                    margin: EdgeInsets.only(
                        top: Get.size.height * .02,
                        bottom: Get.size.height * .025),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    // padding: EdgeInsets.only(
                    //   top: 25,
                    // ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: kMarginY,
                          ),
                          child: AppInput(
                            controller: _manager.phoneLog,
                            onChanged: (value) {},
                            label: 'Phone'.tr,
                            validator: (value) {
                              return Validators.usPhoneValid(value!);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: kMarginY * 2,
                          ),
                          child: AppInputPassword(
                            controller: _manager.passwordLog,
                            label: 'mot de passe'.tr,
                            obscureText: true,
                            validator: (value) {
                              //print(value);
                              return Validators.required(
                                  'Mot de passe', value!);
                            },
                          ),
                        ),
                        AppButton(
                            size: MainAxisSize.max,
                            bgColor: ColorsApp.black,
                            load: _manager.isConnected,
                            text: 'Se connecter'.tr,
                            onTap: () async {
                              //print('dddddss');
                              //print(_manager.formKeyLog.currentState);
                              // Get.toNamed(AppLinks.FIRST);
                              if (_manager.formKeyLog.currentState!
                                  .validate()) {
                                //print('dddddss');

                                await _manager.loginUser();
                                if (_manager.isConnected) {
                                  // MyBinding().onGetDataNew();
                                }
                              }
                            }),
                        Container(
                          margin: EdgeInsets.only(bottom: kMarginY),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(AppLinks.REGISTER);
                                },
                                child: Text('S\'inscrire'.tr,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: ColorsApp.black,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
