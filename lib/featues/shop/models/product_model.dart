import 'package:s_store/featues/shop/models/brand_model.dart';
import 'package:s_store/featues/shop/models/product_attributes.dart';
import 'package:s_store/featues/shop/models/product_variations.dart';

class ProductModel {
  String id;
  int stock;
  String sku;
  double price;
  String title;
  String categoryId;
  String description;
  List<String> imageUrls;
  bool isFeatured;
  double salePrice;
  String productType;
  String thumbnail;
  BrandModel brand;
  List<ProductAttributesModel> productAttributes;
  List<ProductVariationsModel> productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    required this.sku,
    required this.price,
    required this.title,
    required this.categoryId,
    required this.description,
    required this.imageUrls,
    required this.isFeatured,
    required this.salePrice,
    required this.productType,
    required this.thumbnail,
    required this.productAttributes,
    required this.productVariations,
    required this.brand,
  });

  //from json
  factory ProductModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    return ProductModel(
      id: data['Id'] ?? "",
      stock: data['Stock'] ?? 0,
      sku: data['Sku'] ?? "",
      price: double.parse((data['Price'] ?? 0.0).toString()),
      title: data['Title'] ?? "",
      categoryId: data['CategoryId'] ?? "",
      description: data['Description'] ?? "",
      imageUrls:
          data['Images'] != null ? List<String>.from(data['Images']) : [],
      isFeatured: data['IsFeatured'] ?? false,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      productType: data['ProductType'] ?? "",
      thumbnail: data['Thumbnail'] ?? "",
      brand: BrandModel.fromJson(data['Brand']),
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributesModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationsModel.fromJson(e))
          .toList(),
    );
  }
}
