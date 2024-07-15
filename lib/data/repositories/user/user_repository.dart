import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/data/repositories/authentication/authentication_repositories.dart';
import 'package:s_store/featues/personalization/models/user_model.dart';
import 'package:s_store/utils/exception/firebase_auth_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find<UserRepository>();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.please try again letter';
    }
  }

  //fetch data from firestore based on userId
  Future<UserModel> fetchUserRecord() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.user!.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapShot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw 'Something went wrong.please try again letter';
    }
  }

  Future<void> updateUserModel(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.please try again letter';
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.user!.uid)
          .update(json);
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.please try again letter';
    }
  }

  //to remove user record
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.please try again letter';
    }
  }
}
