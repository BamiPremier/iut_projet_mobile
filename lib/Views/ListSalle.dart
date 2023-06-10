import 'package:Fahkap/components/Button/IconButtonF.dart';
import 'package:Fahkap/components/Button/btnCatList.dart';
import 'package:Fahkap/components/Button/btnCatListPV.dart';
import 'package:Fahkap/components/Button/button.dart';
import 'package:Fahkap/components/Form/formComponent2.dart';
import 'package:Fahkap/components/Text/bigText.dart';
import 'package:Fahkap/components/Text/bigtitleText0.dart';
import 'package:Fahkap/components/Widget/SalleComponent.dart';
import 'package:Fahkap/controller/MyController.dart';
import 'package:Fahkap/styles/colorApp.dart';
import 'package:Fahkap/styles/textStyle.dart';
import 'package:Fahkap/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ListSalle extends StatelessWidget {
  ListSalle({Key? key}) : super(key: key);
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
            title: BigtitleText0(
                text: 'Liste des Salles ',
                bolder: true),
          ),
          body: RefreshIndicator(
              color: ColorsApp.skyBlue,
              onRefresh: () async {},
              child: ListView.builder(
                    itemCount: _controller.SalleList.length,
                  itemBuilder: (_ctx, index) => SalleComponent(
                        salle: _controller.SalleList[index],
                      ))
              // Builds 1000 ListTiles
              ));
    });
  }
}
