// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';
//
// class LocalAuth {
//   static final _auth = LocalAuthentication();
//
//   static Future<bool> _canAuthenticate() async =>
//       await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
//
//   static Future<bool> authenticate() async{
//     try {
//       if (!await _canAuthenticate()) return false;
//
//       return await _auth.authenticate(
//         // authMessages: const [
//         //   AndroidAuthMessages(
//         //     signInTitle: 'Sign IN',
//         //     cancelButton: 'No Thanks',
//         //   ),
//         //
//         //   IOSAuthMessages(
//         //     cancelButton: 'No Thanks',
//         //   ),
//         // ],
//           localizedReason: 'Use Biometric for authentication',
//           options: const AuthenticationOptions(
//             useErrorDialogs: true,
//             stickyAuth: true,
//           )
//       );
//     }
//     catch (e) {
//       debugPrint('error $e');
//       return false;
//     }
//   }
// }