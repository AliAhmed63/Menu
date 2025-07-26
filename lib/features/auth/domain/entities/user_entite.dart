//احنا عملنا الكلاس دا عشان نتجنب الاخطاء الي بتحصل بعد كدا لو حبلينا نغير مصدر الداتا
//يعني مثلا في الفاير بيز بنعمل كردنشيل شايل كل الداتا الي جاية من الفاير بيز ودا بيتعمل تلقائي
// ف لو حبينا نغير ل api هنضطر نعدل في الكود كله
// فعشان كدا عملنا دا عشان يبقا حلقة وصل بين الدات بيز واليو اي
class UserEntite {
  String name;
  String email;
  String id;
  String? phoneNumber;
  UserEntite(
      {required this.name,
      required this.email,
      required this.id,
      required this.phoneNumber});
}
