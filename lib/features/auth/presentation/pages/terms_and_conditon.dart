import 'package:firebase_login_test/core/helper/spacing.dart';
import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/styles_manger/styles_manager.dart';
import 'package:firebase_login_test/core/widgets/custom_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomAppBar(title: 'Terms & Conditions'),
                verticalSpace(16),
                Text(
                  'Welcome to the Loqmet Beity app. Please read the following terms and conditions carefully before using the app:',
                  style: getSemiBoldStyle(color: MyColors.black, fontSize: 13.sp)
                      .copyWith(height: 1.8),
                ),
                const TermsAndConditonCustomText(
                  title: 'App Usage:',
                  description:
                      'You are granted access to use the app for personal and non-commercial purposes only. You must not use the app for any illegal purpose.',
                ),
                const TermsAndConditonCustomText(
                  title: 'Account Creation:',
                  description:
                      'When creating an account, the information you provide must be accurate and complete. You are responsible for maintaining the confidentiality of your account information.',
                ),
                const TermsAndConditonCustomText(
                  title: 'Orders & Payments:',
                  description:
                      'When placing an order through the app, you will see the order details and total amount. Please ensure the accuracy of the information before completing the payment. We use secure payment methods to protect your financial data.',
                ),
                const TermsAndConditonCustomText(
                  title: 'Order Cancellation:',
                  description:
                      'You may cancel orders according to the policies specified in the app. Please review the cancellation policy carefully.',
                ),
                const TermsAndConditonCustomText(
                  title: 'Liability:',
                  description:
                      'We are not responsible for any direct or indirect damages arising from the use of or inability to use the app.',
                ),
                const TermsAndConditonCustomText(
                  title: 'Changes to Terms & Conditions:',
                  description:
                      'We reserve the right to modify these terms and conditions at any time. Users should regularly review this page to stay informed of any changes.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TermsAndConditonCustomText extends StatelessWidget {
  const TermsAndConditonCustomText({
    super.key,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(16),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/SealCheck.svg',
              width: 20.w,
              height: 20.h,
            ),
            horizontalSpace(4),
            Text(
              title,
              style: getSemiBoldStyle(
                color: MyColors.darkBordarPrime,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
        verticalSpace(8),
        Text(
          description,
          style: getRegularStyle(color: MyColors.black, fontSize: 13.sp)
              .copyWith(height: 1.8),
        ),
      ],
    );
  }
}
