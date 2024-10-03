import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/features/home/data/models/transaction_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class HomeRemoteDataSource {
  Stream<List<TransactionModel>> fetchTransactions();

  void addTransaction({
    required TransactionModel transaction,
  });

  void deleteTransaction({required String id});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  HomeRemoteDataSourceImpl(this.firebaseFirestore);

  @override
  Stream<List<TransactionModel>> fetchTransactions() async* {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      String uid = user!.uid;
      yield* firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('transactions')
          .orderBy('date', descending: true)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return TransactionModel.fromJson(doc.data())..id = doc.id;
        }).toList();
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addTransaction({
    required TransactionModel transaction,
  }) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      String uid = user!.uid;
      var transactionRef = firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('transactions')
          .doc();

      await transactionRef.set(transaction.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> deleteTransaction({required String id}) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      String uid = user!.uid;
      await firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('transactions')
          .doc(id)
          .delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
