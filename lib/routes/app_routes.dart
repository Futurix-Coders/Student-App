import 'package:get/get.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/permission/location_permission_screen.dart';
import '../screens/permission/notification_permission_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/account/account_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String locationPermission = '/location-permission';
  static const String notificationPermission = '/notification-permission';
  static const String home = '/home';
  static const String account = '/account';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signup,
      page: () => const SignupScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: locationPermission,
      page: () => const LocationPermissionScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: notificationPermission,
      page: () => const NotificationPermissionScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: account,
      page: () => const AccountScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
