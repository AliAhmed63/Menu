part of 'product_cubit.dart';

abstract class MenuState {}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  final List<ProductModel> products;

  MenuLoaded(this.products);
}

class MenuError extends MenuState {
  final String message;

  MenuError(this.message);
}