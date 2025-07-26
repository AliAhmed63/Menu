import 'package:dartz/dartz.dart';
import 'package:firebase_login_test/core/errors/failures.dart';
import 'package:firebase_login_test/features/auth/domain/entities/user_entite.dart';
// هنا بنعرف كل الفانكشن المهمه الي هتتعمل عشان اتمام عملية اللوجن والريجيستر لليوزر
// وبعدين بنعمل وراثة للكلاس دا لكلاس تاني اسمو ريبو امبلمنت وبنعرف الفانكشن دي كلها هتعمل اي هناك
// basec oop هنا ابستراكت كلاس وهناك نعمل وراثة كلين اركتكتشر وكدا يعني
// لو اخدنا بالنا هنا بنتعامل مع اليوزر انتيتي الي عملنا مش اليوزر الي راجع مع الباك اند او الفير بيز
// روح كلاس الييوزر انتيتي وانتا تفهم وفديو 44 ثوت سامي
abstract class AuthRepo {
  Future<Either<Failure, UserEntite>> createUserWithEmailAndPassword(
      String email, String password, String name, String phoneNumber);

  Future<Either<Failure, UserEntite>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, UserEntite>> signInWithGoogle();

  Future<Either<Failure, UserEntite>> signInWithFacebook();

  Future addUserData({required UserEntite user});
  Future saveUserData({required UserEntite user});
  //هنا بنعرف فانكشن خاصة بس بانها تجيب الداتا الخاصة باليوزر بسس مش عامة
  Future<UserEntite> getUserData({required String userId});
}
