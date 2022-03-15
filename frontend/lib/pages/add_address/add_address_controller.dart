import 'package:flutter/cupertino.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/pages/cart/cart_controller.dart';
import 'package:frontend/pages/wallet/wallet_controller.dart';
import 'package:frontend/providers/transaction_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  final _userProvider = Get.put(UserProvider());
  final nameController = TextEditingController();
  final roomController = TextEditingController();
  final floorController = TextEditingController();
  final buildingController = TextEditingController();
  final streetController = TextEditingController();
  final districtController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> addAddress() async {
    if (nameController.text == "") return false;
    if (roomController.text == "") return false;
    if (floorController.text == "") return false;
    if (buildingController.text == "") return false;
    if (streetController.text == "") return false;
    if (districtController.text == "") return false;

    return await _userProvider.addAddress(
        nameController.text,
        roomController.text,
        floorController.text,
        buildingController.text,
        streetController.text,
        districtController.text);
  }
}
