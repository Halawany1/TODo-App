import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/bloc/appcubit.dart';

Widget item(Map model,context){
  return Dismissible(
    onDismissed: (direction) {
      Appcubit.get(context).deletedatabase(id: model['id']);
    },
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(child: Text("${model['time']}",style: TextStyle(color: Colors.white),)
            ,backgroundColor: Colors.deepPurple,
            radius: 40,)
          ,SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${model['title']}",style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 16),),
                SizedBox(height: 4,),
                Text("${model['date']}",style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Appcubit.get(context).Upadtedatabase(status: 'done', id: model['id']);
            },
            icon:model['status']!='archived'?(model['status']=="done"?Icon(Icons.check_box,color: Colors.green,)
                :Icon(Icons.check_box,color: Colors.black45,)):Icon(Icons.check_box,color: Colors.green,)),
          SizedBox(width: 10,),
          IconButton(
            onPressed: () {
              Appcubit.get(context).Upadtedatabase(status: 'archived', id: model[ 'id']);
            },
              icon:model['status']!='done'?(model['status']=="archived"?Icon(Icons.archive,color: Colors.green,)
                  :Icon(Icons.archive,color: Colors.black45,)):Icon(Icons.archive,color: Colors.black45,)),
        ],
      ),
    ),
  );
}