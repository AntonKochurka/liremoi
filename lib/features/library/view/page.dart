import 'package:flutter/material.dart';
import 'package:liremoi/core/style.dart';
import 'package:liremoi/shared/widget/header.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(
              title: 'Library',
              subtitle: 'Your personal reading space',
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.menu_book_outlined,
                      size: 56,
                      color: isDark
                          ? AppColors.darkAccent
                          : AppColors.lightAccent,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'No documents yet',
                      style: isDark
                          ? AppTypography.darkBodyLarge
                          : AppTypography.lightBodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Imported PDFs will appear here',
                      style: isDark
                          ? AppTypography.darkCaption
                          : AppTypography.lightCaption,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
