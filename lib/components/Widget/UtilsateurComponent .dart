// ignore: must_be_immutable
import 'package:iut/controller/MyController.dart';
import 'package:iut/model/BatimentModel.dart';
import 'package:iut/model/ReservationModel.dart';
import 'package:iut/model/SalleModel.dart';
import 'package:iut/model/UserModel.dart';
import 'package:get/get.dart';
import 'package:iut/components/Button/button.dart';
import 'package:iut/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UtilsateurComponent extends StatelessWidget {
  UtilsateurComponent({required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: Get.height * .02, left: 10, right: 10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: ColorsApp.grey),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(user.nom),
                ),
                Container(
                  child: Text(user.phone),
                ),
                Container(
                  child: Text(user.typeUser.libelle),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
              child: InkWell(
                child: Text(user.typeUser.id == 3
                    ? 'Nommer delegue'
                    : user.typeUser.id == 2
                        ? "Retirer Delegue"
                        : ''),
                onTap: () => user.typeUser.id == 3
                    ? Get.find<MyController>().ajouterDelegue(user.id)
                    : user.typeUser.id == 2
                        ? Get.find<MyController>().retirerDelegue(user.id)
                        : null,
              ),
            )
          ],
        ));
  }
}
