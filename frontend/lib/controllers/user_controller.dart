import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class UserController extends GetxController {
  final _userProvider = Get.put(UserProvider());
  Rx<User?> user = Rxn<User>();
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMe();
  }

  Future<bool> login(String username, String password) async {
    user.value = await _userProvider.login(username, password);
    if (user.value != null) {
      isLoggedIn.value = true;
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _userProvider.logout();
    user.value = null;
    isLoggedIn.value = false;
  }

  Future<bool> register(String username, String password, String email) async {
    return await _userProvider.register(username, password, email);
  }

  Future<void> getMe() async {
    user.value = await _userProvider.getMe();
    if (user.value != null) {
      isLoggedIn.value = true;
    }
  }

  Future<bool> updateInfo(int id, String password, String newPassword) async {
    return _userProvider.updateUserInfo(id, password, newPassword);
  }
}
