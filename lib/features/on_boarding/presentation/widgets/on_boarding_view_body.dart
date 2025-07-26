import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_login_test/core/helper/extensions_route.dart';
import 'package:firebase_login_test/core/helper/spacing.dart';
import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/utils/const.dart';
import 'package:firebase_login_test/features/on_boarding/presentation/widgets/on_boarding_booton.dart';
import 'package:firebase_login_test/features/on_boarding/presentation/widgets/on_bording_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  @override
  late PageController pageController;
  var currentPage = 0;
  @override
  initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBordingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 3,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            activeColor: MyColors.prime,
            color:
                MyColors.orange200, // Change this to your desired orange color
            size: Size(6.0, 6.0),
            activeSize: Size(10.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),

        verticalSpace(25),

        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 18, end: 18),
            child: OnBoardingBotton(
              width: 45.w,
              height: 45.h,
              onPressed: () {
                if (currentPage == 2) {
                  context.pushReplacementNamed(login);
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ),
        // ),
        verticalSpace(40),
      ],
    );
  }
}
