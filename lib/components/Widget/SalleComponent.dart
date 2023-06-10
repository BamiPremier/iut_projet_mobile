// ignore: must_be_immutable
import 'package:Fahkap/Views/Geolocalisation.dart';
import 'package:Fahkap/controller/MyController.dart';
import 'package:Fahkap/model/data/BatimentModel.dart';
import 'package:Fahkap/model/data/SalleModel.dart';
import 'package:Fahkap/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:Fahkap/components/Button/button.dart';
import 'package:Fahkap/components/Form/commentForm.dart';
import 'package:Fahkap/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SalleComponent extends StatelessWidget {
  SalleComponent({required this.salle});
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
                  padding: EdgeInsets.all(10),
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
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow),
                  child: InkWell(
                    child: Text('Reserver'),
                    onTap: () =>
                        Get.find<MyController>().reserverSalle(salle.id),
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
            child: Container(
                decoration: BoxDecoration(
                  color: ColorsApp.greySecond,
                  // borderRadius: BorderRadius.circular(8),
                ),
                child: CachedNetworkImage(
                  height: kMdHeight * .10,
                  width: Get.width * .3,
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
                        backgroundImage: AssetImage("assets/images/error.gif"));
                  },
                )))));
  }
}
