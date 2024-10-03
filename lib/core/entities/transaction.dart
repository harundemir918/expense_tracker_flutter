class Transaction {
  String? id;
  final double amount;
  final String type;
  final String category;
  final DateTime date;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transaction({
    this.id,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });
}
