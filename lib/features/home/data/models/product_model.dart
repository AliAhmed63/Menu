// lib/features/menu/data/models/product_model.dart
class ProductModel {
  final String name;
  final double price;
  final String category;

  ProductModel({
    required this.name,
    required this.price,
    required this.category,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      price: (map['price'] as num).toDouble(),
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'category': category,
    };
  }
}
