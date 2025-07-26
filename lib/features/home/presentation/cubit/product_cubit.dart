import 'package:bloc/bloc.dart';
import 'package:firebase_login_test/features/home/data/models/product_model.dart';
import 'package:firebase_login_test/features/home/domain/repositories/menu_repo.dart';

part 'product_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final MenuRepo menuRepo;

  MenuCubit(this.menuRepo) : super(MenuInitial());

  void fetchProducts(String category) async {
    emit(MenuLoading());
    try {
      final products = await menuRepo.getProductsByCategory(category);
      emit(MenuLoaded(products));
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }
  
}
