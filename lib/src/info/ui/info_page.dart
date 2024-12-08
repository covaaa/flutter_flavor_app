import 'package:flutter/material.dart';
import 'package:flutter_flavor_app/src/info/state/readers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoPage extends ConsumerWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncInfo = ref.watch(readInfoProvider);
    return Material(
      key: const ValueKey('info-page'),
      child: asyncInfo.whenOrNull(
        data: (data) => NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              scrolledUnderElevation: 0,
              title: Text('Package info plus'),
            ),
          ],
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    ListTile(
                      leading: const Icon(Icons.home_outlined),
                      title: const Text('App name'),
                      subtitle: Text(data.appName),
                    ),
                    ListTile(
                      leading: const Icon(Icons.domain_outlined),
                      title: const Text('Package name'),
                      subtitle: Text(data.packageName),
                    ),
                    ListTile(
                      leading: const Icon(Icons.commit_outlined),
                      title: const Text('App version'),
                      subtitle: Text(data.version),
                    ),
                    ListTile(
                      leading: const Icon(Icons.construction_outlined),
                      title: const Text('Build number'),
                      subtitle: Text(data.buildNumber),
                    ),
                    ListTile(
                      leading: const Icon(Icons.fingerprint_outlined),
                      title: const Text('Build signature'),
                      subtitle: Text(data.buildSignature),
                    ),
                    ListTile(
                      leading: const Icon(Icons.archive_outlined),
                      title: const Text('Installer store'),
                      subtitle: Text(data.installerStore ?? 'not available'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
