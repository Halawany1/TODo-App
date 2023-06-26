import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled/layout/Home_layout.dart';
import 'package:untitled/modules/login_screen/Login_Screen.dart';
import 'package:untitled/shared/bloc_observer.dart';
import 'modules/Start_Screen/start_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: startscreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}