import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/firebase/firebase_function.dart';
import 'package:untitled1/provider/my_provider.dart';
import 'package:untitled1/ui/auth/register_screen.dart';
import 'package:untitled1/ui/home/tabs/add_task_bottom_sheet.dart';
import 'package:untitled1/ui/home/tabs/setting_tab.dart';
import 'package:untitled1/ui/home/tabs/task_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFFDFECDB),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 80,
        title: Text('To Do '
            //'${provider.userModle?.userName}'
          ,style: TextStyle(
          color: Colors.white,fontSize: 30,
        ),),
      actions: [IconButton(onPressed: (){
        FirebaseFunction.logOut();
        Navigator.pushNamedAndRemoveUntil(context, RegisterScreen.routeName, (route) => false);
      }, icon:Icon(Icons.logout))],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          showModalBottomSheet(context: context, builder: (context){
            return AddTaskBottomSheet();
          });
        },
        child: Icon(Icons.add,
          size: 30,),
        shape: RoundedRectangleBorder (borderRadius:
        BorderRadius.circular(30),
            side: BorderSide(width: 3,
                color: Colors.white)
        ),

      ),
      bottomNavigationBar:
      BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 3,
        height: 100,
        child: BottomNavigationBar(

          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: index,
          onTap: (value){
            index=value;
            setState(() {

            });
          },

          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.shade300,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.task),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: '')
          ],),
      ),
      body:Tabs[index] ,

    );
  }
  List<Widget>Tabs=[TaskTab(),SettingTab()];
}
