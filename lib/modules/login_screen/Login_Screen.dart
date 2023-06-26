import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/bloc/appcubit.dart';

import '../../shared/Constant_component.dart';
import '../../shared/sharedbottom/defaultbottom.dart';
import '../../shared/sharedformfield/defualtformfield.dart';
import '../Singup_screen/Singup.dart';


class login_screen extends StatelessWidget {


  var formkey=GlobalKey<FormState>();
  bool pass=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Sign In",style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold),),backgroundColor: Colors.deepPurple,),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text("Welcome back!",style: TextStyle(fontWeight:FontWeight.bold,
                    fontSize: 20,color: Colors.grey[800]),),
                SizedBox(height: 10,),
                Text("Let's help you meet your tasks",
                  style: TextStyle(color: Colors.grey,fontSize: 15),),
                Image(image: AssetImage('images/signin.jpg',),height: 250,
                  width: double.infinity,),

                SizedBox(height: 35,),
                defaultformfield(controller: emailcontroller,
                    type: TextInputType.emailAddress,
                     hinttext:"Email",
                    labeltext: "Enter your Email", prefix: Icons.email
                    ,validator: (value){
                      if(value!.isEmpty){
                        return "Email must be found";
                      }
                      return null;
                    }),
                SizedBox(height: 25,),
                defaultformfield(
                  obscureText:!pass? true:false,
                    pass: !pass,
                    suffeix: (){
                      pass=!pass;
                    },
                    suf: true,
                    controller: passwordcontroller,
                    type: TextInputType.visiblePassword
                    , hinttext:"Password",
                    labeltext: "Enter your Password", prefix: Icons.lock,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password must be found";
                      }
                      return null;
                    }),
                SizedBox(height: 35,),
            defaultbutton(
                email: emailcontroller,
                password: passwordcontroller,
                key: formkey,
                text: "login",
            context: context,s: 0),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Don't have an account?",),
                  SizedBox(width: 5,),
                  TextButton(onPressed: (){
                    Navigator.push(context,
                        PageRouteBuilder(
                            pageBuilder: (context,
                                animation, secondaryAnimation) => signup_screen()));
                  }, child: Text("Register Now"))
                ],)

              ],
            ),
          ),
        ),
      ),
    );
  }
}

