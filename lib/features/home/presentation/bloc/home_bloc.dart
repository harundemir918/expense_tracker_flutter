import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:expense_tracker/core/usecase/usecase.dart';
import 'package:expense_tracker/features/home/domain/usecases/home_fetch_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeFetchTransactions _homeFetchTransactions;

  HomeBloc({required HomeFetchTransactions homeFetchTransactions})
      : _homeFetchTransactions = homeFetchTransactions,
        super(HomeInitial()) {
    on<HomeEvent>((event, emit) => emit(HomeLoading()));
    on<HomeFetchTransactionsEvent>(_onHomeFetchTransactions);
  }

  void _onHomeFetchTransactions(
      HomeFetchTransactionsEvent event, Emitter<HomeState> emit) async {
    final result = await _homeFetchTransactions(NoParams());

    result.fold(
      (failure) => emit(HomeFailure(failure.message)),
      (transactions) => emit(
        HomeSuccess(
          transactions: transactions,
        ),
      ),
    );
  }
}
