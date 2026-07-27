# qs_aes_encrypt

`qs_aes_encrypt` 是一个用于 Flutter/Dart 的 AES 加密插件，当前提供 AES-CBC 模式加密能力，并将加密结果输出为 Base64 字符串。

## 功能

- 支持 AES-CBC 加密
- 支持自定义 `secretKey` 和 `iv`
- 加密结果返回 Base64 字符串，便于接口传输和存储
- 纯 Dart 加密调用，使用简单
- 保留 Android/iOS 平台版本获取示例接口 `getPlatformVersion`

## 安装

在项目的 `pubspec.yaml` 中添加依赖：

```yaml
dependencies:
  qs_aes_encrypt: ^1.0.0
```

如果是本地插件调试，可以使用路径依赖：

```yaml
dependencies:
  qs_aes_encrypt:
    path: ../qs_aes_encrypt
```

然后执行：

```bash
flutter pub get
```

## 使用方法

导入插件：

```dart
import 'package:qs_aes_encrypt/qs_aes_encrypt.dart';
```

调用 `QsAesEncrypt.encrypt` 进行加密：

```dart
final encryptedText = QsAesEncrypt.encrypt(
  secretKey: '1234567890123456',
  iv: 'abcdefghijklmnop',
  content: '需要加密的内容',
);

print(encryptedText);
```

## API

### encrypt

```dart
static String encrypt({
  required String secretKey,
  required String iv,
  required String content,
})
```

参数说明：

| 参数 | 类型 | 必填 | 说明 |
| --- | --- | --- | --- |
| `secretKey` | `String` | 是 | AES 密钥，需符合 AES 密钥长度要求 |
| `iv` | `String` | 是 | CBC 模式使用的初始化向量 |
| `content` | `String` | 是 | 需要加密的明文内容 |

返回值：

- 成功：返回 Base64 格式的加密字符串
- 失败：返回空字符串 `''`，Debug 模式下会打印错误信息

## 参数要求

`secretKey` 会通过 UTF-8 转换为 AES 密钥，长度需要符合 AES 标准：

- 16 字节：AES-128
- 24 字节：AES-192
- 32 字节：AES-256

`iv` 会通过 UTF-8 转换为初始化向量，AES-CBC 模式下通常需要 16 字节。

示例：

```dart
const secretKey = '1234567890123456'; // 16 字节
const iv = 'abcdefghijklmnop'; // 16 字节
```

## 完整示例

```dart
import 'package:flutter/material.dart';
import 'package:qs_aes_encrypt/qs_aes_encrypt.dart';

class EncryptDemoPage extends StatelessWidget {
  const EncryptDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final encryptedText = QsAesEncrypt.encrypt(
      secretKey: '1234567890123456',
      iv: 'abcdefghijklmnop',
      content: 'Hello qs_aes_encrypt',
    );

    return Scaffold(
      appBar: AppBar(title: const Text('AES 加密示例')),
      body: Center(
        child: Text(encryptedText),
      ),
    );
  }
}
```

## 平台版本接口

插件中还保留了 Flutter 插件模板中的平台版本获取接口：

```dart
final plugin = QsAesEncrypt();
final platformVersion = await plugin.getPlatformVersion();
```

该接口会通过 MethodChannel 获取当前平台版本，通常仅用于插件连通性测试。

## 注意事项

- 当前插件只提供加密方法，不包含解密方法
- 当前加密模式为 AES-CBC
- 密钥和 IV 长度不合法时，加密会失败并返回空字符串
- 请不要在客户端代码中硬编码正式环境密钥，建议结合服务端下发、环境配置或其他安全策略管理密钥
