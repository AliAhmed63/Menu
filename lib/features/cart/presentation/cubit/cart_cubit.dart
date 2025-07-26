import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_login_test/features/cart/data/models/cart_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<CartItem> _items = [];

  void addToCart(CartItem item) {
    final index = _items.indexWhere((i) => i.name == item.name);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(quantity: _items[index].quantity + 1);
    } else {
      _items.add(item);
    }
    _updateState();
  }

  void removeFromCart(CartItem item) {
    _items.removeWhere((i) => i.name == item.name);
    _updateState();
  }

  void _updateState() {
    final total = _items.fold(0.0, (sum, item) => sum + item.totalPrice);
    emit(CartUpdated(List.from(_items), total));
  }
}
