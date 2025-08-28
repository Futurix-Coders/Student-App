import 'package:get/get.dart';
import 'package:student_app/screens/classroom/classroom_screen.dart';
import 'package:student_app/screens/classroom/classroom_detail_screen.dart';
import 'package:student_app/screens/assignment/pending_assignment_screen.dart';
import 'package:student_app/screens/assignment/submit_assignment_screen.dart';
import 'package:student_app/screens/chat/class_chat_screen.dart';
import 'package:student_app/screens/fees/fees_screen.dart';
import 'package:student_app/screens/routine/routine_screen.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/permission/location_permission_screen.dart';
import '../screens/permission/notification_permission_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/account/account_screen.dart';
import '../screens/result/result_screen.dart';
import '../screens/mar/mar_certificate_screen.dart';
import '../screens/attendance/attendance_screen.dart';
import '../screens/notification/notifications_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String locationPermission = '/location-permission';
  static const String notificationPermission = '/notification-permission';
  static const String home = '/home';
  static const String account = '/account';
  static const String classroom = '/classroom';
  static const String classroomDetail = '/classroom-detail';
  static const String pendingAssignments = '/pending-assignments';
  static const String submitAssignment = '/submit-assignment';
  static const String classChat = '/class-chat';
  static const String routine = '/routine';
  static const String results = '/results';
  static const String marCertificates = '/mar-certificates';
  static const String attendanceRecord = '/attendance-record';
  static const String fees = '/fees';
  static const String notifications = '/notifications';

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
    GetPage(
      name: classroom,
      page: () => const ClassroomScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: classroomDetail,
      page: () => ClassroomDetailScreen(
        classroom: Get.arguments,
      ),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: pendingAssignments,
      page: () => const PendingAssignmentScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: submitAssignment,
      page: () => SubmitAssignmentScreen(
        assignment: Get.arguments,
      ),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: classChat,
      page: () => const ClassChatScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: routine,
      page: () => const RoutineScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: results,
      page: () => const ResultScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: marCertificates,
      page: () => const MarCertificateScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: attendanceRecord,
      page: () => const AttendanceScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: fees,
      page: () => const FeesScreen(), // Placeholder for Fees Screen
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: notifications,
      page: () => const NotificationsScreen(),
      transition: Transition.fadeIn,
    )
  ];
}
