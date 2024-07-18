class ProductAttributesModel {
  String name;
  List<String> values;

  ProductAttributesModel({
    required this.name,
    required this.values,
  });

  //tojson
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  //
  factory ProductAttributesModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    return ProductAttributesModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}
