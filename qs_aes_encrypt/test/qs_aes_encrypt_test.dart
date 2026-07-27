import 'package:flutter_test/flutter_test.dart';
import 'package:qs_aes_encrypt/qs_aes_encrypt.dart';
import 'package:qs_aes_encrypt/qs_aes_encrypt_platform_interface.dart';
import 'package:qs_aes_encrypt/qs_aes_encrypt_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQsAesEncryptPlatform
    with MockPlatformInterfaceMixin
    implements QsAesEncryptPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final QsAesEncryptPlatform initialPlatform = QsAesEncryptPlatform.instance;

  test('$MethodChannelQsAesEncrypt is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQsAesEncrypt>());
  });

  test('getPlatformVersion', () async {
    QsAesEncrypt qsAesEncryptPlugin = QsAesEncrypt();
    MockQsAesEncryptPlatform fakePlatform = MockQsAesEncryptPlatform();
    QsAesEncryptPlatform.instance = fakePlatform;

    expect(await qsAesEncryptPlugin.getPlatformVersion(), '42');
  });
}
