import 'package:firebase_login_test/features/on_boarding/presentation/widgets/on_boarding_page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBordingPageView extends StatelessWidget {
  const OnBordingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OnBoardingPageViewIteam(
          width: 422.6.w,
          height: 261.23.h,
          isVisible: true,
          background: 'assets/images/on_boarding2.svg',
          description:
              'Luqma Bayti offers you the best homemade meals\n prepared with love and care by local chefs. Enjoy\n fresh, home-cooked food delivered to your door.',
          cricterImage: 'assets/images/character1.svg',
          title: 'Delicious Homemade Meals',
        ),
        OnBoardingPageViewIteam(
          width: 390.w,
          height: 288.h,
          isVisible: false,
          background: 'assets/images/on_boarding2.svg',
          description:
              'Explore a unique shopping experience with FruitHUB.\n Browse a wide range of fresh fruits and enjoy top\n quality at the best prices.',
          cricterImage: 'assets/images/character2.svg',
          title: 'Fresh Fruits at Your Fingertips',
        ),
        OnBoardingPageViewIteam(
          width: 550.w,
          height: 280.h,
          isVisible: false,
          background: 'assets/images/on_boarding2.svg',
          description:
              'Get access to the finest selection of homemade\n food and beverages. Order easily and enjoy quick,\n reliable delivery to your location.',
          cricterImage: 'assets/images/character3.svg',
          title: 'Easy Ordering & Fast Delivery',
        ),
      ],
    );
  }
}
