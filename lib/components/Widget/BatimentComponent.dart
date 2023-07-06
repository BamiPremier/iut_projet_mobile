// ignore: must_be_immutable
import 'package:iut/Views/ListSalleBatiment.dart';
import 'package:iut/controller/MyController.dart';
import 'package:iut/model/BatimentModel.dart';
import 'package:iut/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:iut/components/Button/button.dart';
import 'package:iut/styles/colorApp.dart';
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
                  return Container(
                      height: kMdHeight * .15,
                      width: Get.width * .88,
                      decoration: BoxDecoration(
                          color: ColorsApp.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the radius as needed
                          child: Image.asset(
                            "assets/default.jpg",
                            fit: BoxFit.cover, //
                          )));
                },
              )))),
    );
  }
}
