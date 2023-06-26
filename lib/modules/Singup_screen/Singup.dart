import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/bloc/appcubit.dart';

import '../../shared/sharedbottom/defaultbottom.dart';
import '../../shared/sharedformfield/defualtformfield.dart';
import '../Singup_screen/Singup.dart';



class signup_screen extends StatefulWidget {
  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  var emailcontroller=TextEditingController();

  var passwordcontroller=TextEditingController();
  var conpasswordcontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();

  bool pass=false;
  bool conpass=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Sign Up",style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold),),backgroundColor: Colors.deepPurple,),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                SizedBox(height: 50,),
                Text("Welcome Onboard!",style: TextStyle(fontWeight:FontWeight.bold,
                    fontSize: 20,color: Colors.grey[800]),),
                SizedBox(height: 10,),
                Text("Let's help you meet your tasks",
                  style: TextStyle(color: Colors.grey,fontSize: 15),),
                SizedBox(height: 75,),
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
                      setState(() {
                        pass=!pass;
                      });
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
                SizedBox(height: 25,),
                defaultformfield(
                    obscureText:!conpass? true:false,
                    pass: !conpass,
                    suffeix: (){
                      setState(() {
                        conpass=!conpass;
                      });
                    },
                    suf: true,
                    controller: conpasswordcontroller,
                    type: TextInputType.visiblePassword
                    , hinttext:"Confrom Password",
                    labeltext: "Confrom Password", prefix: Icons.lock,
                    validator: (value){
                      if(value!.isEmpty){
                        return "confrom Password must be found";
                      }
                      return null;
                    }),
                SizedBox(height: 35,),
                defaultbutton(email: emailcontroller,
                    password: passwordcontroller, key: formkey, text: "Sign Up",
                s: 2,confrompassword: conpasswordcontroller,context: context),
                SizedBox(height: 20,),
               Container(
                 width: double.infinity,
                 height: 50,
                 child: MaterialButton(onPressed: () => Navigator.pop(context),
                 color: Colors.deepPurple,
                 child: Text("Login",
                   style: TextStyle(fontSize: 25,color: Colors.white),),
                 ),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

