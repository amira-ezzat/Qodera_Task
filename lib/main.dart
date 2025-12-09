import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/presentation/page/favorite.dart';
import 'package:flutter_task/presentation/page/home_screen.dart';
import 'package:flutter_task/presentation/screens/home/finger_screen.dart';
import 'package:flutter_task/presentation/screens/login/login_screen.dart';
import 'package:flutter_task/presentation/screens/login/otp_screen.dart';
import 'package:flutter_task/presentation/screens/splashscreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (_) => const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar', 'EG'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        fontFamily: AppFonts.appFontFamily,
      ),
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      home: SplashScreen(),
    );
  }
}
