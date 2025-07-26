// lib/features/menu/data/repo/menu_repo_impl.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login_test/features/home/domain/repositories/menu_repo.dart';
import '../models/product_model.dart';

class MenuRepoImpl implements MenuRepo {
  final FirebaseFirestore firestore;

  MenuRepoImpl(this.firestore);

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final snapshot = await firestore
        .collection('products')
        .where('category', isEqualTo: category)
        .limit(2)
        .get();

    return snapshot.docs
        .map((doc) => ProductModel.fromMap(doc.data()))
        .toList();
  }
}
