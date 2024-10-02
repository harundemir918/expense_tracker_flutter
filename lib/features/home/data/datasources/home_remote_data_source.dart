import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/features/home/data/models/transaction_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<TransactionModel>> fetchTransactions();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  HomeRemoteDataSourceImpl(this.firebaseFirestore);

  @override
  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      String uid = user!.uid;
      QuerySnapshot querySnapshot = await firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('transactions')
          .orderBy('date', descending: true)
          .get();
      List<TransactionModel> transactions = querySnapshot.docs.map((doc) {
        return TransactionModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      debugPrint(transactions.toString());
      return transactions;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
