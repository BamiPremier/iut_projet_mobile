import 'dart:async';
import 'dart:io';

import 'package:iut/model/BatimentModel.dart';
import 'package:iut/model/ReservationModel.dart';
import 'package:iut/model/SalleDefaultModel.dart';
import 'package:iut/model/SalleModel.dart';
import 'package:iut/model/UserModel.dart';
import 'package:iut/repository/MyRepo.dart';
import 'package:iut/utils/Services/core.dart';
import 'package:iut/utils/Services/routing.dart';
import 'package:iut/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:geolocator/geolocator.dart';

class MyController extends GetxController {
  final MyRepo myRepo;
  MyController({required this.myRepo});
  var box = new GetStorage();
  var fn = ViewFunctions();
  TextEditingController _phoneLog = TextEditingController();
  get phoneLog => _phoneLog;
  TextEditingController _passwordLog = TextEditingController();
  get passwordLog => _passwordLog;

  final _formKeyLog = GlobalKey<FormState>();
  get formKeyLog => _formKeyLog;
  bool _isConnected = false;
  bool get isConnected => _isConnected;
  loginUser() async {
    var data = {
      'phone': phoneLog.text,
      'password': passwordLog.text,
    };
    fn.loading('Connexion', 'Connexion a votre compte en cours');
    _isConnected = true;
    update();
    try {
      Response response = await myRepo.Login(data);

      if (response.statusCode == 200) {
        _isConnected = false;
        update(); // fn.snackBar('Inscription', 'Creation reussit', true);
        box.write('token', response.body['token']);
        print(Jwt.parseJwt(response.body['token']));
        // box.write('token', Jwt.parseJwt(response.body['token']));
        box.write('id', Jwt.parseJwt(response.body['token'])['id']);
        box.write('nom', Jwt.parseJwt(response.body['token'])['nom']);
        box.write('prenom', Jwt.parseJwt(response.body['token'])['prenom']);
        box.write('phone', Jwt.parseJwt(response.body['token'])['phone']);
        box.write('email', Jwt.parseJwt(response.body['token'])['email']);
        box.write('typeUser', Jwt.parseJwt(response.body['token'])['typeUser']);
        readData();
        Get.offNamedUntil(AppLinks.HOME, (route) => false);
        await initApp();
        fn.closeSnack();
        update(); // await MyBinding().onGetAll();
      } else {
        _isConnected = false;
        update();
        fn.snackBar('Connexion', 'Identifiants incorrects', false);
      }
      _isConnected = false;
      update();
      // fn.snackBar('Mise a jour', response.['token'])['message'], true);
      // _isConnected = true;
      // // Get.back(closeOverlays: true);
      // update();
    } catch (e) {
      fn.closeSnack();

      fn.snackBar('Connexion', 'Une erreur est survenue', false);
      //        fn.closeSnack();

      _isConnected = false;
      update();
      //print(e);
    }
  }

  var _id = 0;
  get id => _id;
  var _nom = '';
  get nom => _nom;
  var _prenom = '';
  get prenom => _prenom;
  var _phones = '';
  get phones => _phones;
  var _emails = '';
  get emails => _emails;
  var _typeUser = '';
  get typeUser => _typeUser;
  readData() {
    if (box.read('token') != null) {
      _id = Jwt.parseJwt(box.read('token'))['id'];
      _nom = Jwt.parseJwt(box.read('token'))['nom'];
      _prenom = Jwt.parseJwt(box.read('token'))['prenom'];
      _phones = Jwt.parseJwt(box.read('token'))['phone'];
      _emails = Jwt.parseJwt(box.read('token'))['email'];
      _typeUser = Jwt.parseJwt(box.read('token'))['typeUser'].toString();

      update();
      print('------------------------------------type ${_typeUser}');
    }

    print('------------------------------------type ${_typeUser}');
  }

  deconnecter() async {
    box.erase();
    box.erase();
    Get.offNamedUntil(AppLinks.LOGIN, (route) => false);
  }

  TextEditingController _name = TextEditingController();
  TextEditingController get name => _name;

  TextEditingController _surname = TextEditingController();
  TextEditingController get surname => _surname;

  TextEditingController _phone = TextEditingController();
  TextEditingController get phone => _phone;

  TextEditingController _pass = TextEditingController();
  TextEditingController get pass => _pass;

  TextEditingController repass = TextEditingController();
  TextEditingController get _repass => _repass;

  TextEditingController _email = TextEditingController();
  TextEditingController get email => _email;
  final _formKeyReg = GlobalKey<FormState>();
  get formKeyReg => _formKeyReg;
  bool _isSignUp = false;
  bool get isSignUp => _isSignUp;
  signUp() async {
    // Get.back(closeOverlays: true);

    if (pass.text.length < 5) {
      fn.snackBar('Mot de passse', '5 caractes minimum', false);
      return false;
    }
    if (pass.text.length == 0 ||
        name.text.length == 0 ||
        surname.text.length == 0 ||
        email.text.length == 0) {
      fn.snackBar('Compte', 'Veuillez remplir tous les champs', false);
      _isSignUp = false;
      update();
    }

    var data = {
      'phone': phone.text.toString(),
      'password': pass.text,
      "nom": name.text,
      "prenom": surname.text,
      "email": email.text,
      "status": true,
    };
    _isSignUp = true;
    update();
    //print(data);
    fn.loading('Inscription', 'Creatoin de votre compte en cours');

    try {
      Response response = await myRepo.SignUp(data);

      fn.closeSnack();
      print(response.body);
//  this.saveKeyKen(response.body);
      phoneLog.text = phone.text;
      passwordLog.text = pass.text;
      update();
      await loginUser();

      _isSignUp = false;
      // Get.back(closeOverlays: true);
      update();
    } catch (e) {
      fn.closeSnack();

      fn.snackBar('Inscription', 'Une erreur est survenue', false);
      //        fn.closeSnack();

      _isSignUp = false;
      update();
      //print(e);
    }
  }

  List<UserModel> _UserList = [];
  List<UserModel> _UserListSave = [];
  List<UserModel> get UserList => _UserList;
  int _isLoadedUser = 0;
  int get isLoadedUser => _isLoadedUser;
  getListUser() async {
    _isLoadedUser = 0;
    update();
    //print('getCOmeee---------');
    try {
      Response response = await myRepo.getListUser();
      _UserList = [];
      update();
      if (response.body != null && response.statusCode == 200) {
        if (response.body['data'] != null) {
          if (response.body['data'].length != 0) {
            _UserList.addAll((response.body['data'] as List)
                .map((e) => UserModel.fromJson(e))
                .toList());
            _UserListSave = _UserList;
          }
          _isLoadedUser = 1;
          update();
        }
      }
    } catch (e) {
      //print(e);
    }
  }

  List<ReservationModel> _ReservationList = [];
  List<ReservationModel> get ReservationList => _ReservationList;
  int _isLoadedReservation = 0;
  int get isLoadedReservation => _isLoadedReservation;
  getListReservation() async {
    _ReservationList = [];

    _isLoadedReservation = 0;
    update();
    //print('getCOmeee---------');
    try {
      Response response = await myRepo.getListReservation();
      _ReservationList.clear();
      if (response.body != null) {
        if (response.body['data'].length != 0) {
          _ReservationList.addAll((response.body['data'] as List)
              .map((e) => ReservationModel.fromJson(e))
              .toList());
        }
        _isLoadedReservation = 1;
        update();
      }
    } catch (e) {
      //print(e);
    }
  }

  bool _isAddDelegue = false;
  bool get isAddDelegue => _isAddDelegue;

  ajouterDelegue(delegue) async {
    var data = {
      "idUser": box.read('id'),
      "idDelegue": delegue,
    };
    _isAddDelegue = true;
    // Get.back(closeOverlays: true);
    update();
    //print(data);
    fn.loading('Utilisateur', 'Nommer delegue en cours');

    try {
      Response response = await myRepo.ajouterdeleggue(data);
//       //print(response.body);
//  this.saveKeyKen(response.body);
      fn.closeSnack();
      if (response.statusCode == 200) {
        // await MyBinding().onGetAll();

        await getListUser();

        fn.snackBar('Utilisateur', 'Success', true);

        // Get.toNamed(AppLinks.LIST_Delegue); // Get.back(closeOverlays: true);
      }
      // fn.snackBar('Mise a jour', response.body['message'], true);
      _isAddDelegue = false;
      // Get.back(closeOverlays: true);
      update();
    } catch (e) {
      fn.closeSnack();

      fn.snackBar('Utilisateur', 'Une erreur est survenue', false);
      //        fn.closeSnack();

      _isAddDelegue = false;
      update();
      //print(e);
    }
  }

  retirerDelegue(delegue) async {
    var data = {
      "idUser": box.read('id'),
      "idDelegue": delegue,
    };
    _isAddDelegue = true;
    // Get.back(closeOverlays: true);
    update();
    //print(data);
    fn.loading('Utilisateur', "Retirer Delegue en cours");

    try {
      Response response = await myRepo.retirerdeleggue(data);
//       //print(response.body);
//  this.saveKeyKen(response.body);
      fn.closeSnack();
      if (response.statusCode == 200) {
        await getListUser();

        fn.closeSnack();
        fn.snackBar('Utilisateur', 'Success', true);

        // Get.toNamed(AppLinks.LIST_BATIMENT); // Get.back(closeOverlays: true);
      }
      // fn.snackBar('Mise a jour', response.body['message'], true);
      // _isAddDelegue = true;
      // Get.back(closeOverlays: true);
      update();
    } catch (e) {
      fn.closeSnack();

      fn.snackBar('Utilisateur', 'Une erreur est survenue', false);
      //        fn.closeSnack();

      _isAddDelegue = false;
      update();
      //print(e);
    }
  }

  File batimentImage = new File('');
  bool _isImage = false;
  bool get isImage => _isImage;
  Future getImagebatimentCamera() async {
    try {
      //print("wwwwwwwww");

      var image = await ImagePicker.pickImage(
          source: ImageSource.camera,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500);

      // File? croppedFile = await ImageCropper().cropImage(
      //   aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      //   sourcePath: image.path,
      // );
      batimentImage = (File(image.path));
      _isImage = true;
      // //print(_listImgProduits.length);
      update();
    } catch (e) {
      // _showToastPictureError(context);
    }
  }

  Future getImagebatimentGallery() async {
    try {
      //print("wwwwwwwww");

      var image = await ImagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500);

      // File? croppedFile = await ImageCropper().cropImage(
      //   aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      //   sourcePath: image.path,
      // );
      batimentImage = (File(image.path));
      _isImage = true;
      // //print(_listImgProduits.length);
      update();
    } catch (e) {
      // _showToastPictureError(context);
    }
  }

  bool _isAddBatiment = false;
  bool get isAddBatiment => _isAddBatiment;

  ajouterBatiment() async {
    FormData data = new FormData({
      "file": await MultipartFile(
        batimentImage.path,
        filename: "Image.jpg",
      ),
      "nom": nomBatiment.text,
      "idUser": box.read('id'),
      "description": descriptionBatiment.text,
    });

    _isAddBatiment = true;
    // Get.back(closeOverlays: true);
    update();
    //print(data);
    fn.loading('Batiment', 'Ajout de la Batiment en cours');

    try {
      Response response = await myRepo.ajouterBatiment(data);
//       //print(response.body);
//  this.saveKeyKen(response.body);
      fn.closeSnack();
      if (response.statusCode == 200) {
        // await MyBinding().onGetAll();

        await getListBatiment();
        // Get.back();
        fn.closeSnack();
        fn.snackBar('Batiment', 'Success', true);

        _isAddBatiment = false;
        // Get.back(closeOverlays: true);
        update();
        // Get.toNamed(AppLinks.LIST_BATIMENT); // Get.back(closeOverlays: true);
      }
      // fn.snackBar('Mise a jour', response.body['message'], true);
      _isAddBatiment = false;
      // Get.back(closeOverlays: true);
      update();
    } catch (e) {
      fn.closeSnack();

      fn.snackBar('Salle', 'Une erreur est survenue', false);
      //        fn.closeSnack();

      _isAddBatiment = false;
      update();
      //print(e);
    }
  }

  List<BatimentModel> _BatimentList = [
    BatimentModel(
        id: 1,
        nomBatiment: '',
        descripitionBatiment: '',
        nombreSalle: 0,
        src: '')
  ];
  List<BatimentModel> get BatimentList => _BatimentList;
  int _isLoadedBatiment = 0;
  int get isLoadedBatiment => _isLoadedBatiment;
  getListBatiment() async {
    _BatimentList = [];

    _isLoadedBatiment = 0;
    update();
    //print('getCOmeee---------');
    try {
      Response response = await myRepo.getListBatiment();
      _BatimentList.clear();
      if (response.body != null) {
        if (response.body['data'].length != 0) {
          _BatimentList.addAll((response.body['data'] as List)
              .map((e) => BatimentModel.fromJson(e))
              .toList());
          _batiment = _BatimentList[0];
          _isLoadedBatiment = 1;
          update();
        }
      }
    } catch (e) {
      //print(e);
    }
  }

  List<SalleModel> _SalleBatimentList = [];
  List<SalleModel> get SalleBatimentList => _SalleBatimentList;
  int _isLoadedBatimentSalle = 0;
  int get isLoadedBatimentSalle => _isLoadedBatimentSalle;
  getListSalleBatiment(idBatiment) async {
    _SalleBatimentList.clear();
    _isLoadedBatimentSalle = 0;
    update();
    //print('getCOmeee---------');
    try {
      Response response = await myRepo.getListSalleBatiment(idBatiment);
      _SalleBatimentList.clear();
      update();

      if (response.body != null) {
        if (response.body['data'].length != 0) {
          _SalleBatimentList.addAll((response.body['data'] as List)
              .map((e) => SalleModel.fromJson(e))
              .toList());

          _isLoadedBatimentSalle = 1;
          update();
        }
      }
    } catch (e) {
      //print(e);
    }
  }

  TextEditingController _nomSalle = TextEditingController();
  TextEditingController get nomSalle => _nomSalle;

  TextEditingController _numeroSalle = TextEditingController();
  TextEditingController get numeroSalle => _numeroSalle;

  TextEditingController _capaciteSalle = TextEditingController();
  TextEditingController get capaciteSalle => _capaciteSalle;

  BatimentModel _batiment = new BatimentModel(
      id: 1,
      nomBatiment: '',
      descripitionBatiment: '',
      nombreSalle: 0,
      src: '');
  BatimentModel get batiment => _batiment;
  setBatiment(batiments) {
    _batiment = batiments;
    update();
  }

  double _latitude = 0.0;
  get latitude => _latitude;
  double _longitude = 0.0;
  get longitude => _longitude;

  Future<void> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Vérifiez si les services de localisation sont activés
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Les services de localisation sont désactivés, affichez un message d'erreur ou demandez à l'utilisateur de les activer.
      return;
    }

    // Vérifiez si l'application a la permission d'accéder à la localisation de l'appareil
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // L'application n'a pas la permission d'accéder à la localisation, demandez la permission à l'utilisateur
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // L'utilisateur a refusé la permission, affichez un message d'erreur ou une alternative.
        return;
      }
    }

    // Récupérez la position actuelle de l'appareil
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _latitude = position.latitude;
    _longitude = position.longitude;
    update();
    // Utilisez les valeurs de latitude et de longitude selon vos besoins
    print('Latitude: $latitude');
    print('Longitude: $longitude');
  }

  bool _isAddSalle = false;
  bool get isAddSalle => _isAddSalle;
  ajouterSalle() async {
    FormData data = new FormData({
      "file": await MultipartFile(
        batimentImage.path,
        filename: "Image.jpg",
      ),
      'capacite': capaciteSalle.text,
      'password': pass.text,
      "nom": nomSalle.text,
      "numero": numeroSalle.text,
      "idBatiment": batiment.id,
      "latitude": latitude,
      "longitude": longitude
    });
    _isAddSalle = true;
    // Get.back(closeOverlays: false);
    update();
    //print(data);
    fn.loading('Salle', 'Ajout de la salle en cours');

    try {
      Response response = await myRepo.ajouterSalle(data);
//       //print(response.body);
//  this.saveKeyKen(response.body);
      if (response.statusCode == 200) {
        await getListSalle();
        Get.back();
        fn.closeSnack();
        _isAddSalle = false;
        // Get.back(closeOverlays: false);
        update();
        fn.snackBar('Salle', 'Ajout Reussi', true);
      }

      fn.closeSnack();

      // fn.snackBar('Mise a jour', response.body['message'], true);
      _isAddSalle = false;
      // Get.back(closeOverlays: false);
      update();
    } catch (e) {
      fn.closeSnack();

      fn.snackBar('Salle', 'Une erreur est survenue', false);
      //        fn.closeSnack();

      _isAddSalle = false;
      update();
      //print(e);
    }
  }

  List<SalleModel> _SalleList = [];
  List<SalleModel> get SalleList => _SalleList;
  int _isLoadedSalle = 0;
  int get isLoadedSalle => _isLoadedSalle;
  getListSalle() async {
    _isLoadedSalle = 0;
    update();

    try {
      Response response = await myRepo.getListSalle();

      _SalleList.clear();
      if (response.body != null) {
        if (response.body['data'] != null) {
          _SalleList.addAll((response.body['data'] as List)
              .map((e) => SalleModel.fromJson(e))
              .toList());
          _isLoadedSalle = 1;
          update();
        }
      }
    } catch (e) {
      //print(e);
    }
  }

  List<SalleDefaultModel> _SalleDList = [];
  List<SalleDefaultModel> get SalleDList => _SalleDList;
  int _isLoadedSalleD = 0;
  int get isLoadedSalleD => _isLoadedSalleD;
  getListSalleDefault() async {
    _isLoadedSalle = 0;
    update();

    try {
      Response response = await myRepo.getListSalleDefault();
      print('debut gelist sale');
      _SalleDList.clear();
      if (response.body != null) {
        if (response.body['data'] != null) {
          _SalleDList.addAll((response.body['data'] as List)
              .map((e) => SalleDefaultModel.fromJson(e))
              .toList());
          _isLoadedSalleD = 1;
          update();
        }
      }
    } catch (e) {
      //print(e);
      _isLoadedSalleD = 1;
      update();
    }
  }

  TextEditingController _nomBatiment = TextEditingController();
  TextEditingController get nomBatiment => _nomBatiment;

  TextEditingController _descriptionBatiment = TextEditingController();
  TextEditingController get descriptionBatiment => _descriptionBatiment;

  onInit() {
    super.onInit();
    readData();
    print('--------------------read darta ${id}');
    print('--------------------read darta ${box.read('token')}');
  }

  TextEditingController _salleId = TextEditingController();
  TextEditingController get salleId => _salleId;

  TextEditingController _idUser = TextEditingController();
  TextEditingController get idUser => _idUser;

  reserverSalle(salleId) async {
    var data = {
      'idSalle': salleId,
      'idUser': id,
    };
    //print(data);
    fn.loading('Reservation', 'Reservation de votre salle en cours');

    try {
      Response response = await myRepo.reserverSalle(data);
//       //print(response.body);
//  this.saveKeyKen(response.body);
      if (response.statusCode == 200) {
        await getListSalle();
        await getListReservation();
        fn.snackBar('Reservation', 'Succes', true);
      } else {
        fn.snackBar('Reservation', response.body['message'], false);
      }
      fn.closeSnack();

      // fn.snackBar('Mise a jour', response.body['message'], true);
      // _isSignUp = true;
      // Get.back(closeOverlays: true);
      update();
    } catch (e) {
      fn.closeSnack();

      fn.snackBar('Reservation', 'Une erreur est survenue', false);
      //        fn.closeSnack();

      // _isSignUp = false;
      update();
      //print(e);
    }
  }

  anullerreservationSalle(salle) async {
    var data = {
      'idSalle': salle,
      'idUser': id,
    };
    //print(data);
    fn.loading('Reservation', 'Annulation en cours');

    try {
      Response response = await myRepo.anullerreservationSalle(data);
      if (response.statusCode == 200) {
        await getListReservation();
        await getListSalle();
        fn.snackBar('Reservation', 'Succes', true);
      } else {
        fn.snackBar('Reservation', response.body['message'], false);
      }

      fn.closeSnack();

      // fn.snackBar('Mise a jour', response.body['message'], true);
      // _isSignUp = true;
      // Get.back(closeOverlays: true);
      update();
    } catch (e) {
      fn.closeSnack();

      fn.snackBar('Reservation', 'Une erreur est survenue', false);
      //        fn.closeSnack();

      // _isSignUp = false;
      update();
      //print(e);
    }
  }
}
