import 'package:frontend/models/address.dart';
import 'package:frontend/models/user.dart';

import 'base.dart';

class UserProvider extends BaseProvider {
  Future<User?> login(String username, String password) async {
    Map<String, String> body = {'username': username, "password": password};
    final response = await post("users/login", body);

    if (response.statusCode == 200) {
      User user = User.fromJson(response.body);
      storage.write(key: "token", value: user.token);
      return user;
    }
    return null;
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

  Future<User?> getMe() async {
    final response = await get("users/getMe");

    if (response.statusCode == 200) {
      String? token = await storage.read(key: 'token');
      response.body["token"] = token;
      return User.fromJson(response.body);
    }
    return null;
  }

  Future<bool> updateUserInfo(
      int id, String password, String newPassword) async {
    Map<String, dynamic> body = {
      "password": password,
      "newPassword": newPassword
    };
    final response = await patch("users/$id", body);
    return response.statusCode == 200;
  }

  Future<bool> addAddress(String name, String room, String floor,
      String building, String street, String district) async {
    Map<String, String> body = {
      "name": name,
      "room": room,
      "floor": floor,
      "building": building,
      "street": street,
      "district": district
    };

    final response = await post("users/addresses", body);
    return response.status.code == 200;
  }

  Future<List<Address>> fetchAddresses() async {
    final response = await get("users/addresses");
    if (response.status.code == 200) {
      return (response.body as List<dynamic>)
          .map((e) => Address.fromJson(e))
          .toList();
    }
    return [];
  }

  Future<Address?> fetchAddress(int id) async {
    final response = await get("users/addresses/${id}");
    if (response.status.code == 200) {
      return Address.fromJson(response.body);
    }
    return null;
  }

  void logout() {
    removeToken();
  }
}
