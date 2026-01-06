import 'package:flutter/material.dart';
import 'package:liremoi/features/library/view/page.dart';
import 'package:liremoi/features/splash_page.dart';

import 'router_cubit.dart';

class RouterView extends StatelessWidget {
  final RouterState state;

  const RouterView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      SplashRoute() => const SplashPage(),

      LibraryRoute() => const LibraryPage(),

      ReaderRoute() => throw UnimplementedError(),
      PreviewRoute() => throw UnimplementedError(),
    };
  }
}
