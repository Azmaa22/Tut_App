import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/forget_password_screen/forget_password_screen.dart';
import 'package:flutter_mvvm/presentation/main_screen/main_screen.dart';
import 'package:flutter_mvvm/presentation/on_boarding_screen/view/on_boarding_view.dart';
import 'package:flutter_mvvm/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:flutter_mvvm/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:flutter_mvvm/presentation/splash_screen/splash_screen.dart';
import 'package:flutter_mvvm/presentation/store_details_screen/store_details_screen.dart';
import 'package:flutter_mvvm/utilities/constants/routes_manager.dart';
import 'package:flutter_mvvm/utilities/constants/strings_manager.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
        );
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => const StoreDetailsScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            StringsManager.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            StringsManager.noRouteFound,
          ),
        ),
      ),
    );
  }
}
