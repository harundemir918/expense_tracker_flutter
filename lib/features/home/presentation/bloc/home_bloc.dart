import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:expense_tracker/core/usecase/usecase.dart';
import 'package:expense_tracker/features/home/data/models/transaction_model.dart';
import 'package:expense_tracker/features/home/domain/usecases/home_add_transaction.dart';
import 'package:expense_tracker/features/home/domain/usecases/home_fetch_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeFetchTransactions _homeFetchTransactions;
  final HomeAddTransaction _homeAddTransaction;

  HomeBloc({
    required HomeFetchTransactions homeFetchTransactions,
    required HomeAddTransaction homeAddTransaction,
  })  : _homeFetchTransactions = homeFetchTransactions,
        _homeAddTransaction = homeAddTransaction,
        super(HomeInitial()) {
    on<HomeEvent>((event, emit) => emit(HomeLoading()));
    on<HomeFetchTransactionsEvent>(_onHomeFetchTransactions);
    on<HomeAddTransactionEvent>(_onHomeAddTransaction);
  }

  void _onHomeFetchTransactions(
      HomeFetchTransactionsEvent event, Emitter<HomeState> emit) async {
    final result = await _homeFetchTransactions(NoParams());

    result.fold(
      (failure) => emit(HomeFailure(failure.message)),
      (transactionsStream) async {
        await emit.forEach<List<Transaction>>(
          transactionsStream,
          onData: (transactions) => HomeSuccess(transactions: transactions),
          onError: (error, stackTrace) =>
              HomeFailure('Error fetching transactions: $error'),
        );
      },
    );
  }

  void _onHomeAddTransaction(
      HomeAddTransactionEvent event, Emitter<HomeState> emit) async {
    final result = await _homeAddTransaction(
        HomeAddTransactionParams(transaction: event.transaction));

    result.fold(
      (failure) => emit(
        HomeAddTransactionFailure(failure.message),
      ),
      (_) => emit(
        HomeAddTransactionSuccess(),
      ),
    );
  }
}
