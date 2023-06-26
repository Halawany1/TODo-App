import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/login_screen/Login_Screen.dart';
import 'package:untitled/shared/sharedbottom/defaultbottom.dart';

import '../../shared/Constant_component.dart';

class startscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var formkey=GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Todo App",style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                    SizedBox(width: 3,),
                    Image(image: AssetImage('images/list.png'),
                      width: 40,height: 40)

                  ],
                ),
              Image(image: AssetImage('images/start.jpg')),
                Text("Get Things Done with TODo",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height:30,),
                Text("Enter Your Username",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,
                      color: Colors.black45),),
                SizedBox(height: 13,),
                 Padding(
                   padding: const EdgeInsets.only(left: 60,right: 60),
                   child: TextFormField(
                     decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius:BorderRadius.circular(26))
                           ,hintText: "UserName"
                     ),
                     controller: usercontroller,
                     validator: (value){
                     if(value!.isEmpty){
                      return "Username should be found";
                     }
                     return null;
                   },),
                 ),
                 SizedBox(height: 35,),
                 defaultbutton( text: "Get Start",s: 1,
                     username:usercontroller,context: context,key: formkey)

              ]
            ),
          ),
        ),
      ),
    );
  }
}