part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Transaction> transactions;

  HomeSuccess({required this.transactions});
}

final class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);
}

final class HomeAddTransactionSuccess extends HomeState {}

final class HomeAddTransactionFailure extends HomeState {
  final String message;

  HomeAddTransactionFailure(this.message);
}

final class HomeDeleteTransactionSuccess extends HomeState {}

final class HomeDeleteTransactionFailure extends HomeState {
  final String message;

  HomeDeleteTransactionFailure(this.message);
}
