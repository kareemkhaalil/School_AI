import 'package:go_router/go_router.dart';
import 'package:school_ai/presentation/views/Auth/sign_screen.dart';
import 'package:school_ai/presentation/views/students/add_student.dart';
import 'package:school_ai/presentation/views/students/students.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRouterPath.addStudent,
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => Students(),
      ),
    ],
  );
}

abstract class AppRouterPath {
  static const String signIn = '/';
  static const String signInFaluire = '/auth-failure';
  static const String addStudent = '/add-student';
}
