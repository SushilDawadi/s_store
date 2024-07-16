import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final bool isFeatured;
  final String parentId;

  CategoryModel({
    this.parentId = '',
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
  });

  //empty helper function
  factory CategoryModel.empty() {
    return CategoryModel(
      id: '',
      image: '',
      name: '',
      isFeatured: false,
    );
  }

  //from json helper function
  factory CategoryModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return CategoryModel(
        id: document.id,
        parentId: data!['ParentId'] ?? '',
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
  //to json helper function
  Map<String, dynamic> toJson() {
    return {
      'ParentId': parentId,
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
    };
  }
}
