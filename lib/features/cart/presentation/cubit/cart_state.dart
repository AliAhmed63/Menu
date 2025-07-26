part of 'cart_cubit.dart';


abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartItem> items;
  final double total;

  CartUpdated(this.items, this.total);
}
