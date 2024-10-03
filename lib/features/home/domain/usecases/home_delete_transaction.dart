import 'package:expense_tracker/core/error/failures.dart';
import 'package:expense_tracker/core/usecase/usecase.dart';
import 'package:expense_tracker/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeDeleteTransaction
    implements UseCase<void, HomeDeleteTransactionParams> {
  final HomeRepository homeRepository;

  HomeDeleteTransaction(this.homeRepository);

  @override
  Future<Either<Failure, void>> call(HomeDeleteTransactionParams params) async {
    return await homeRepository.deleteTransaction(
      id: params.id,
    );
  }
}

class HomeDeleteTransactionParams {
  final String id;

  HomeDeleteTransactionParams({
    required this.id,
  });
}
