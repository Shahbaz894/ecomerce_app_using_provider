import 'package:ecomerce_app_using_provider/utilis/utilis.dart';
import 'package:ecomerce_app_using_provider/view/auth/login_with_phone.dart';
import 'package:ecomerce_app_using_provider/view/auth/sign_up_screen.dart';
import 'package:ecomerce_app_using_provider/view/forget_password.dart';
import 'package:ecomerce_app_using_provider/view/home_screen.dart';
import 'package:ecomerce_app_using_provider/view/widget/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  final _formkey=GlobalKey<FormState>();
  bool _isObsecurePassword=true;
  bool loading=false;
final _auth=FirebaseAuth.instance;
void loging(){
  setState(() {
    loading=true;
  });
  _auth.signInWithEmailAndPassword(email: emailController.text.toString(),
      password: passController.text.toString()).
  then((value) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>HomeScreen()));
    setState(() {
      loading=false;
    });
  }).onError((error, stackTrace) {
    Utilis().toastMessage(error.toString());
    setState(() {
      loading=false;
    });
  });
}
  void _togglePasswordVisibilty(){
    setState(() {
      _isObsecurePassword = !_isObsecurePassword;
    });
  }
  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Login Page')),
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Form(
               key: _formkey,
               child:  Column(
                 children: [
                   TextFormField(
                     keyboardType: TextInputType.emailAddress,
                   controller: emailController,
                   decoration:  InputDecoration(
                       border: OutlineInputBorder( // Border style
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                       focusedBorder: OutlineInputBorder( // Border style when the field is focused
                         borderRadius: BorderRadius.circular(10.0),
                         borderSide: BorderSide(color: Colors.blue),
                       ),


                       enabledBorder: OutlineInputBorder( // Border style when the field is not focused
                         borderRadius: BorderRadius.circular(10.0),
                         borderSide: BorderSide(color: Colors.grey),
                       ),
                       hintText: 'Email',
                       helperText: 'enter email e.g @shahbazgmail.com',
                       prefixIcon: Icon(Icons.email)
                   ),
                     validator:(value){
                       if(value!.isEmpty){
                         return 'Enter your email address';
                       }
                       return null;


                     } ,
             ),
                   SizedBox(height:15 ,),
                   TextFormField(
                     keyboardType: TextInputType.text,
                     controller: passController,
                     obscureText: _isObsecurePassword,
                     decoration: InputDecoration(
                       border: OutlineInputBorder( // Border style
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                       focusedBorder: OutlineInputBorder( // Border style when the field is focused
                         borderRadius: BorderRadius.circular(10.0),
                         borderSide: BorderSide(color: Colors.blue),
                       ),


                       enabledBorder: OutlineInputBorder( // Border style when the field is not focused
                         borderRadius: BorderRadius.circular(10.0),
                         borderSide: BorderSide(color: Colors.grey),
                       ),
                       //errorText: 'Invalid username', // Error message text
                         hintText: 'Password',
                         helperText: 'enter your password',
                         prefixIcon: Icon(Icons.email),
                       suffixIcon: IconButton(
                         icon: Icon(_isObsecurePassword?Icons.visibility:Icons.visibility_off),
                          onPressed: _togglePasswordVisibilty,


                       )

                     ),

                     validator:(value){
                       if(value!.isEmpty){
                         return 'Enter your password';
                       }
                       return null;


                     } ,
                   ),
                   SizedBox(height:10 ,),
                   Align(
                     alignment: Alignment.bottomRight,
                     child: TextButton(
                       onPressed: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context)=>const ForgetPasswordScreen()));
                       },
                       child: const Text('Forget Password?',style: TextStyle(color: Colors.blue,fontSize: 15),),
                     ),
                   )

                 ],
               ),),
              SizedBox(height: 20,),
              RoundButton(title: 'Login',
              loading: loading,
              onTap: (){
                if(_formkey.currentState!.validate()){
                  loging();


                };
              },
              ),
              const SizedBox(height: 30,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have a account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                  }, child:const Text('Sign Up'), )
                ],
              ),
              const SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>const LoginWithPhone()));

                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.black
                    ),
                    color: Colors.blue


                  ),

                  child: const Center(child: Text('Login With Phone Number')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
