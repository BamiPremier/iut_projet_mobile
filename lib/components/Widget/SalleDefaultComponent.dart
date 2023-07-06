// ignore: must_be_immutable
import 'package:iut/Views/Geolocalisation.dart';
import 'package:iut/controller/MyController.dart';
import 'package:iut/model/BatimentModel.dart';
import 'package:iut/model/SalleDefaultModel.dart';
import 'package:iut/model/SalleModel.dart';
import 'package:iut/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:iut/components/Button/button.dart';
import 'package:iut/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SalleDefaultComponent extends StatelessWidget {
  SalleDefaultComponent({required this.salle});
  final SalleDefaultModel salle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => Geolocalisation(
          lat: double.parse(salle.latitude),
          long: double.parse(salle.longitude))),
      child: Container(
          margin: EdgeInsets.only(top: Get.height * .02, left: 3, right: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsApp.greySecond),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorsApp.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      height: kMdHeight * .10,
                      // width: Get.width * .3,
                      fit: BoxFit.cover,
                      imageUrl: salle.src,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(8),
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
                    )),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 3,
                          ),
                          child: Text(salle.nomSalle),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 3,
                          ),
                          //fdffd
                          child: Text(salle.capaciteSalle + ' places'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
