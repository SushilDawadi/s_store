import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:s_store/featues/shop/models/category_model.dart';
import 'package:s_store/utils/exception/firebase_auth_exception.dart';
import 'package:s_store/utils/exception/firebase_exception.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //variable
  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    try {
      final snapshot = await _db.collection("Category").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapShot(document))
          .toList();
      return list;
    } on FirebaseAuthException catch (e) {
      throw CFirebaseExceptions(e.code);
    } on FirebaseException catch (e) {
      throw CFirebaseExceptions(e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
