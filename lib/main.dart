import 'package:blood_app/firebase_options.dart';
import 'package:blood_app/pages.dart/Addmanager.dart';
import 'package:blood_app/pages.dart/All_donors.dart';
import 'package:blood_app/pages.dart/HomePage.dart';
import 'package:blood_app/pages.dart/Login.dart';
import 'package:blood_app/pages.dart/ManagerHome.dart';
import 'package:blood_app/pages.dart/Signup.dart';
import 'package:blood_app/pages.dart/Splashscreen.dart';
import 'package:blood_app/pages.dart/add_donor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen()
    );
  }
}
