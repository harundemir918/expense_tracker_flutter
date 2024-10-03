import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:expense_tracker/core/error/failures.dart';
import 'package:expense_tracker/features/home/data/datasources/home_remote_data_source.dart';
import 'package:expense_tracker/features/home/data/models/transaction_model.dart';
import 'package:expense_tracker/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, Stream<List<Transaction>>>> fetchTransactions() async {
    try {
      final result = homeRemoteDataSource.fetchTransactions();
      return right(result);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addTransaction({
    required TransactionModel transaction,
  }) async {
    try {
      final result = homeRemoteDataSource.addTransaction(
        transaction: transaction,
      );
      return right(result);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
