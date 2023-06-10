import 'package:iut/components/Text/bigtitleText0.dart';
import 'package:iut/components/Widget/ReservationComponent.dart';
import 'package:iut/controller/MyController.dart';
import 'package:iut/styles/colorApp.dart';
import 'package:iut/styles/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ListReservation extends StatelessWidget {
  ListReservation({Key? key}) : super(key: key);
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorsApp.black,
            ),
            onTap: () {
              Get.back(closeOverlays: true);
            },
          ),
          title: BigtitleText0(text: 'Liste des Reservations', bolder: true),
        ),
        body: GetBuilder<MyController>(builder: (_controller) {
          return RefreshIndicator(
              color: ColorsApp.skyBlue,
              onRefresh: () async {
                await _controller.getListReservation();
              },
              child: _controller.isLoadedReservation == 0
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _controller.ReservationList.length,
                      itemBuilder: (_ctx, index) => ReservationComponent(
                            reservation: _controller.ReservationList[index],
                          ))

              // Builds 1000 ListTiles
              );
        }));
  }
}
