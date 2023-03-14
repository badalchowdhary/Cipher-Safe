import 'package:encrypt/encrypt.dart' as encrypt;

class encryption_decryption_Algo{

  //for AES encryption and decryption
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  // AES Encryption function
  static encryptAES(text){
    final encrypted = encrypter.encrypt(text, iv: iv);

    // print(encrypted.bytes);
    // print(encrypted.base16);
    // print(encrypted.base64);

    return encrypted;
  }

  //AES Decryption function
  static decryptAES(text){
    final decrypted = encrypter.decrypt(text, iv: iv);
    return decrypted;
  }
}