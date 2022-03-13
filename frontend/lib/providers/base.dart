import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BaseProvider extends GetConnect {
  final storage = new FlutterSecureStorage();

  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2:3000/';

    httpClient.addAuthenticator<void>((request) async {
      String? token = await storage.read(key: 'token');
      print("My Token: $token");
      if (token != null) {
        request.headers['Authorization'] = "Bearer $token";
      }
      return request;
    });

    httpClient.maxAuthRetries = 3;
  }

  void removeToken() async {
    await storage.delete(key: "token");
  }
}
