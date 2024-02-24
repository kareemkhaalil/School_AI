import 'package:go_router/go_router.dart';
import 'package:school_ai/presentation/views/Auth/sign_screen.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRouterPath.signIn,
        builder: (context, state) => SignInScreen(),
      ),
      // GoRoute(
      //   path: AppRouterPath.signInFaluire,
      //   builder: (context, state) => AuthFailuer(),
      // ),
    ],
  );
}

abstract class AppRouterPath {
  static const String signIn = '/';
  static const String signInFaluire = '/auth-failure';
}
