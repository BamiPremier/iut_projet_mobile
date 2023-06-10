import 'package:iut/components/Button/app_button.dart';
import 'package:iut/components/Widget/app_back_button.dart';
import 'package:iut/components/Widget/app_input.dart';
import 'package:iut/components/Widget/app_title_right.dart';
import 'package:iut/controller/MyController.dart';
import 'package:iut/styles/colorApp.dart';
import 'package:iut/styles/textStyle.dart';
import 'package:iut/utils/Services/validators.dart';
import 'package:iut/utils/constants/assets.dart';
import 'package:iut/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';

import 'package:iut/utils/Services/routing.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
        builder: (_manager) => Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: AppBackButton(),
                actions: [
                  Container(
                      margin: EdgeInsets.only(top: Get.height * .020),
                      padding: EdgeInsets.only(
                          left: Get.width * .030, right: Get.width * .030),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: AppTitleRight(
                                title: 'S\'inscrire',
                                description: 'Welcome dear',
                              ),
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * .005),
                            ),
                          ])),
                ]),
            body: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: kMarginX),
                    child: Column(children: [
                      Container(
                          child: Container(
                        margin: EdgeInsets.only(
                            top: Get.size.height * .02,
                            bottom: Get.size.height * .025),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // padding: EdgeInsets.only(
                        //   top: 25,
                        // ),
                        child: Form(
                            key: _manager.formKeyReg,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: kMarginY * 3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('S\'inscrire',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: kMarginY,
                                  ),
                                  child: AppInput(
                                    controller: _manager.name,
                                    label: 'nom',
                                    validator: (value) {
                                      return Validators.isValidUsername(value!);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: kMarginY,
                                  ),
                                  child: AppInput(
                                    controller: _manager.surname,
                                    label: 'prenom',
                                    validator: (value) {
                                      return Validators.isValidUsername(value!);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: kMarginY,
                                  ),
                                  child: AppInput(
                                    controller: _manager.email,
                                    label: 'email',
                                    validator: (value) {
                                      return Validators.isValidEmail(value);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: kMarginY,
                                  ),
                                  child: AppInput(
                                    controller: _manager.phone,
                                    label: 'phone',
                                    validator: (value) {
                                      return Validators.usPhoneValid(value!);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: kMarginY,
                                  ),
                                  child: AppInputPassword(
                                    controller: _manager.pass,
                                    label: 'password',
                                    obscureText: true,
                                    validator: (value) {
                                      return Validators.isValidPassword(value!);
                                    },
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.symmetric(
                                //     vertical: kMarginY,
                                //   ),
                                //   child: AppInputPassword(
                                //     controller: _manager.repass,
                                //     label: 'repassword' ,
                                //     obscureText: true,
                                //     validator: (value) {
                                //       return Validators.isValidRePassword(
                                //           _manager.repass.text !=
                                //               _manager.pass.text);
                                //     },
                                //   ),
                                // ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: kMarginY,
                                    ),
                                    child: GetBuilder<MyController>(
                                        builder: (_manager) => AppButton(
                                            size: MainAxisSize.max,
                                            text: 'S\'inscrire',
                                            load: _manager.isSignUp,
                                            onTap: () async {
                                              if (_manager
                                                  .formKeyReg.currentState!
                                                  .validate()) {
                                                await _manager.signUp();
                                                if (_manager.isSignUp) {
                                                  // MyBinding().onGetDataNew();
                                                }
                                              }
                                            }))),
                              ],
                            )),
                      ))
                    ])))));
  }
}
