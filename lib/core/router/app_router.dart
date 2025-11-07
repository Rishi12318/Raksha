import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/settings/presentation/screens/settings_screen.dart';
import '../../../features/auth/presentation/screens/agreement_screen.dart';
import '../../../features/auth/presentation/screens/auth_landing_screen.dart';
import '../../../features/auth/presentation/screens/signin_screen.dart';
import '../../../features/auth/presentation/screens/signup_screen.dart';
import '../../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../../screens/screen_one.dart';
import '../../../screens/sign_up_screen.dart' as screens;
import '../../../screens/sign_in_screen.dart' as screens;
import '../../../screens/agreement_page.dart';
import '../../../screens/screen_three.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: '/screen-one',
    routes: [
      GoRoute(
        path: '/screen-one',
        name: 'screen-one',
        builder: (context, state) => const ScreenOne(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      // Agreement Screen
      GoRoute(
        path: '/agreement',
        name: 'agreement',
        builder: (context, state) => const AgreementScreen(),
      ),
      // New Auth Routes
      GoRoute(
        path: '/auth',
        name: 'auth-landing',
        builder: (context, state) => const AuthLandingScreen(),
      ),
      GoRoute(
        path: '/auth/signin',
        name: 'signin',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/auth/signup',
        name: 'signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/auth/forgot-password',
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      // Direct Sign Up/In routes (from screens folder)
      GoRoute(
        path: '/sign-up',
        name: 'sign-up',
        builder: (context, state) => const screens.SignUpScreen(),
      ),
      GoRoute(
        path: '/sign-in',
        name: 'sign-in',
        builder: (context, state) => const screens.SignInScreen(),
      ),
      // Agreement Page (after signup)
      GoRoute(
        path: '/user-agreement',
        name: 'user-agreement',
        builder: (context, state) => const AgreementPage(),
      ),
      // Screen Three - Connecting screen
      GoRoute(
        path: '/connecting',
        name: 'connecting',
        builder: (context, state) => const ScreenThree(),
      ),
    ],
  );
}

