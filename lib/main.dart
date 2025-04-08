import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_demo3x4/app/locator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:login_demo3x4/app/app.bottomsheets.dart';
import 'package:login_demo3x4/app/app.dialogs.dart';
import 'package:login_demo3x4/app/app.router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_animate/flutter_animate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAs23wzFj2nrX6Ze10I-ETACnAzajITNqY",
      authDomain: "login3x4test.firebaseapp.com",
      projectId: "login3x4test",
      storageBucket: "login3x4test.firebasestorage.app",
      messagingSenderId: "582930731815",
      appId: "1:582930731815:web:b89743e569c3c93162cf02",
      measurementId: "G-L2Z5YYGCKS",
    ),
  );
  setupLocator();

  setPathUrlStrategy();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (_) => MaterialApp.router(
        routerDelegate: stackedRouter.delegate(),
        routeInformationParser: stackedRouter.defaultRouteParser(),
      ),
    ).animate().fadeIn(
          delay: const Duration(milliseconds: 50),
          duration: const Duration(milliseconds: 400),
        );
  }
}
