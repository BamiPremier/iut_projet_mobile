// ignore: must_be_immutable
import 'package:iut/Views/Geolocalisation.dart';
import 'package:iut/controller/MyController.dart';
import 'package:iut/model/BatimentModel.dart';
import 'package:iut/model/SalleModel.dart';
import 'package:iut/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:iut/components/Button/button.dart';
import 'package:iut/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SalleComponent2 extends StatelessWidget {
  SalleComponent2({required this.salle});
  final SalleModel salle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            margin:
                EdgeInsets.only(bottom: Get.height * .02, left: 10, right: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsApp.greySecond),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(salle.nomSalle),
                      ),
                      Container(
                        child: Text(salle.capaciteSalle + ' places'),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: InkWell(
                    child: Text('Carte'),
                    onTap: () => Get.to(() => Geolocalisation(
                        lat: double.parse(salle.latitude),
                        long: double.parse(salle.longitude))),
                  ),
                ),
              ],
            )),
        onTap: () => Get.bottomSheet(Container(
            margin: EdgeInsets.only(
              top: kMarginY * 8,
            ),
            decoration: BoxDecoration(
                color: ColorsApp.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            height: 800,
            padding: EdgeInsets.symmetric(horizontal: kMarginX, vertical: 10),
            child: Column(children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('Batiment : ' + salle.batiment),
                    ),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('Niveau :' + salle.niveauSalle),
                    ),
                  ]),
              Container(
                  margin: EdgeInsets.only(
                    top: kMarginY * 2,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsApp.greySecond,
                    // borderRadius: BorderRadius.circular(8),
                  ),
                  child: CachedNetworkImage(
                    height: kMdHeight * .2,
                    width: Get.width * .8,
                    fit: BoxFit.cover,
                    imageUrl: salle.src,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
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
                          height: kMdHeight * .2,
                          width: Get.width * .8,
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
                  ))
            ]))));
  }
}
