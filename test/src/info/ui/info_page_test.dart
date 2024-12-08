import 'package:flutter/material.dart';
import 'package:flutter_flavor_app/src/info/info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../extensions/fakes.dart';
import '../../../extensions/tester_x.dart';

void main() {
  late Fakes fakes;
  late PackageInfo packageInfo;

  setUp(
    () {
      fakes = Fakes();
      packageInfo = fakes.packageInfo();
    },
  );

  testWidgets(
    'should render',
    (tester) async {
      await tester.pumpApp(
        scaffold: false,
        overrides: [
          readInfoProvider.overrideWith((ref) async => packageInfo),
        ],
        child: const InfoPage(),
      );
      expect(find.byType(NestedScrollView), findsNothing);
      await tester.pump();
      expect(find.byType(NestedScrollView), findsOneWidget);
      expect(find.byType(SliverAppBar), findsOneWidget);
      expect(find.byType(CustomScrollView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(6));
    },
  );
}
