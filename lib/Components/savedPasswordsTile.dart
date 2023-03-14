import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class savedPasswordsTile extends StatelessWidget {

  final String appName;
  final String userID;
  final String password;

  Function(BuildContext)? deleteFunction;

  savedPasswordsTile({
    super.key,
    required this.appName,
    required this.userID,
    required this.password,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,30,10,0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(Icons.person_outline, color: Colors.grey[400], size: 35,),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appName, style: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text('Username :', style: TextStyle(color: Colors.grey[500], fontSize: 13,)),
                        SizedBox(width: 10,),
                        Text(userID, style: TextStyle(color: Colors.grey[200], fontSize: 14, fontStyle: FontStyle.italic)),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('Password :', style: TextStyle(color: Colors.grey[500], fontSize: 13,)),
                        SizedBox(width: 10,),
                        Text(password, style: TextStyle(color: Colors.grey[200], fontSize: 14, fontStyle: FontStyle.italic),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey[900],

            borderRadius: BorderRadius.circular(12),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
