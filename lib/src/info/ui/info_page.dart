import 'package:flutter/material.dart';
import 'package:flutter_flavor_app/src/info/state/readers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoPage extends ConsumerWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final asyncInfo = ref.watch(readInfoProvider);
    return Scaffold(
      key: const ValueKey('info_page'),
      body: asyncInfo.whenOrNull(
        data: (data) => CustomScrollView(
          key: const ValueKey('info_custom_scroll_view'),
          slivers: [
            SliverAppBar.large(
              key: const ValueKey('info_sliver_app_bar'),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flutter Flavor App',
                    style: theme.textTheme.headlineLarge,
                  ),
                  Text(
                    'with package_info_plus',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              key: const ValueKey('info_sliver_list'),
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
                    leading: const Icon(Icons.store_outlined),
                    title: const Text('Installer store'),
                    subtitle: Text(data.installerStore ?? 'not available'),
                  ),
                ],
              ),
            ),
            const SliverFillRemaining(),
          ],
        ),
      ),
    );
  }
}
