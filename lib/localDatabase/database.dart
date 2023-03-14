import 'package:hive_flutter/hive_flutter.dart';

class savedPasswords_Database {

  List saved_Passwords = [];

  //referencing the hive box
  final _myBox = Hive.box('myBox');

  //run this while opening the app for the first time
  void createInitialData(){
    saved_Passwords = [
      ['Cipher Safe','I am a dummy tile', 'Swipe left to delete me'],
    ];
  }

  //load data from the database
  void loadData(){
    saved_Passwords = _myBox.get("SAVEDPASSWORDS");
  }

  //update the database
  void updateDatabase(){
    _myBox.put('SAVEDPASSWORDS', saved_Passwords);
  }
}