import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseProvider extends GetConnect {
  final storage = new FlutterSecureStorage();

  @override
  void onInit() {
    httpClient.baseUrl = dotenv.env['API_ENDPOINT'];

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
