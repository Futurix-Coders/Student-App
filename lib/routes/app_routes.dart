import 'package:get/get.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/permission/location_permission_screen.dart';
import '../screens/permission/notification_permission_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String locationPermission = '/location-permission';
  static const String notificationPermission = '/notification-permission';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signup,
      page: () => const SignupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: locationPermission,
      page: () => const LocationPermissionScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: notificationPermission,
      page: () => const NotificationPermissionScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
