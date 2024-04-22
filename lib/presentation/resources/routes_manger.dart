import 'package:clean_arc_project/presentation/forgot_password/forgot_password_view.dart';
import 'package:clean_arc_project/presentation/login/login_view.dart';
import 'package:clean_arc_project/presentation/main/main_view.dart';
import 'package:clean_arc_project/presentation/onboarding/onboarding_view.dart';
import 'package:clean_arc_project/presentation/register/register_view.dart';
import 'package:clean_arc_project/presentation/resources/strings_manger.dart';
import 'package:clean_arc_project/presentation/splash/splash_view.dart';
import 'package:clean_arc_project/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
        );
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => const MainView(),
        );
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => const StoreDetailsView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() => MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text(
              AppStrings.noRouteFound,
            ),
          ),
        ),
      );
}
