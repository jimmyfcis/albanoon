import 'package:albanoon/core/routes/app_routes.dart';
import 'package:albanoon/features/auth/screens/login_screen.dart';
import 'package:albanoon/features/home/presentation/screens/bottom_bar_screen.dart';
import 'package:albanoon/features/splash/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
//context.goNamed('routeName') → Replaces the current route
//
// context.pushNamed('routeName') → Pushes a new route onto the stack

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.bottomBar,
  routes: [

    GoRoute(
      path: AppRoutes.splash,
      name: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: AppRoutes.bottomBar,
      name: AppRoutes.bottomBar,
      builder: (context, state) => const BottomBarScreen(),
    ),
  ],
);
