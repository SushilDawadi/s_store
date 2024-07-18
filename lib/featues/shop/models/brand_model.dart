class BrandModel {
  String id;
  String images;
  String isFeatured;
  int productCounts;

  BrandModel({
    required this.id,
    required this.images,
    required this.isFeatured,
    required this.productCounts,
  });

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    return BrandModel(
      id: data['Id'] ?? "",
      images: data['Images'] ?? "",
      isFeatured: data['IsFeatured'] ?? "",
      productCounts: data['ProductCounts'] ?? 0,
    );
  }
}
