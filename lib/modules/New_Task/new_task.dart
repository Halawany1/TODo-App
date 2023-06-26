import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/bloc/appcubit.dart';
import 'package:untitled/shared/bloc/appstate.dart';
import 'package:untitled/shared/buildtaskitem/shared_item.dart';
import 'package:untitled/shared/item_builder/builder.dart';

class new_task extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Appcubit tasks=Appcubit.get(context);
    return BlocConsumer<Appcubit,AppState>(
    listener: (context, state) {
    },
      builder: (context, state) =>Conbuild(newtask: tasks.newtask,context: context)

    );
  }
}