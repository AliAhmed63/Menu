import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_test/core/errors/failures.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// الكود اتلي هنا دي الفانكشن الاساسية الي موجوده في فلاتر فاير الديكومنيشن
// ودي الي هتخلينا نتعامل مع اليوزر الي راجع من الفاير بيز الداتا يعني ونكريت كردنشل شايل كل الداتا
class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw ServerFailure( 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw ServerFailure(
             'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.');
      } else if (e.code == 'network-request-failed') {
        throw ServerFailure( 'تاكد من اتصالك بالانترنت.');
      } else {
        throw ServerFailure(
             'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");

      throw ServerFailure(
           'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuth.signInWithEmailAndPassword: ${e.toString()}');
      if (e.code == 'network-request-failed') {
        throw ServerFailure( 'لا يوجد اتصال بالانترنت');
      } else if (e.code == 'user-not-found') {
        throw ServerFailure( 'هذا الحساب غير موجود');
      } else if (e.code == 'wrong-password') {
        throw ServerFailure(
            'كلمة المرور أو البريد الإلكتروني غير صحيحة');
      } else if (e.code == 'invalid-credential') {
        throw ServerFailure(
            'كلمة المرور أو البريد الإلكتروني غير صحيحة');
      } else if (e.code == 'invalid-email') {
        throw ServerFailure(
            ' كلمة المرور أو البريد الإلكتروني غير صالح');
      } else {
        throw ServerFailure( 'هنالك شئ غير صحيح');
      }
    } catch (e) {
      log('Exception in FirebaseAuth.signInWithEmailAndPassword: ${e.toString()}');
      throw ServerFailure('هنالك شئ غير صحيح');
    }
  }

Future<User> signInWithGoogle() async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;

    // تأكد من التهيئة إذا لزم الأمر (clientId حسب نوع المشروع)
    await googleSignIn.initialize();

    final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
    if (googleUser == null) {
      throw ServerFailure('عملية تسجيل الدخول تم إلغاؤها');
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    if (googleAuth.idToken == null || googleAuth.idToken == null) {
      throw ServerFailure('فشل الحصول على رموز المصادقة من Google');
    }

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.idToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final User? user = userCredential.user;

    if (user == null) {
      throw ServerFailure('فشل تسجيل الدخول، لم يتم إنشاء حساب.');
    }

    return user;
  } on FirebaseAuthException catch (e) {
    throw ServerFailure('فشل في تسجيل الدخول عبر Google: ${e.message}');
  } catch (e) {
    throw ServerFailure('حدث خطأ غير متوقع أثناء تسجيل الدخول بـ Google');
  }
}


  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  bool isSignedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
