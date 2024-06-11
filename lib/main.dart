// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:progress_tracker/Pages/Authentication/auth.dart';
import 'package:progress_tracker/Pages/App/home_page.dart';
import 'package:progress_tracker/Pages/Authentication/login_page.dart';
import 'package:progress_tracker/Pages/App/progress.dart';
import 'package:progress_tracker/Pages/App/team.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(MainApp());
  } catch (e) {
    print("Error initializing firebase: $e");
  }
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final GoRouter router = GoRouter(initialLocation: '/authPage', routes: [
    GoRoute(path: '/homePage', builder: (context, state) => const HomePage()),
    GoRoute(path: '/loginPage', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/teamPage', builder: (context, state) => const TeamPage()),
    GoRoute(
        path: '/progressPage',
        builder: (context, state) => const ProgressPage()),
    GoRoute(path: '/authPage', builder: (context, state) => const AuthPage()),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Progress Tracker App",
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
