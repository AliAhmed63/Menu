import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_test/core/errors/exception.dart';
import 'package:firebase_login_test/core/errors/failures.dart';
import 'package:firebase_login_test/core/helper/database_service.dart';
import 'package:firebase_login_test/core/helper/firebase_auth.dart';
import 'package:firebase_login_test/core/helper/shred.dart';
import 'package:firebase_login_test/core/utils/const.dart';

import 'package:firebase_login_test/features/auth/data/models/user_model.dart';
import 'package:firebase_login_test/features/auth/domain/entities/user_entite.dart';
import 'package:firebase_login_test/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntite>> createUserWithEmailAndPassword(
      String email, String password, String name, String phoneNumber) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntite = UserEntite(
          name: name, email: email, id: user.uid, phoneNumber: phoneNumber);
      await addUserData(user: userEntite);
      print(userEntite.phoneNumber.toString());
      return right(userEntite);
    } on AppError catch (e) {
      await deleteUser(user);

      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);

      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntite>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntite = await getUserData(userId: user.uid);
      await saveUserData(user: userEntite);
      return right(userEntite);
    } on AppError catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}');
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntite>> signInWithGoogle() async {
    User? user;

    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntite = UserModel.fromFirbaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndPoints.isUserExist,
        docId: userEntite.id,
      );
      if (isUserExist) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntite);
      }
      await addUserData(user: userEntite);
      return right(userEntite);
    } catch (e) {
      await deleteUser(user);

      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(
        ServerFailure(
          'هنالك شئ غير صحيح',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntite>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntite = UserModel.fromFirbaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndPoints.isUserExist,
        docId: userEntite.id,
      );
      if (isUserExist) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntite);
      }

      await addUserData(user: userEntite);
      return right(
        userEntite,
      );
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return left(
        ServerFailure(
          'هنالك شئ غير صحيح',
        ),
      );
    }
  }

  @override
  Future addUserData({required UserEntite user}) async {
    await databaseService.addData(
      path: BackendEndPoints.addUserData,
      userData: UserModel.fromEntity(user).toMap(),
      docId: user.id,
    );
  }

  @override

  /// Gets a user's data from Firestore
  /// userId is the user's id as provided by Firebase Authentication
  /// Returns a UserEntite object with the user's data
  /// هنا ينعمل امبلمنت للفانكشن المخصصة انها تجيب الداتا بتاعت اليوزر بس

  /// وبعدين نعمل متغير يحفظ الداتا الي هنجيبها باستخدام الفانكشن العامة الي مسؤلة انها تجيب الدتا بشكل عام االي عملنها في الفاير ستور سيرفز
  /// وبعدين نعملها ريترن وتبقا هي دي الريترن الخاصة بالفنكشن المخصصة بتاعت الدات  الخاصة باليوزر

  Future<UserEntite> getUserData({required String userId}) async {
    var userData = await databaseService.getData(
        path: BackendEndPoints.getUserData, docId: userId);
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntite user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Shareds.setString(kUserData, jsonData);
  }
}
