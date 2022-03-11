import 'package:frontend/models/transaction.dart';
import 'package:frontend/providers/base.dart';

class TransactionProvider extends BaseProvider {
  Future fetchTransactions() async {
    final response = await get('transactions');
    if (response.statusCode == 200) {
      return (response.body as List<dynamic>)
          .map((c) => Transaction.fromJson(c))
          .toList();
    }
  }

  Future<bool> addBalance(double amount) async {
    Map<String, dynamic> body = {"amount": amount};
    final response = await post('transactions/addBalance', body);
    return response.statusCode == 200;
  }
}
