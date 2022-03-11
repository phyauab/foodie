class Transaction {
  Transaction(
      {required this.id,
      required this.type,
      required this.amount,
      required this.createdAt});

  final int id;
  final String type;
  final double amount;
  final DateTime createdAt;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      type: json['type'],
      amount: json['amount'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
