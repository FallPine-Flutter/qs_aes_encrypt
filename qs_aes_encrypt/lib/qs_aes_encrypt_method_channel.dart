import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'qs_aes_encrypt_platform_interface.dart';

/// An implementation of [QsAesEncryptPlatform] that uses method channels.
class MethodChannelQsAesEncrypt extends QsAesEncryptPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('qs_aes_encrypt');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
