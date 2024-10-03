import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:expense_tracker/core/error/failures.dart';
import 'package:expense_tracker/features/home/data/models/transaction_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, Stream<List<Transaction>>>> fetchTransactions();

  Future<Either<Failure, void>> addTransaction({
    required TransactionModel transaction,
  });

  Future<Either<Failure, void>> deleteTransaction({required String id});
}
