import 'dart:async';

import 'package:ecomerce_app_using_provider/view/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/home_screen.dart';

class SplashServices{
  
  
  void isLogin(BuildContext context){
 final auth=FirebaseAuth.instance;
 final user =auth.currentUser;
 if(user!=null){

   Timer(Duration(seconds:5 ),()=>Navigator.push(context,
       MaterialPageRoute(builder: (context)=>HomeScreen()

       )
   )
   );

 }else{
   Timer(Duration(seconds:3 ),()=>Navigator.push(context,
       MaterialPageRoute(builder: (context)=>LoginScreen()

       )
   )
   );
 }

  }
}