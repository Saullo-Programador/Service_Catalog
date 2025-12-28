import 'package:go_router/go_router.dart';
import 'package:jobs_app/presentation/pages/home_screen.dart';
import 'package:jobs_app/presentation/pages/create_screen.dart';
import 'package:jobs_app/presentation/pages/splash_screen.dart';
import 'package:jobs_app/presentation/pages/welcome_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/Splash",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: "/Welcome",
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/Resister",
      builder: (context, state) => const ResisterScreen(),
    )
  ], 
);
