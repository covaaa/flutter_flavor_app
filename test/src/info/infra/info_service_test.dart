import 'package:flutter_flavor_app/src/info/info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockInfoService extends Mock implements InfoService {}

void main() {
  late ProviderContainer container;

  setUp(() => container = ProviderContainer());

  test(
    'should fetch info',
    () async {
      expect(
        () async => container.read(infoServiceProvider).fetchInfo(),
        throwsFlutterError,
      );
    },
  );
}
