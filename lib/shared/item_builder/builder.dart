import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/bloc/appcubit.dart';

import '../buildtaskitem/shared_item.dart';

Widget Conbuild({required List<Map>newtask,required context}){
  return ConditionalBuilder(
    builder: (context) => ListView.separated(itemBuilder: (context, index) {
      return item(newtask[index],context);
    },
        separatorBuilder: (context, index) => Container(
          width: double.infinity,
          height: 1,
          color: Colors.white,
        ), itemCount:newtask.length),
    condition:newtask.length>0 ,
    fallback: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('images/empty.jpg')),
          SizedBox(height: 10,),
          Text('No Task Yet, Please Add Some Tasks',
            style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey) ,)
        ],
      ),
    ),
  );
}