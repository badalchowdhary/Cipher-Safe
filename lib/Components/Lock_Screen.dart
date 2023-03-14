// import 'package:cipher_safe/Local_Auth_API.dart';
// import 'package:flutter/material.dart';
//
// class LockScreen extends StatefulWidget {
//   const LockScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LockScreen> createState() => _LockScreenState();
// }
//
// class _LockScreenState extends State<LockScreen> {
//   bool authenticated = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             final autheticate = await LocalAuth.authenticate();
//             setState(() {
//               authenticated = autheticate;
//             });
//           },
//           child: const Text('Authenticate'),
//         ),
//         if (authenticated)
//           const Text(
//             'You are authenticated'
//           ),
//
//       ),
//     );
//   }
// }
