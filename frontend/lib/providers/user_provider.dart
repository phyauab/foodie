import 'dart:convert';
import 'package:get/get.dart';
import 'package:frontend/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider extends GetConnect {
  User? user;
  var isLoggedIn = false.obs;

  Future<void> login(String username, String password) async {
    final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    if (response.statusCode == 200) {
      user = User.fromJson(jsonDecode(response.body));
      isLoggedIn.value = true;
    }
  }

  void logout() {
    print("logout");
    user = null;
    isLoggedIn.value = false;
    // return true;
  }

  void setUser(User user) {
    this.user = user;
  }
}
