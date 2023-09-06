import 'package:ecomerce_app_using_provider/utilis/utilis.dart';
import 'package:ecomerce_app_using_provider/view/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>LoginScreen())).onError((error, stackTrace) {
                    Utilis().toastMessage(error.toString());
              });
            });
          }, icon: Icon(Icons.logout)),
          SizedBox(width: 15,)
        ],
      ),
    );
  }
}
