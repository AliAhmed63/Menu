import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login_test/core/helper/database_service.dart';

class FireStoreService implements DatabaseService {
  // هنا بنفتح الكولكشن الي هنباصيلها الباث بتاعها
  // هنا بنعمل انستنس من الفابر ستور عشان نقدر نتعامل مع الفاير استور
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  @override

  /// [path] the name of the collection
  /// [data] the data to be added
  /// returns a [Future] that resolves when the data has been added
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> userData,
      String? docId}) async {
    // السطر دا معناه اني باخد الداتا الي بتتبصالي علي هيئة ماب اوف دينامك واباصيه للمكان الي هو الباث الي عايز اخزن فيه ف الفاير بيو
    if (docId != null) {
      fireStore.collection(path).doc(docId).set(userData);
    } else {
      await fireStore.collection(path).add(userData);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId}) async {
    //هنا بنفتح الكولكشن الي هنباصيلها الباث بتاعها ونفتح الايدي الي عيزينه من جوا  الدوك الي جوا الكولكشن ونجيب منها الداتا ب جيت
    var data = await fireStore.collection(path).doc(docId).get();

    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docId}) async {
    var data = await fireStore.collection(path).doc(docId).get();
    return data.exists;
  }
}
