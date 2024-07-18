class ProductVariationsModel {
  String id;
  double price;
  String description;
  double salePrice;
  String image;
  String stock;
  Map<String, String> attributes;

  ProductVariationsModel({
    required this.id,
    required this.price,
    required this.salePrice,
    required this.image,
    required this.stock,
    required this.attributes,
    required this.description,
  });

  factory ProductVariationsModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    return ProductVariationsModel(
      id: data['Id'] ?? "",
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      image: data['Image'] ?? "",
      stock: data['Stock'] ?? "",
      attributes: Map<String, String>.from(data['Attributes']),
      description: data['Description'] ?? "",
    );
  }
}
