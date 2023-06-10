import 'package:iut/components/Text/bigtitleText0.dart';
import 'package:iut/components/Widget/BatimentComponent.dart';
import 'package:iut/controller/MyController.dart';
import 'package:iut/styles/colorApp.dart';
import 'package:iut/styles/textStyle.dart';
import 'package:iut/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart';

class ListBatiment extends StatelessWidget {
  ListBatiment({Key? key}) : super(key: key);
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
          title: BigtitleText0(text: 'Liste des Batiments', bolder: true),
        ),
        body: GetBuilder<MyController>(builder: (_controller) {
          return RefreshIndicator(
              color: ColorsApp.skyBlue,
              onRefresh: () async {
                await _controller.getListBatiment();
              },
              child: _controller.isLoadedBatiment == 0
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _controller.BatimentList.length,
                      itemBuilder: (_ctx, index) => BatimentComponent(
                            batiment: _controller.BatimentList[index],
                          ))
              // Builds 1000 ListTiles
              );
        }));
  }
}
