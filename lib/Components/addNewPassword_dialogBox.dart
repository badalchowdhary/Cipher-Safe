import 'package:cipher_safe_1/Components/savedPasswordsTile.dart';
import 'package:flutter/material.dart';

class addNewPassWord_dialogBox extends StatelessWidget {
  final controller_Org;
  final controller_Username;
  final controller_Password;

  //final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  addNewPassWord_dialogBox({
    super.key,
    required this.controller_Org,
    required this.controller_Username,
    required this.controller_Password,
    required this.onSave,
    required this.onCancel,
  });

  //Enter new password to list
  void _enter_new_password(){
    // _controller_Org.text;
    // _controller_Username.text;
    // _controller_Password.text;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Save a new password', style: TextStyle(color: Colors.grey[300]),),
      backgroundColor: Colors.black87,
      content: Container(
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8,8,8,0),
              child: TextField(
                controller: controller_Org,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(),
                  hintText: "Organisation",
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: TextField(
                controller: controller_Username,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(),
                  hintText: "User ID",
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: TextField(
                controller: controller_Password,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
            ),


            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Save Button
                MaterialButton(
                  color: Colors.grey[900],
                  onPressed: onSave,
                  child: Text('Save', style: TextStyle(color: Colors.grey[300]),),
                ),


                //Cancel Button
                MaterialButton(
                  color: Colors.grey[900],
                  onPressed: onCancel,
                  child: Text('Cancel', style: TextStyle(color: Colors.grey[300]),),
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}



