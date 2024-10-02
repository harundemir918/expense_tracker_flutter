import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:expense_tracker/core/error/failures.dart';
import 'package:expense_tracker/core/usecase/usecase.dart';
import 'package:expense_tracker/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeFetchTransactions implements UseCase<List<Transaction>, NoParams> {
  final HomeRepository homeRepository;

  HomeFetchTransactions(this.homeRepository);

  @override
  Future<Either<Failure, List<Transaction>>> call(params) async {
    return await homeRepository.fetchTransactions();
  }
}
