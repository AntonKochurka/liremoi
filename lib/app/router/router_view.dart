import 'package:flutter/material.dart';

import 'package:liremoi/shared/widget/layout.dart';

import 'package:liremoi/features/library/view/page.dart';
import 'package:liremoi/features/splash/view/page.dart';
import 'package:liremoi/features/reader/view/page.dart';

import 'router_cubit.dart';

class RouterView extends StatelessWidget {
  final RouterState state;

  const RouterView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state is SplashRoute) {
      return const SplashPage();
    }

    final page = switch (state) {
      LibraryRoute() => const LibraryPage(),

      ReaderRoute(:final documentId) => ReaderPage(documentId: documentId),

      // PreviewRoute(:final documentId) =>
      // PreviewPage(documentId: documentId),
      _ => const LibraryPage(),
    };

    return AppLayout(child: page);
  }
}
