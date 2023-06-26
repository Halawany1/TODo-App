import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/bloc/appcubit.dart';
import '../../shared/bloc/appstate.dart';
import '../../shared/buildtaskitem/shared_item.dart';
import '../../shared/item_builder/builder.dart';

class done_task extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Appcubit tasks=Appcubit.get(context);
    return BlocConsumer<Appcubit,AppState>(
      listener: (context, state) {
      },
      builder: (context, state) =>Conbuild(newtask: tasks.donetask,context: context)
    );
  }
}