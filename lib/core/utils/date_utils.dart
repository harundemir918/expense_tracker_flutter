import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:intl/intl.dart';

Map<String, List<Transaction>> groupTransactionsByDate(
    List<Transaction> transactions) {
  Map<String, List<Transaction>> groupedTransactions = {};

  final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');

  for (var transaction in transactions) {
    String formattedDate = dateFormatter.format(transaction.date);

    if (!groupedTransactions.containsKey(formattedDate)) {
      groupedTransactions[formattedDate] = [];
    }

    groupedTransactions[formattedDate]!.add(transaction);
  }

  return groupedTransactions;
}

String formatDateForDisplay(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final difference =
      today.difference(DateTime(date.year, date.month, date.day)).inDays;

  switch (difference) {
    case 0:
      return 'Today';
    case 1:
      return 'Yesterday';
    default:
      return DateFormat('yyyy-MM-dd').format(date);
  }
}
