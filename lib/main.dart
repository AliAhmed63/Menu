import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_test/core/helper/custom_bloc_observer.dart';
import 'package:firebase_login_test/core/helper/get_it_service.dart';
import 'package:firebase_login_test/core/helper/shred.dart';
import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/routes_manger/routes_manager.dart';
import 'package:firebase_login_test/core/utils/const.dart';
import 'package:firebase_login_test/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:firebase_login_test/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  await Shareds.init();
  runApp(const FireBaseLogin());
}

class FireBaseLogin extends StatelessWidget {
  const FireBaseLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
        // BlocProvider<AuthCubit>(create: (_) => AuthCubit()), ← لو عندك حاجة تانية
      ],
      child: ScreenUtilInit(
        designSize: const Size(391, 844),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: MyColors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: MyColors.green1600),
            useMaterial3: true,
          ),
          onGenerateRoute: generateRoute,
          initialRoute: splash,
        ),
      ),
    );
  }
}
