import 'package:flutter_flavor_app/src/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ignore: subtype_of_sealed_class
class MockProvider extends Mock implements ProviderBase<Object?> {}

void main() {
  late MockProvider mockProvider;
  late RiverpodObserver sut;

  setUp(
    () {
      mockProvider = MockProvider();
      sut = RiverpodObserver();
    },
  );

  test(
    'should observe',
    () {
      sut
        ..didAddProvider(mockProvider, 0, ProviderContainer())
        ..didUpdateProvider(mockProvider, 0, 1, ProviderContainer())
        ..didDisposeProvider(mockProvider, ProviderContainer());
    },
  );
}
