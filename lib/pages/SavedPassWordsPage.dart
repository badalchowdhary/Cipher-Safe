import 'package:cipher_safe_1/Components/addNewPassword_dialogBox.dart';
import 'package:cipher_safe_1/localDatabase/database.dart';
import 'package:flutter/material.dart';
import 'package:cipher_safe_1/Components/savedPasswordsTile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SavedPassWordsPage extends StatefulWidget {
  const SavedPassWordsPage({Key? key}) : super(key: key);

  @override
  State<SavedPassWordsPage> createState() => _SavedPassWordsPageState();
}


class _SavedPassWordsPageState extends State<SavedPassWordsPage> {

  //referencing the hive box
  final _myBox = Hive.box('myBox');
  savedPasswords_Database db = savedPasswords_Database();

  @override
  void initState() {
    //when app opens for the first time
    if(_myBox.get("SAVEDPASSWORDS") == null){
      db.createInitialData();
    }
    else{
      //there already exists data
      db.loadData();
    }

    super.initState();
  }

  final _controller_1 = TextEditingController();
  final _controller_2 = TextEditingController();
  final _controller_3 = TextEditingController();

  void saveNewPassword(){
    setState(() {
      db.saved_Passwords.add([_controller_1.text, _controller_2.text, _controller_3.text]);
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }


  void addNewPassword(){
    showDialog(context: context, builder: (context){
      return addNewPassWord_dialogBox(
        controller_Org: _controller_1,
        controller_Username: _controller_2,
        controller_Password: _controller_3,
        onSave: saveNewPassword,
        onCancel: () => Navigator.of(context).pop(),
      );

    },);
  }

  //delete a saved password
  void deleteTask(int index){
    setState(() {
      db.saved_Passwords.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Your Saved Passwords',
          style: TextStyle(fontSize: 18, color: Colors.grey[400]),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[800],
        onPressed: addNewPassword,
        child: Icon(Icons.add),
      ),

      body:
      ListView.builder(
        itemCount: db.saved_Passwords.length,
        itemBuilder: (context, index) {
          return savedPasswordsTile(
            appName: db.saved_Passwords[index][0],
            userID: db.saved_Passwords[index][1],
            password: db.saved_Passwords[index][2],
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),



    );
  }
}

