import 'package:firebase_login_test/features/home/data/models/product_model.dart';


abstract class MenuRepo {
  Future<List<ProductModel>> getProductsByCategory(String category);
}