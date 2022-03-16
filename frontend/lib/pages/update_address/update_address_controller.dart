import 'package:flutter/cupertino.dart';
import 'package:frontend/models/address.dart';
import 'package:frontend/pages/address/address_controller.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

class UpdateAddressController extends GetxController {
  final _userProvider = Get.put(UserProvider());
  final _addressController = Get.put(AddressController());
  Rx<Address?> address = Rxn<Address>();
  final nameController = TextEditingController();
  final roomController = TextEditingController();
  final floorController = TextEditingController();
  final buildingController = TextEditingController();
  final streetController = TextEditingController();
  final districtController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAddress();
  }

  Future<bool> fetchAddress() async {
    if (Get.parameters["id"] == null) {
      Get.back();
      return false;
    }

    int id = int.parse(Get.parameters["id"] ?? "0");
    address.value = await _userProvider.fetchAddress(id);
    nameController.text = address.value!.name;
    roomController.text = address.value!.room;
    floorController.text = address.value!.floor;
    buildingController.text = address.value!.building;
    streetController.text = address.value!.street;
    districtController.text = address.value!.district;
    return true;
  }

  Future<bool> updateAddress() async {
    if (nameController.text == "") return false;
    if (roomController.text == "") return false;
    if (floorController.text == "") return false;
    if (buildingController.text == "") return false;
    if (streetController.text == "") return false;
    if (districtController.text == "") return false;

    bool isSuccess = await _userProvider.updateAddress(
        address.value!.id,
        nameController.text,
        roomController.text,
        floorController.text,
        buildingController.text,
        streetController.text,
        districtController.text);

    if (isSuccess) {
      _addressController.fetchAddresses();
      return true;
    }
    return false;
  }
}
