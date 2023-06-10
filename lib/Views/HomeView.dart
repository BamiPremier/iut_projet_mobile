import 'package:Fahkap/components/Button/uploadImage.dart';
import 'package:Fahkap/components/Widget/HomeComponent.dart';
import 'package:Fahkap/components/Widget/app_input_new.dart';
import 'package:Fahkap/components/Widget/app_title_right.dart';
import 'package:Fahkap/controller/MyController.dart';
import 'package:Fahkap/utils/Services/validators.dart';
import 'package:Fahkap/utils/constants/assets.dart';
import 'package:Fahkap/components/Text/smallText.dart';
import 'package:Fahkap/components/Text/titleText.dart';
import 'package:Fahkap/styles/colorApp.dart';
import 'package:Fahkap/styles/textStyle.dart';
import 'package:Fahkap/utils/Services/routing.dart';
import 'package:Fahkap/utils/functions/viewFunctions.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../components/Button/app_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerField = TextEditingController();

    return GetBuilder<MyController>(builder: (_controller) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Container(
                    margin: EdgeInsets.only(top: Get.height * .020),
                    padding: EdgeInsets.only(
                        left: Get.width * .030, right: Get.width * .030),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: AppTitleRight(
                                title: 'Hi Boy!',
                                description: 'Welcome dear',
                                icon: Assets.home),
                            margin: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * .005),
                          ),
                        ])),
              ]),
          body: RefreshIndicator(
            color: ColorsApp.skyBlue,
            onRefresh: () async {},
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: kMarginX),
                child: SingleChildScrollView(
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Container(
                          height: kMdHeight * .15,
                          width: Get.width * .88,
                          decoration: BoxDecoration(
                              color: ColorsApp.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                              child: Image.asset(
                                "assets/default.jpg",
                                fit: BoxFit
                                    .cover, // Adjust the fit property to control how the image fills the available space
                              ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /*    HomeComponent(
                            title: 'réserver',
                            onTap: () => Get.bottomSheet(
                              Container(
                                  margin: EdgeInsets.only(
                                    top: kMarginY * 8,
                                  ),
                                  decoration: BoxDecoration(
                                      color: ColorsApp.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  height: 800,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kMarginX),
                                  child: Column(
                                    children: [
                                      // _controller.listImgProduits.length != 0
                                      //     ? smallText(
                                      //         text: 'Listes images',
                                      //       )
                                      //     : Container(),
                                      Container(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                child: Text('Annuler'),
                                                onPressed: () {
                                                  Get.back(closeOverlays: true);
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Enregistrer'),
                                                onPressed: () async {
                                                  // await _controller.addProduit();
                                                  // _controller.chageState(!_controller.addProduct);
                                                },
                                              )
                                            ]),
                                      ),
                                      Expanded(
                                          child: SingleChildScrollView(
                                              child: Column(
                                        children: [
                                          // Container(
                                          //   margin: EdgeInsets.only(
                                          //     top: kMarginY * 1.5,
                                          //   ),
                                          //   child: AppInputNew(
                                          //     controller: _controller.name,
                                          //     icon: Icon(Icons.label),
                                          //     label: 'lbnameprod',
                                          //     validator: (value) {
                                          //       return Validators.isValidUsername(value!);
                                          //     },
                                          //   ),
                                          // ),
                                          // Container(
                                          //   margin: EdgeInsets.only(
                                          //     top: kMarginY,
                                          //   ),
                                          //   child: AppInputNew(
                                          //     textInputType: TextInputType.number,
                                          //     controller: _controller.prix,
                                          //     icon: Icon(Icons.monetization_on),
                                          //     label: 'lbprixprod',
                                          //     validator: (value) {
                                          //       return Validators.usNumeriqValid(value!);
                                          //     },
                                          //   ),
                                          // ),
                                          // Container(
                                          //     padding: EdgeInsets.only(
                                          //       top: kMarginY,
                                          //     ),
                                          //     alignment: Alignment.centerLeft,
                                          //     child: Text('Stock')),
                                          // Container(
                                          //     margin: EdgeInsets.only(
                                          //       top: kMarginY,
                                          //     ),
                                          //     padding: EdgeInsets.symmetric(
                                          //         vertical: kMarginY,
                                          //         horizontal: kMarginX),
                                          //     decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.circular(5),
                                          //         color: ColorsApp.greySearch),
                                          //     child: Row(
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment
                                          //               .spaceBetween,
                                          //       children: [
                                          //         Text('Disponible'),
                                          //         Row(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment
                                          //                   .spaceBetween,
                                          //           children: [
                                          //             InkWell(
                                          //                 child: Icon(
                                          //                     Icons.remove),
                                          //                 onTap: () {
                                          //                   _controller
                                          //                       .mamageQte(
                                          //                           false);
                                          //                 }),
                                          //             Container(
                                          //               decoration: BoxDecoration(
                                          //                   borderRadius:
                                          //                       BorderRadius
                                          //                           .circular(
                                          //                               12),
                                          //                   color: ColorsApp
                                          //                       .greySecond),
                                          //               width: kMdWidth / 2,
                                          //               height: 35,
                                          //               alignment:
                                          //                   Alignment.center,
                                          //               child: AppInputNew(
                                          //                 controller:
                                          //                     _controller
                                          //                         .quantite,
                                          //                 label: '',
                                          //                 // border: true,
                                          //                 alignStart: false,
                                          //                 textInputType:
                                          //                     TextInputType
                                          //                         .number,
                                          //                 validator: (value) {
                                          //                   return Validators
                                          //                       .usNumeriqValid(
                                          //                           value!);
                                          //                 },
                                          //               ),
                                          //             ),
                                          //             InkWell(
                                          //                 child:
                                          //                     Icon(Icons.add),
                                          //                 onTap: () {
                                          //                   _controller
                                          //                       .mamageQte(
                                          //                           true);
                                          //                 })
                                          //           ],
                                          //         )
                                          //       ],
                                          //     )),

                                          Container(
                                              decoration: BoxDecoration(
                                                  color: ColorsApp.grey),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    // smallText(
                                                    //   text: _controller.Boutique.titre,
                                                    // ),
                                                    // CustomBtn(
                                                    //   color: ColorsApp.greenLight,
                                                    //   title: 'Ajouter Produit',
                                                    //   onTap: () async {
                                                    //     await _controller.addProduit();
                                                    //     // _controller.chageState(!_controller.addProduct);
                                                    //   },
                                                    // )
                                                  ])),
                                        ],
                                      )))
                                    ],
                                  )),
                              isScrollControlled: true,
                              // isDismissible: true,
                            ),
                          ),
                         */
                          HomeComponent(
                            title: 'liste des reservations',
                            onTap: () => Get.toNamed(AppLinks.LIST_RESERV),
                          ),
                          HomeComponent(
                            title: 'liste des salles',
                            onTap: () => Get.toNamed(AppLinks.LIST_SALLE),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeComponent(
                            title: 'Ajouter sale',
                            onTap: () => Get.bottomSheet(
                              Container(
                                  margin: EdgeInsets.only(
                                    top: kMarginY * 8,
                                  ),
                                  decoration: BoxDecoration(
                                      color: ColorsApp.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  height: 800,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kMarginX),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                child: Text('Annuler'),
                                                onPressed: () {
                                                  Get.back(closeOverlays: true);
                                                },
                                              ),
                                              GetBuilder<MyController>(
                                                  builder: (_Ncontroller) =>
                                                      TextButton(
                                                        child: _Ncontroller
                                                                    .isAddSalle ==
                                                                true
                                                            ? CircularProgressIndicator(
                                                                color: Colors
                                                                    .blueAccent,
                                                              )
                                                            : Text('Ajouter'),
                                                        onPressed: () async {
                                                          await _Ncontroller
                                                              .ajouterSalle();
                                                        },
                                                      ))
                                            ]),
                                      ),
                                      Expanded(
                                          child: SingleChildScrollView(
                                              child: Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: kMarginX,
                                                  vertical: kMarginY * 2),
                                              child: Text(
                                                "Assurez vous d'etre dans la salle concernee pour enregistrer sa position",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                ),
                                              )),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: kMarginY * 1.5,
                                            ),
                                            child: AppInputNew(
                                              controller: _controller.nomSalle,
                                              icon: Icon(Icons.label),
                                              label: 'nom de la salle',
                                              validator: (value) {
                                                return Validators
                                                    .isValidUsername(value!);
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: kMarginY * 1.5,
                                            ),
                                            child: AppInputNew(
                                              controller:
                                                  _controller.numeroSalle,
                                              icon: Icon(Icons.label),
                                              label: 'numero de la salle',
                                              validator: (value) {
                                                return Validators
                                                    .isValidUsername(value!);
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: kMarginY,
                                            ),
                                            child: AppInputNew(
                                              textInputType:
                                                  TextInputType.number,
                                              controller:
                                                  _controller.capaciteSalle,
                                              icon: Icon(Icons.label),
                                              label: 'capacite',
                                              validator: (value) {
                                                return Validators
                                                    .usNumeriqValid(value!);
                                              },
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                top: kMarginY,
                                              ),
                                              child: Text(
                                                "batiment",
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',

                                                  // fontSize: big ? kXlText / this.percent : kLgText / this.percent,
                                                ),
                                              )),
                                          _controller.isLoadedBatiment == 0
                                              ? CircularProgressIndicator(
                                                  color: Colors.blueAccent,
                                                )
                                              : Container(
                                                  width: Get.width,
                                                  // margin:
                                                  //     EdgeInsets.symmetric(vertical: 5),
                                                  padding: EdgeInsets.only(
                                                    left: Get.width * .08,
                                                    right: Get.width * .08,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: ColorsApp.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: ButtonTheme(
                                                      alignedDropdown: true,
                                                      child: DropdownButton(
                                                        // Initial Value
                                                        value: _controller
                                                            .batiment,
                                                        // Down Arrow Icon
                                                        icon: const Icon(Icons
                                                            .keyboard_arrow_down),

                                                        // Array list of items
                                                        items: _controller
                                                                .BatimentList
                                                            .map((item) {
                                                          return DropdownMenuItem(
                                                            value: item,
                                                            child: Text(item
                                                                .nomBatiment),
                                                          );
                                                        }).toList(),
                                                        // After selecting the desired option,it will
                                                        // change button value to selected value
                                                        onChanged: (newValue) {
                                                          _controller
                                                              .setBatiment(
                                                                  newValue);
                                                          // setState(() {
                                                          //   dropdownvalue = newValue!;
                                                          // });
                                                        },
                                                      ))),
                                          GetBuilder<MyController>(
                                              builder:
                                                  (_Ncontroller) => _Ncontroller
                                                          .isImage
                                                      ? Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top:
                                                                      kMarginY *
                                                                          1.5,
                                                                  right: 5),
                                                          height:
                                                              kMdHeight * .3,
                                                          width: Get.width,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0), // Adjust the radius as needed
                                                            child: Image.file(
                                                              _controller
                                                                  .batimentImage,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ))
                                                      : Container()),
                                          Container(
                                              margin: EdgeInsets.only(
                                                top: kMarginY * 1.5,
                                              ),
                                              // decoration: BoxDecoration(color: ColorsApp.grey),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  UploadImage(
                                                    color: ColorsApp.skyBlue,
                                                    title: 'Appareil photo',
                                                    icon: Icons.camera_alt,
                                                    onTap: () {
                                                      _controller
                                                          .getImagebatimentCamera;
                                                    },
                                                  ),
                                                  UploadImage(
                                                    color: ColorsApp.skyBlue,
                                                    icon: Icons.photo,
                                                    title: 'Galerie',
                                                    onTap: () {
                                                      _controller
                                                          .getImagebatimentGallery();
                                                    },
                                                  )
                                                ],
                                              )),
                                        ],
                                      )))
                                    ],
                                  )),
                              isScrollControlled: true,
                              // isDismissible: true,
                            ),
                          ),
                          HomeComponent(
                            title: 'liste des utilisateurs',
                            onTap: () => Get.toNamed(AppLinks.LIST_UTILISATEUR),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeComponent(
                            title: 'Ajouter batiment',
                            onTap: () => Get.bottomSheet(
                              Container(
                                  margin: EdgeInsets.only(
                                    top: kMarginY * 8,
                                  ),
                                  decoration: BoxDecoration(
                                      color: ColorsApp.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  height: 800,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kMarginX),
                                  child: Column(
                                    children: [
                                      // _controller.listImgProduits.length != 0
                                      //     ? smallText(
                                      //         text: 'Listes images',
                                      //       )
                                      //     : Container(),
                                      Container(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                child: Text('Annuler'),
                                                onPressed: () {
                                                  Get.back(closeOverlays: true);
                                                },
                                              ),
                                              GetBuilder<MyController>(
                                                  builder: (_Ncontroller) =>
                                                      TextButton(
                                                        child: _Ncontroller
                                                                .isAddBatiment
                                                            ? Container(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                                height: 15,
                                                                width: 15,
                                                              )
                                                            : Text('Ajouter'),
                                                        onPressed: () async {
                                                          await _Ncontroller
                                                              .ajouterBatiment();
                                                        },
                                                      ))
                                            ]),
                                      ),
                                      Expanded(
                                          child: SingleChildScrollView(
                                              child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: kMarginY * 1.5,
                                            ),
                                            child: AppInputNew(
                                              controller:
                                                  _controller.nomBatiment,
                                              icon: Icon(Icons.label),
                                              label: 'Nom du batiment',
                                              validator: (value) {
                                                return Validators
                                                    .isValidUsername(value!);
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: kMarginY * 1.5,
                                            ),
                                            child: AppInputNew(
                                              controller: _controller
                                                  .descriptionBatiment,
                                              icon: Icon(Icons.label),
                                              label: 'Description du batiment',
                                              validator: (value) {
                                                return Validators
                                                    .isValidUsername(value!);
                                              },
                                            ),
                                          ),
                                          GetBuilder<MyController>(
                                              builder:
                                                  (_Ncontroller) => _Ncontroller
                                                          .isImage
                                                      ? Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top:
                                                                      kMarginY *
                                                                          1.5,
                                                                  right: 5),
                                                          height:
                                                              kMdHeight * .3,
                                                          width: Get.width,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0), // Adjust the radius as needed
                                                            child: Image.file(
                                                              _controller
                                                                  .batimentImage,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ))
                                                      : Container()),
                                          Container(
                                              margin: EdgeInsets.only(
                                                top: kMarginY * 1.5,
                                              ),
                                              // decoration: BoxDecoration(color: ColorsApp.grey),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  UploadImage(
                                                    color: ColorsApp.skyBlue,
                                                    title: 'Appareil photo',
                                                    icon: Icons.camera_alt,
                                                    onTap: () {
                                                      _controller
                                                          .getImagebatimentCamera;
                                                    },
                                                  ),
                                                  UploadImage(
                                                    color: ColorsApp.skyBlue,
                                                    icon: Icons.photo,
                                                    title: 'Galerie',
                                                    onTap: () {
                                                      _controller
                                                          .getImagebatimentGallery();
                                                    },
                                                  )
                                                ],
                                              )),
                                        ],
                                      )))
                                    ],
                                  )),
                              isScrollControlled: true,
                              // isDismissible: true,
                            ),
                          ),
                          HomeComponent(
                            title: 'liste des Batiments',
                            onTap: () => Get.toNamed(AppLinks.LIST_BATIMENT),
                          )
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HomeComponent(
                              title: 'Se deconnecter',
                              onTap: () => _controller.deconnecter(),
                            )
                          ])
                    ]))),
          ));
    });
  }
}
