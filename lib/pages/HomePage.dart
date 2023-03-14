import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'SavedPassWordsPage.dart';
import 'package:cipher_safe_1/pages/EncryptionPage.dart';
import 'package:cipher_safe_1/Components/addNewPassword_dialogBox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // final _controller = TextEditingController();
  //
  // void saveNewPassword(){
  //   setState(() {
  //
  //   });
  // }
// Dialog box to add new password
//   void addNewPassword(){
//     showDialog(context: context, builder: (context){
//       return addNewPassWord_dialogBox(
//         controller: _controller,
//         onSave: saveNewPassword,
//         onCancel: () => Navigator.of(context).pop(),
//       );
//     },);
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: [
                Container(
                  width: 350,
                  //height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text('Hey there !!',
                          style: TextStyle(color: Colors.grey[700], fontSize: 24, fontWeight: FontWeight.w900),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text('Welcome to Cipher Safe',
                          style: TextStyle(color: Colors.grey[500], fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text("Store and Encrypt all your Passwords with us. \nDon't worry. It's all saved on your phone.",
                          style: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text("COMPLETELY SAFE !!",
                          style: TextStyle(color: Colors.grey[300], fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(5,5),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                      BoxShadow(
                        color: Colors.grey.shade800,
                        offset: Offset(-4,-4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100,),

          // Container(
          //   child: ElevatedButton(
          //     onPressed: addNewPassword,
          //     child: Text('Click to save new password'),
          //     style: ElevatedButton.styleFrom(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

