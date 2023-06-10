// ignore: must_be_immutable
import 'package:Fahkap/Views/Geolocalisation.dart';
import 'package:Fahkap/controller/MyController.dart';
import 'package:Fahkap/model/data/BatimentModel.dart';
import 'package:Fahkap/model/data/SalleDefaultModel.dart';
import 'package:Fahkap/model/data/SalleModel.dart';
import 'package:Fahkap/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:Fahkap/components/Button/button.dart';
import 'package:Fahkap/components/Form/commentForm.dart';
import 'package:Fahkap/styles/colorApp.dart';
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
                        return CircleAvatar(
                            backgroundColor: ColorsApp.skyBlue,
                            radius: 50,
                            backgroundImage:
                                AssetImage("assets/images/error.gif"));
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
