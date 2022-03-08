import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BaseProvider extends GetConnect {
  final storage = new FlutterSecureStorage();

  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2:3000/';

    httpClient.addAuthenticator<void>((request) async {
      String? token = await storage.read(key: 'token');
      print("this is the token $token");
      if (token != null) {
        request.headers['Authorization'] = "Bearer $token";
      }
      return request;
    });

    // httpClient.addRequestModifier<void>((request) {
    //   // request.headers['apikey'] = '12345678';
    //   return request;
    // });

    // httpClient.addResponseModifier((request, response) {});

    httpClient.maxAuthRetries = 3;
  }
}
