
//formfield
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultformfield({
  required TextEditingController controller
  ,required TextInputType type,
   FormFieldValidator<String> ?validator,
  String ?hinttext,
  required String labeltext
  , IconData ?prefix,
  bool pass=false,
  bool suf=false,
  VoidCallback ?suffeix,
  IconData ?suffix1,
  IconData ?suffix2,
  bool obscureText=false,
  VoidCallback ?ontap,
  double ?width
})=> Container(
  width: width,
  child:  TextFormField(
    controller: controller,
    keyboardType: type,
    validator: validator,
    obscureText: obscureText,
    onTap: ontap,
    decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        suffixIcon:suf? IconButton(
          onPressed: suffeix,
          icon: (!pass)?Icon(Icons.visibility):Icon(Icons.visibility_off,),):null,
        labelText: labeltext,
        hintText: hinttext,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
        )
    ),


  ),
);