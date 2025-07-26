import 'package:firebase_login_test/core/recourses/styles_manger/styles_manager.dart';
import 'package:firebase_login_test/core/widgets/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// مسافات مخصصة باستخدام ScreenUtil
SizedBox verticalSpace(double height) => SizedBox(height: height.h);
SizedBox horizontalSpace(double width) => SizedBox(width: width.w);

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final IconData icon;
  final VoidCallback onAdd;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurpleAccent.withOpacity(0.2),
              ),
              child: Icon(icon, size: 32.sp, color: Colors.white),
            ),
            verticalSpace(8),
            Text(
              name,
              style: getBoldStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(12),
            // السعر
            Text(
              "$price EGP",
              style: getBoldStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 16.sp,
              ),
            ),
            verticalSpace(8),
            // زرار الإضافة
            CustomBotton(
              text: "Add to Cart",
              onPressed: onAdd,
              height: 36.h,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
