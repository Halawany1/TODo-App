import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/layout/Home_layout.dart';
import 'package:untitled/shared/bloc/appstate.dart';
import '../../modules/Archived_Task/archived_task.dart';
import '../../modules/Done_Task/done_task.dart';
import '../../modules/New_Task/new_task.dart';

class Appcubit extends Cubit<AppState>{
  Appcubit() : super(Appinitailstate());
  static Appcubit get(context)=>BlocProvider.of(context);
  int current_index=0;
  List <Widget>Screen=[
    new_task(),
    done_task(),
    archived_task(),
  ];
  List<String>title=[
    "My Task",
    "Done Task",
    "Archived Task"
  ];
  void change(int index){
    current_index=index;
    emit(Appchangenavbottomstate());
  }
  List<Map>newtask=[];
  List<Map>donetask=[];
  List<Map>archivedtask=[];
  Database ?database;
  createDatabase()async
  {
     await openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database, version) {
          print("Database created");
          database.execute('CREATE TABLE task (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT, note TEXT)')
              .then((value) {
            print("Table created");
          }).catchError((error) {
            print("Error when creating table: ${error.toString()}");
          });
        },
        onOpen: (database) {
          getdatafromdatabase(database);
        }
    ).then((value){
       database=value;
       emit(Appcreatedbstate());
     });
  }
   void insertdatabase({required String title,
    required String date,required String time,String ?note}) {
     database?.transaction((txn) async{
         await txn.rawInsert('INSERT INTO task (title, date, time, status) '
             'VALUES("$title", "$date", "$time", "new")')
          .then((value) {
           getdatafromdatabase(database);
           emit(Appinsertdbstate());
      }).catchError((error) {
        print('Error when inserting into table: ${error.toString()}');
      });
    });
  }
  void getdatafromdatabase(database)async {
   newtask=[];
   donetask=[];
   archivedtask=[];

    await database.rawQuery('SELECT * FROM task').then((value){
      value.forEach((element){
        if(element['status']=='new')newtask.add(element);
        if(element['status']=='done')donetask.add(element);
        if(element['status']=='archived')archivedtask.add(element);
      });

    });
   emit(Appgetdbstate());
  }
  
  void Upadtedatabase({required String status,required int id})async{
   await database!.rawUpdate('UPDATE task SET status=? WHERE id=?',['$status',id])
       .then((value) {
         getdatafromdatabase(database);
     emit(Appupdateedbstate());
   });
  }

  void deletedatabase({required int id})async{
    await database!.rawDelete('DELETE FROM task WHERE id=?',[id])
        .then((value) {
      getdatafromdatabase(database);
      emit(Appdeletedbstate());
    });
  }
  IconData fbicon=Icons.edit;
  bool isbottomshown=false;
  void changebottomsheet({required IconData icon,required bool isshown,context}){
    fbicon=icon;
    isbottomshown=isshown;
    emit(Appchangebottomstate());
  }




}