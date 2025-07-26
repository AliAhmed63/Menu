import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_test/features/auth/domain/entities/user_entite.dart';

//هنا بقا تبيجي عملية التحويل من الببنات الي جاية من الفير بيز للبينات الي جاية مننا احنا
// زي ما اتفنا ان الداتا بيز عموما بتبقا مرجعنل مودل
// بس مش هينفع نتعامل معاها علي طول عشان لو حبينا نغير مصدر الداتا دي
// فعشان كدا بنعمل اليوزر انتيتي
// ونيجي هنا بقا دور اليوزر مودل وهو اننا نربط اليوزر انتيتي باليوزر الي راجع مع الفاير بيز
// يا حلاوه الكلين اركتكتسر يا ولاااااااااد

class UserModel extends UserEntite {
  // هنا عملنا اكستند لييوزر مودل وجبنا كل الداتا الخاصه بيه واشنالها ب سوبر
  UserModel(
      {required super.name,
      required super.email,
      required super.id,
      required super.phoneNumber});
// اسم الفانكشن موضحة كل حاجة اظن اننا هنا بنحول الداتا الي جيالنا من اليوزر ببتاع الففاير بيز للداتا  للمودل الي عملنا احنا
  factory UserModel.fromFirbaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      id: user.uid,
      phoneNumber: user.phoneNumber,
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      phoneNumber: json['phoneNumber'],
    );
  }
  factory UserModel.fromEntity(UserEntite user) {
    return UserModel(
      name: user.name,
      email: user.email,
      id: user.id,
      phoneNumber: user.phoneNumber,
    );
  }
  toMap() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'phoneNumber': phoneNumber,
    };
  }
}
