import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'qs_aes_encrypt_method_channel.dart';

abstract class QsAesEncryptPlatform extends PlatformInterface {
  /// Constructs a QsAesEncryptPlatform.
  QsAesEncryptPlatform() : super(token: _token);

  static final Object _token = Object();

  static QsAesEncryptPlatform _instance = MethodChannelQsAesEncrypt();

  /// The default instance of [QsAesEncryptPlatform] to use.
  ///
  /// Defaults to [MethodChannelQsAesEncrypt].
  static QsAesEncryptPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QsAesEncryptPlatform] when
  /// they register themselves.
  static set instance(QsAesEncryptPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
