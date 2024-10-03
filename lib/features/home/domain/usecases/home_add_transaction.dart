import 'package:expense_tracker/core/error/failures.dart';
import 'package:expense_tracker/core/usecase/usecase.dart';
import 'package:expense_tracker/features/home/data/models/transaction_model.dart';
import 'package:expense_tracker/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeAddTransaction implements UseCase<void, HomeAddTransactionParams> {
  final HomeRepository homeRepository;

  HomeAddTransaction(this.homeRepository);

  @override
  Future<Either<Failure, void>> call(HomeAddTransactionParams params) async {
    return await homeRepository.addTransaction(
      transaction: params.transaction,
    );
  }
}

class HomeAddTransactionParams {
  final TransactionModel transaction;

  HomeAddTransactionParams({
    required this.transaction,
  });
}
