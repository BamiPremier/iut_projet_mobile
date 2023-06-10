import 'package:iut/components/Text/bigtitleText0.dart';
import 'package:iut/components/Widget/SalleComponent.dart';
import 'package:iut/components/Widget/SalleDefaultComponent.dart';
import 'package:iut/controller/MyController.dart';
import 'package:iut/styles/colorApp.dart';
import 'package:iut/styles/textStyle.dart';
import 'package:iut/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSalleDefault extends StatelessWidget {
  ListSalleDefault({Key? key}) : super(key: key);
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    //print(Get.parameters);
    // Get.find<CategoryBoutiqueController>().getListBoutiques();

    return GetBuilder<MyController>(builder: (_controller) {
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
            title: BigtitleText0(text: 'Liste des Salles ', bolder: true),
          ),
          body: RefreshIndicator(
              color: ColorsApp.skyBlue,
              onRefresh: () async {
                await _controller.getListSalleDefault();
              },
              child: _controller.isLoadedSalleD == 0
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _controller.SalleList.length,
                      itemBuilder: (_ctx, index) => SalleDefaultComponent(
                            salle: _controller.SalleDList[index],
                          ))
              // Builds 1000 ListTiles
              ));
    });
  }
}
