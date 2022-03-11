import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/models/transaction.dart';
import 'package:frontend/providers/transaction_provider.dart';
import 'package:get/get.dart';

import '../../models/user.dart';
import '../../providers/user_provider.dart';

class WalletController extends GetxController
    with StateMixin<List<Transaction>> {
  final _transactionProvider = Get.put(TransactionProvider());
  final userController = Get.put(UserController());
  List<Transaction> transactions = <Transaction>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    change(transactions, status: RxStatus.loading());
    transactions = await _transactionProvider.fetchTransactions();
    if (transactions.isEmpty) {
      change(transactions, status: RxStatus.empty());
    } else {
      change(transactions, status: RxStatus.success());
    }
  }
}
