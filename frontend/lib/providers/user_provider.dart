import 'dart:convert';
import 'package:get/get.dart';
import 'package:frontend/models/user.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'base.dart';

class UserProvider extends BaseProvider {
  User? user;
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMe();
  }

  Future<bool> login(String username, String password) async {
    Map<String, String> body = {'username': username, "password": password};
    final response = await post("users/login", body);

    if (response.statusCode == 200) {
      user = User.fromJson(response.body);
      await storage.write(key: 'token', value: user?.token);
      isLoggedIn.value = true;
      return true;
    }

    return false;
  }

  Future<bool> register(String username, String password, String email) async {
    Map<String, String> body = {
      'username': username,
      "password": password,
      "email": email
    };
    final response = await post("users/register", body);
    return response.statusCode == 200;
  }

  Future<void> getMe() async {
    final response = await get("users/getMe");

    if (response.statusCode == 200) {
      String? token = await storage.read(key: 'token');
      response.body["token"] = token;
      user = User.fromJson(response.body);
      isLoggedIn.value = true;
      print("updated loggin: ${isLoggedIn}");
    }
  }

  void logout() {
    user = null;
    isLoggedIn.value = false;
    // return true;
  }

  void setUser(User user) {
    this.user = user;
  }
}
