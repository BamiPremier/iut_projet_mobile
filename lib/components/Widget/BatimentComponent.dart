// ignore: must_be_immutable
import 'package:Fahkap/Views/ListSalleBatiment.dart';
import 'package:Fahkap/controller/MyController.dart';
import 'package:Fahkap/model/data/BatimentModel.dart';
import 'package:Fahkap/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:Fahkap/components/Button/button.dart';
import 'package:Fahkap/components/Form/commentForm.dart';
import 'package:Fahkap/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BatimentComponent extends StatelessWidget {
  BatimentComponent({required this.batiment});
  final BatimentModel batiment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin:
              EdgeInsets.only(bottom: Get.height * .02, left: 10, right: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: ColorsApp.grey),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Container(
                child: Text(batiment.nomBatiment),
              )),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Text('${batiment.nombreSalle} salles'),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsApp.greenLight),
                  padding: EdgeInsets.all(7),
                  child: Text('Voir plus'),
                ),
                onTap: () {
                  Get.find<MyController>().getListSalleBatiment(batiment.id);
                  Get.to(() => ListSalleBatiment(id: batiment.id));
                },
              )
            ],
          )),
      onTap: () => Get.bottomSheet(Container(
          margin: EdgeInsets.only(
            top: kMarginY * 8,
          ),
          decoration: BoxDecoration(
              color: ColorsApp.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          height: 800,
          child: Container(
              decoration: BoxDecoration(
                color: ColorsApp.greySecond,
                borderRadius: BorderRadius.circular(8),
              ),
              child: CachedNetworkImage(
                height: kMdHeight * .10,
                width: Get.width * .3,
                fit: BoxFit.cover,
                imageUrl: batiment.src,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          topLeft: Radius.circular(8)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        /* colorFilter: ColorFilter.mode(
                                        Colors.red, BlendMode.colorBurn) */
                      ),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return Container(
                    child: Center(
                        child: CircularProgressIndicator(
                      color: ColorsApp.skyBlue,
                    )),
                  );
                },
                errorWidget: (context, url, error) {
                  return CircleAvatar(
                      backgroundColor: ColorsApp.skyBlue,
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/error.gif"));
                },
              )))),
    );
  }
}
