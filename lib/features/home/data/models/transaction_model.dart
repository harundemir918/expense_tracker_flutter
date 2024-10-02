import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/core/entities/transaction.dart' as tr;

class TransactionModel extends tr.Transaction {
  TransactionModel({
    required super.amount,
    required super.type,
    required super.category,
    required super.date,
    required super.title,
    required super.description,
    required super.createdAt,
    required super.updatedAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> map) {
    return TransactionModel(
      amount: double.parse(map['amount'] ?? 0.0),
      type: map['type'] ?? '',
      category: map['category'] ?? '',
      date: (map['date'] as Timestamp).toDate(),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      createdAt: (map['created_at'] as Timestamp).toDate(),
      updatedAt: (map['updated_at'] as Timestamp).toDate(),
    );
  }

  TransactionModel copyWith({
    double? amount,
    String? type,
    String? category,
    DateTime? date,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TransactionModel(
      amount: amount ?? this.amount,
      type: type ?? this.type,
      category: category ?? this.category,
      date: date ?? this.date,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
