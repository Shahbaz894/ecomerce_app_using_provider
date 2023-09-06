
import 'package:ecomerce_app_using_provider/auth_services/firebase_configration.dart';
import 'package:ecomerce_app_using_provider/view/auth/login_screen.dart';
import 'package:ecomerce_app_using_provider/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Configurations configurations=Configurations();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: configurations.apiKey,
        appId: configurations.appId,
        messagingSenderId: configurations.messagingSenderId,
        projectId: configurations.projectId)

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home:  LoginScreen(),
    );
  }
}


// sub say phle directory change karni hn jahn JDK install kia h phr usk bad nechy wali comand paste karni h
//cd D:\jdk-20_windows-x64_bin\jdk-20\bin
//
//C:\Users\lenovo\.android
//keytool -list -v -keystore "C:\Users\lenovo\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
//SHA1: 07:8C:00:E8:CA:84:93:2A:85:F1:B3:95:96:D7:47:3E:E5:E3:5D:FD
//   SHA256: 14:67:0B:4F:57:B7:FD:7B:96:57:E0:4B:A2:2B:7D:D3:A9:13:7D:F7:03:EE:80:FB:24:F9:92:39:EE:D9:9E:73