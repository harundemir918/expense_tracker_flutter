import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl(this.firebaseAuth);

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        return UserModel(
          id: user.uid,
          email: user.email!,
          name: user.displayName ?? '',
        );
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User is null.');
      }
      debugPrint(user.toString());
      return UserModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName ?? '',
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message!);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User is null.');
      }
      await user.updateDisplayName(name);
      await user.reload();
      user = FirebaseAuth.instance.currentUser;
      String uid = user!.uid;
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      if (!(await userDoc.get()).exists) {
        await userDoc.set({
          'name': name,
          'email': email,
          'created_at': FieldValue.serverTimestamp(),
        });
      }
      return UserModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName ?? '',
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message!);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
