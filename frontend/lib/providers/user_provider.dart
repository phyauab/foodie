import 'package:frontend/models/user.dart';

import 'base.dart';

class UserProvider extends BaseProvider {
  Future<User?> login(String username, String password) async {
    Map<String, String> body = {'username': username, "password": password};
    final response = await post("users/login", body);

    if (response.statusCode == 200) {
      User user = User.fromJson(response.body);
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

  void logout() {
    // TODO: remove token
  }
}
