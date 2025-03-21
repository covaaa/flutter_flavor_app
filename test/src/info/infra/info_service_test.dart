import 'package:flutter/services.dart';
import 'package:flutter_flavor_app/src/info/info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockInfoService extends Mock implements InfoService {}

void main() {
  late ProviderContainer container;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    container = ProviderContainer();
  });

  test('should fetch info', () {
    expect(
      () => container.read(infoServiceProvider).fetchInfo(),
      throwsA(isA<MissingPluginException>()),
    );
  });
}
