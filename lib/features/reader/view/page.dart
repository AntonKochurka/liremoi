import 'package:flutter/material.dart';
import 'package:liremoi/core/theme/style.dart';
import 'package:liremoi/shared/widget/header.dart';

class ReaderPage extends StatefulWidget {
  final String documentId;

  const ReaderPage({super.key, required this.documentId});

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppHeader(
              title: 'Reader',
              subtitle: 'Reading: ${widget.documentId}',
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Your book will appear here.',
                  style: isDark
                      ? AppTypography.darkBodyLarge
                      : AppTypography.lightBodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
