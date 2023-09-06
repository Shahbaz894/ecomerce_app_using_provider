import 'dart:async';

import 'package:ecomerce_app_using_provider/auth_services/splash_services.dart';
import 'package:flutter/material.dart';

import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices=SplashServices();

  @override
  void initStata(){
    super.initState();
    splashServices.isLogin(context);

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('firebase Services',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Text('firebas '),
      ),
    );
  }
}
