import 'package:flutter_flavor_app/src/info/infra/info_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'readers.g.dart';

@riverpod
FutureOr<PackageInfo> readInfo(Ref ref) {
  return ref.watch(
    infoServiceProvider.select((service) => service.fetchInfo()),
  );
}
