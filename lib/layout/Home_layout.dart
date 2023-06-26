import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/modules/Archived_Task/archived_task.dart';
import 'package:untitled/modules/Done_Task/done_task.dart';
import 'package:untitled/modules/New_Task/new_task.dart';
import 'package:untitled/shared/bloc/appcubit.dart';
import 'package:untitled/shared/bloc/appstate.dart';
import '../shared/Constant_component.dart';
import '../shared/sharedformfield/defualtformfield.dart';


class home_layout extends StatelessWidget {
  var timecontroller=TextEditingController();
  var titlecontroller=TextEditingController();
  var datecontroller=TextEditingController();
  var notecontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();
  var scaffoledkey=GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => Appcubit()..createDatabase(),
      child: BlocConsumer<Appcubit,AppState>(
builder: (context, state) {
  Appcubit cubit=Appcubit.get(context);
 return Scaffold(
    key: scaffoledkey,
    backgroundColor: Colors.white,
    body: ConditionalBuilder(
      builder: (context) =>cubit.Screen[cubit.current_index],
      condition: state is! Appgetloadingdbstate,
      fallback:(context) => Center(child: CircularProgressIndicator()),
    ),
    drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(

              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('My Info',
                  style: TextStyle(fontWeight: FontWeight.bold
                ,fontSize: 40,color: Colors.white),),
              ),
            ),
            ListTile(
              title:  Text('Hello ,\n${usercontroller.text}',
                style: TextStyle(fontSize:27, fontWeight: FontWeight.bold),),
            ),
            ListTile(
              title:  Text('Email : ${emailcontroller.text}',
                style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),),
            ),
            ListTile(
              title:  Text('Password : ${passwordcontroller.text}',
                style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),),
            ),
          ],
        )
    ),
    appBar: AppBar(title: Text(cubit.title[cubit.current_index]),
        backgroundColor: Colors.deepPurple),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.deepPurple,
        onPressed: () {
          if(cubit.isbottomshown){
            if(formkey.currentState!.validate()){
              cubit.insertdatabase(
                  date: datecontroller.text,
                  time: timecontroller.text,
                  title:titlecontroller.text,
                 note: notecontroller.text,
              );
              cubit.changebottomsheet(icon: Icons.edit,isshown:false );
            }

          }else{
            scaffoledkey.currentState!.showBottomSheet((context){
              return  Container(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      defaultformfield(controller: titlecontroller,
                          type: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Title must be found";
                            }
                            return null;
                          },
                          labeltext: "Task Title",
                          prefix: Icons.task),
                      SizedBox(height: 15,),
                      defaultformfield(
                          ontap: (){
                            showTimePicker(context: context,
                                initialTime: TimeOfDay.now()).
                            then((value) {
                              timecontroller.text=value!.format(context).toString();
                              print(value.format(context).toString());
                            }).catchError((error){
                              print("error when choose time ${error.toString()}");
                            });
                          },
                          controller: timecontroller,
                          type: TextInputType.datetime,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Time must be found";
                            }
                            return null;
                          },
                          labeltext: "Task Time",
                          prefix: Icons.watch_later_outlined),
                      SizedBox(height: 15,),
                      defaultformfield (
                          ontap: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2025-05-02')
                            ).then((value) {
                              datecontroller.text=DateFormat.yMMMd().format(value!);
                              print(DateFormat.yMMMd().format(value));
                            }).catchError((error){
                              print("error when choose time ${error.toString()}");
                            });
                          },
                          controller: datecontroller,
                          type: TextInputType.datetime,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Date must be found";
                            }
                            return null;
                          },
                          labeltext: "Task Date",
                          prefix: Icons.date_range),

                    ],
                  ),
                ),
              );
            },elevation:30).closed.then((value) {
              cubit.changebottomsheet(icon: Icons.edit,isshown:false );
            });
            cubit.changebottomsheet(icon: Icons.add,isshown:true );
          }
        },
        child: Icon(cubit.fbicon)
    ),
    bottomNavigationBar: BottomNavigationBar(
      elevation: 50,
      backgroundColor: Colors.black45,
      currentIndex:cubit.current_index ,
      onTap: (index) {
        cubit.change(index);
      },

      unselectedItemColor: Colors.white,
    selectedItemColor: Colors.deepPurple,
      items: [
        BottomNavigationBarItem(

            icon: Icon(Icons.format_list_bulleted_sharp,),
            label: "Task",),
        BottomNavigationBarItem(icon: Icon(Icons.done),label: "Done"),
        BottomNavigationBarItem(icon: Icon(Icons.archive),label: "Archived")
      ],
    ),
  );
},
listener:(context, state) {
if(state is Appinsertdbstate){
  Navigator.pop(context);
}
    },

      ),
    );
  }



}