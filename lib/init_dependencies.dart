import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:expense_tracker/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:expense_tracker/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:expense_tracker/features/auth/domain/repository/auth_repository.dart';
import 'package:expense_tracker/features/auth/domain/usecases/current_user.dart';
import 'package:expense_tracker/features/auth/domain/usecases/user_login.dart';
import 'package:expense_tracker/features/auth/domain/usecases/user_sign_up.dart';
import 'package:expense_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:expense_tracker/features/home/data/datasources/home_remote_data_source.dart';
import 'package:expense_tracker/features/home/data/repositories/home_repository_impl.dart';
import 'package:expense_tracker/features/home/domain/repository/home_repository.dart';
import 'package:expense_tracker/features/home/domain/usecases/home_add_transaction.dart';
import 'package:expense_tracker/features/home/domain/usecases/home_fetch_transactions.dart';
import 'package:expense_tracker/features/home/presentation/bloc/home_bloc.dart';
import 'package:expense_tracker/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initHome();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var firebaseAuth = FirebaseAuth.instance;
  var firebaseFirestore = FirebaseFirestore.instance;

  serviceLocator.registerLazySingleton(() => firebaseAuth);
  serviceLocator.registerLazySingleton(() => firebaseFirestore);

  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}

void _initHome() {
  serviceLocator
    ..registerFactory<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => HomeFetchTransactions(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => HomeAddTransaction(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => HomeBloc(
        homeFetchTransactions: serviceLocator(),
        homeAddTransaction: serviceLocator(),
      ),
    );
}
