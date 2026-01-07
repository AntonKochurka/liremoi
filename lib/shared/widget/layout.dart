import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liremoi/app/router/router_cubit.dart';
import 'package:liremoi/core/style.dart';

class AppLayout extends StatelessWidget {
  final Widget child;

  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentIndex = context.select(
      (RouterCubit c) => getIndex(c.state) - 1,
    );

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              offset: const Offset(0, -1),
              blurRadius: 4,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => context.read<RouterCubit>().toIndex(index + 1),
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: isDark
              ? AppColors.darkHighlight
              : AppColors.lightHighlight,
          unselectedItemColor: isDark
              ? AppColors.darkAccent
              : AppColors.lightAccent,
          selectedLabelStyle: const TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chrome_reader_mode),
              label: 'Reader',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
