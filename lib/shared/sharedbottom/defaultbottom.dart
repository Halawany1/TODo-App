import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/layout/Home_layout.dart';
import 'package:untitled/modules/login_screen/Login_Screen.dart';

Widget defaultbutton({ TextEditingController ?email,
   TextEditingController ?password,TextEditingController ?confrompassword,
   GlobalKey<FormState>? key,required String text,int s=0,
  TextEditingController ?username,
  context  })=>   Container(
  width: double.infinity,
  height: 50,

  color: Colors.deepPurple,
    child: MaterialButton(
    onPressed: (){
      if(s==0) {
        if (key!.currentState!.validate()) {
          print(email!.text);
          print(password!.text);
          if(!(email.text.isEmpty)&&!(password.text.isEmpty)){Navigator.push(context,
              PageRouteBuilder(pageBuilder:(context, animation, secondaryAnimation)
              => home_layout(), ));}
        }
      }else if(s==1){
        if (key!.currentState!.validate()) {
          print(username!.text);
          if(!(username.text.isEmpty)){
            Navigator.push(context,
              PageRouteBuilder(pageBuilder:(context, animation, secondaryAnimation)
              => login_screen(), ));}
        }

      }else {
        if (key!.currentState!.validate()) {
          print(email!.text);
          print(password!.text);
          print(confrompassword!.text);
          if((!(email.text.isEmpty)&&!(password.text.isEmpty)
              &&!(confrompassword.text.isEmpty))){
            Navigator.push(context,
              PageRouteBuilder(pageBuilder:(context, animation, secondaryAnimation)
              => login_screen(), ));}
        }

      }
    }
    ,child: Text(text,
      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),),
),
  );
