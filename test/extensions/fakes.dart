import 'package:package_info_plus/package_info_plus.dart';

final class Fakes {
  PackageInfo packageInfo() {
    return PackageInfo(
      appName: 'fake app',
      packageName: 'com.fake',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '0000',
      installerStore: 'com.store.fake',
    );
  }
}
