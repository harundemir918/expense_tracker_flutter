part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeFetchTransactionsEvent extends HomeEvent {}

class HomeAddTransactionEvent extends HomeEvent {
  final TransactionModel transaction;

  HomeAddTransactionEvent({required this.transaction});
}
