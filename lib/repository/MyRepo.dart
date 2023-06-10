 
import 'package:Fahkap/utils/Services/ApiClient.dart';
import 'package:Fahkap/utils/Services/storageService.dart';
import 'package:Fahkap/utils/constants/apiRoute.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get_storage/get_storage.dart';

class MyRepo extends GetxService {
  final ApiClient apiClient;
  MyRepo({required this.apiClient});
  // String keySecret = new GetStorage().read('keySecret');

  Future getUser() async {}

  Future Login(data) async {
    Response a = await apiClient.getCollectionsP(ApiRoutes.LOGIN, data);

    return a;
  }

  Future SignUp(data) async {
    //print(data);
    Response a0 = await apiClient.getCollectionsP(ApiRoutes.SIGNUP, data);
    if (a0.statusCode == 201) {
      var logdata = {'phone': data['phone'], 'password': data['password']};
      //  //print(logdata);

      Response a = await this.Login(logdata);
      return a;
    } else {
      return a0;
    }
  }

  Future getListUser() async {
    Response a = await apiClient.getCollections(ApiRoutes.user);

    return a;
  }

  Future getListSalle() async {
    Response a = await apiClient.getCollections(ApiRoutes.sale);

    return a;
  }

  Future getListReservation() async {
    Response a = await apiClient.getCollections(ApiRoutes.reservation);

    return a;
  }

  Future getListBatiment() async {
    Response a = await apiClient.getCollections(ApiRoutes.batiment);

    return a;
  }

  Future getListSalleBatiment(idBatiment) async {
    Response a = await apiClient
        .getCollections(ApiRoutes.batiment + "/salle?idBatiment=$idBatiment");

    return a;
  }

  Future ajouterBatiment(data) async {
    Response a = await apiClient.getCollectionsP(ApiRoutes.batiment, data);

    return a;
  }

  Future ajouterSalle(data) async {
    Response a = await apiClient.getCollectionsP(ApiRoutes.sale, data);

    return a;
  }

  Future reserverSalle(data) async {
    Response a = await apiClient.getCollectionsP(ApiRoutes.reservation, data);

    return a;
  }

  Future anullerreservationSalle(data) async {
    Response a = await apiClient.getCollectionsP(
        ApiRoutes.reservation + '/finish', data);

    return a;
  }

  Future ajouterdeleggue(data) async {
    Response a = await apiClient.getCollectionsP(ApiRoutes.delegueset, data);

    return a;
  }

  Future retirerdeleggue(data) async {
    Response a = await apiClient.getCollectionsP(ApiRoutes.delegueunset, data);

    return a;
  }
}
