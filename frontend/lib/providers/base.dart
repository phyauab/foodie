import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2:3000/';

    // httpClient.addRequestModifier<void>((request) {
    //   // request.headers['apikey'] = '12345678';
    //   return request;
    // });

    // httpClient.addResponseModifier((request, response) {});

    httpClient.maxAuthRetries = 3;
  }
}
