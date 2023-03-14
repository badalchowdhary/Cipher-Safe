import 'package:cipher_safe_1/Components/encryption_algo.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionPage extends StatefulWidget {
  const EncryptionPage({Key? key}) : super(key: key);

  @override
  State<EncryptionPage> createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {

  final _textController = TextEditingController();
  var encrypted_text, decrypted_text, plain_text;

  void showSnackBar(context){
    final snackBar = SnackBar(content: Text('Copied to Clipboard'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  _copy (){
    final value = ClipboardData(text: encrypted_text);
    Clipboard.setData(value);

    return showSnackBar(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Encrypt Your Password',
          style: TextStyle(fontSize: 18, color: Colors.grey[400]),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Container(
                  width: 150,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Icon(Icons.account_balance_outlined, color: Colors.grey[300], size: 80,),
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
              ),
              // Container(
              //   child:
              //     Center(
              //         child: Icon(Icons.account_balance_outlined, color: Colors.grey[300], size: 80,)
              //     ),
              // ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,40,10,40),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: 'Enter password to encrypt',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textController.clear();
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        plain_text = _textController.text;
                        setState(() {
                          encrypted_text = encryption_decryption_Algo.encryptAES(plain_text);
                        });

                        showDialog(context: context, builder: (context){
                          return Container(
                            child: AlertDialog(
                              backgroundColor: Colors.black87,
                              title: Text('Your encrypted password is', style: TextStyle(color: Colors.grey[500], fontSize: 18),),
                              content: Text(
                                  encrypted_text == Null ? "" : encrypted_text is encrypt.Encrypted ? encrypted_text.base64 : encrypted_text,
                                  style: TextStyle(color: Colors.grey[300], fontSize: 14)
                              ),

                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                        _copy();
                                      },
                                      child: Text(
                                        'Copy',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),

                                    TextButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),

                                  ],
                                )


                              ],

                            ),
                          );
                        });
                      },
                      color: Colors.grey[900],
                      child: Text('Encrypt', style: TextStyle(color: Colors.grey[300]),),

                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(4,4),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                        BoxShadow(
                          color: Colors.grey.shade800,
                          offset: Offset(-4,-4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   child: MaterialButton(
                  //     onPressed: () {
                  //       encrypted_text = _textController.text;
                  //       setState(() {
                  //         plain_text = encryption_decryption_Algo.decryptAES(encrypted_text);
                  //       });
                  //       showDialog(context: context, builder: (context){
                  //         return Container(
                  //           child: AlertDialog(
                  //             title: Text('Your decrypted message is'),
                  //             content: Text(plain_text),
                  //             actions: [
                  //               TextButton(onPressed: () {
                  //                 Navigator.pop(context);
                  //               } , child: Text('OK'),)
                  //             ],
                  //
                  //           ),
                  //         );
                  //       });
                  //     },
                  //     color: Colors.grey[900],
                  //     child: Text('Decrypt', style: TextStyle(color: Colors.grey[300]),),
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey[900],
                  //     borderRadius: BorderRadius.circular(12),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black,
                  //         offset: Offset(5,5),
                  //         blurRadius: 15,
                  //         spreadRadius: 5,
                  //       ),
                  //       BoxShadow(
                  //         color: Colors.grey.shade800,
                  //         offset: Offset(-4,-4),
                  //         blurRadius: 15,
                  //         spreadRadius: 1,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

