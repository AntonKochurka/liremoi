import 'package:flutter/material.dart';
import 'package:liremoi/core/theme/style.dart';
import 'package:liremoi/features/library/view/widgets/add_book_modal.dart';
import 'package:liremoi/shared/widget/header.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Stack(
        children: [
          Padding(
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
          Positioned(
            bottom: 24,
            right: 24,
            child: GestureDetector(
              onTap: () => showAddBookModal(context),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkHighlight
                      : AppColors.lightHighlight,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Icon(
                  Icons.add,
                  color: isDark
                      ? AppColors.darkPrimary
                      : AppColors.lightPrimary,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
