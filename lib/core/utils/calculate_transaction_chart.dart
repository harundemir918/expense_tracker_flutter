import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:expense_tracker/core/utils/date_utils.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> calculateTransactionChart(List<Transaction> transactions) {
  // Group transactions by date
  Map<String, List<Transaction>> groupedTransactions =
      groupTransactionsByDate(transactions);

  // Initialize the map with the overall total and a list for data
  Map<String, dynamic> calculatedData = {
    'total': 0.0,
    'data': {},
  };

  double overallTotal = 0.0;

  // Iterate through the grouped transactions
  groupedTransactions.forEach((date, transactionsForDate) {
    // Sum the transaction amounts for the current date
    double total = transactionsForDate.fold(
      0.0,
      (sum, transaction) => transaction.type == 'income'
          ? sum + transaction.amount
          : sum - transaction.amount,
    );

    // Add the total for this date to the 'data' list as a map entry
    calculatedData['data'][date] = total;

    // Accumulate the overall total
    overallTotal += total;
  });

  // Store the overall total in the 'total' key
  calculatedData['total'] = overallTotal;

  // Print the result
  debugPrint(calculatedData.toString());
  return calculatedData;
}
