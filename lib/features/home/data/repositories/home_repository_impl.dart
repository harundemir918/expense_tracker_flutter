import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:expense_tracker/core/error/failures.dart';
import 'package:expense_tracker/features/home/data/datasources/home_remote_data_source.dart';
import 'package:expense_tracker/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, List<Transaction>>> fetchTransactions() async {
    try {
      final result = await homeRemoteDataSource.fetchTransactions();
      return right(result);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
