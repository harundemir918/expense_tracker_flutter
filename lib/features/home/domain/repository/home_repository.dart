import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:expense_tracker/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<Transaction>>> fetchTransactions();
}
