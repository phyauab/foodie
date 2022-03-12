import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/pages/cart/cart_controller.dart';
import 'package:frontend/pages/wallet/wallet_controller.dart';
import 'package:frontend/providers/transaction_provider.dart';
import 'package:get/get.dart';

class AddBalanceController extends GetxController {
  final _transactionProvider = Get.put(TransactionProvider());
  final _userController = Get.put(UserController());
  final _walletController = Get.put(WalletController());
  final _cartController = Get.put(CartController());
  var amount = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onKeyboardTap(String value) {
    if (amount.value.length > 4) return;
    amount.value += value;
  }

  void delete() {
    if (amount.value.isEmpty) return;
    amount.value = amount.substring(0, amount.value.length - 1);
  }

  void addBalance() async {
    bool isSuccess =
        await _transactionProvider.addBalance(double.parse(amount.value));
    if (isSuccess) {
      _userController.getMe();
      _walletController.fetchTransactions();
      _cartController.updateIsMakePaymentDisabled();
      Get.back();
    }
  }
}
