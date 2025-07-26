// lib/features/cart/data/model/cart_item.dart
class CartItem {
  final String name;
  final double price;
  final int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      name: name,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => price * quantity;
}
