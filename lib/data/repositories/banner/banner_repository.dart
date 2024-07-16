import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:s_store/featues/shop/models/banner_model.dart';

class BannerRepository extends GetxController {
  static BannerRepository instance = Get.find();

  ///variable
  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> getBanners() async {
    try {
      final snapshot = await _db
          .collection("Banners")
          .where('active', isEqualTo: true)
          .get();
      final list = snapshot.docs
          .map((document) => BannerModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    } on FirebaseException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
