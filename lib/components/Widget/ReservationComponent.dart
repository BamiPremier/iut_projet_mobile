// ignore: must_be_immutable
import 'package:iut/Views/Geolocalisation.dart';
import 'package:iut/controller/MyController.dart';
import 'package:iut/model/BatimentModel.dart';
import 'package:iut/model/ReservationModel.dart';
import 'package:iut/model/SalleModel.dart';
import 'package:iut/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:iut/components/Button/button.dart';
import 'package:iut/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReservationComponent extends StatelessWidget {
  ReservationComponent({required this.reservation});
  final ReservationModel reservation;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            margin:
                EdgeInsets.only(bottom: Get.height * .02, left: 10, right: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: ColorsApp.grey),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(reservation.nomSalle),
                      ),
                      Container(
                        child: Text(reservation.capaciteSalle + ' places'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: InkWell(
                    child: Text('Carte'),
                    onTap: () => Get.to(() => Geolocalisation(
                        lat: double.parse(reservation.latitude),
                        long: double.parse(reservation.longitude))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellowAccent),
                  child: InkWell(
                    child: Text('Terminer'),
                    onTap: () => Get.find<MyController>()
                        .anullerreservationSalle(reservation.id),
                  ),
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
                      child: Text('Batiment : ' + reservation.batiment),
                    ),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('Niveau :' + reservation.niveauSalle),
                    ),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                          'motif de  la reservation : ' + reservation.motif),
                    ),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('debut ' + reservation.debut),
                    ),
                    Expanded(
                      child: Text('fin ' + reservation.fin),
                    )
                  ]),
              Container(
                  decoration: BoxDecoration(
                    color: ColorsApp.greySecond,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: EdgeInsets.only(
                    top: kMarginY * 2,
                  ),
                  child: CachedNetworkImage(
                    height: kMdHeight * .2,
                    width: Get.width * .8,
                    fit: BoxFit.cover,
                    imageUrl: reservation.src,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
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
