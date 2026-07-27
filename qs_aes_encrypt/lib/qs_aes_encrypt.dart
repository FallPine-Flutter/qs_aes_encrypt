import 'package:encrypt/encrypt.dart' as qs_encrypt;
import 'package:flutter/foundation.dart';
import 'qs_aes_encrypt_platform_interface.dart';

class QsAesEncrypt {
  Future<String?> getPlatformVersion() {
    return QsAesEncryptPlatform.instance.getPlatformVersion();
  }

  // 加密
  static String encrypt({
    required String secretKey,
    required String iv,
    required String content,
  }) {
    try {
      final key = qs_encrypt.Key.fromUtf8(secretKey);
      final aesIv = qs_encrypt.IV.fromUtf8(iv);

      final encrypter = qs_encrypt.Encrypter(
        qs_encrypt.AES(key, mode: qs_encrypt.AESMode.cbc),
      );
      final encrypted = encrypter.encrypt(content, iv: aesIv);

      return encrypted.base64;
    } catch (e) {
      _print("加密失败 + $e");
      return '';
    }
  }

  /// 打印
  static void _print(Object? object) {
    if (kDebugMode) {
      print("$object");
    }
  }
}
