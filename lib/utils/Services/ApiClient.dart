import 'package:iut/controller/MyController.dart';
import 'package:iut/utils/api/apiUrl.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../functions/viewFunctions.dart';

class ApiClient extends GetConnect implements GetxService {
  String token = '';
  String appBaseUrl = ApiUrl.baseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient() {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 600);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
    };

    httpClient.addRequestModifier<dynamic>((request) {
   
      token.length != 0
          ? request.headers['Authorization'] = 'Bearer $token'
          : null;
      return request;
    });
    httpClient.addResponseModifier<dynamic>((request, response) async {
     

      if ((response.statusCode == '401' || response.statusCode == '403')) {
  
        _mainHeaders['Authorization'] = 'Bearer $token';

        request.headers.addAll(_mainHeaders);
        request.headers['Authorization'] = 'Bearer $token';

        return await _retry(request);
      } else {
        return response;
      }
    });
  }
  Future<Response<dynamic>> _retry(Request request) async {
    return this.request<dynamic>(
      request.url.path,
      request.method,
      body: request.bodyBytes,
      headers: request.headers,
    );
  }

  var fn = new ViewFunctions();

  Future<Response> getCollections(url) async {
    Response rep = await get(url);
    return rep;
  }

  Future<Response> getCollectionsP(url, data) async {
    Response rep = await post(url.toString(), data);
    return rep;
  }

  Future<Response> postData(url, data) async {
    // //print(this.httpClient.defaultContentType);
    //print(data);
    Response rep = await post(url.toString(), data);
    return rep;
  }
}
