import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liremoi/core/theme/cubit.dart';
import 'package:liremoi/core/theme/style.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool center;
  final IconData? icon;
  final Color? iconColor;
  final bool withDivider;
  final EdgeInsetsGeometry padding;

  const AppHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.center = false,
    this.icon,
    this.iconColor,
    this.withDivider = true,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
  });

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final isDark = themeCubit.state == ThemeMode.dark;

    final titleStyle = isDark
        ? AppTypography.darkTitleLarge.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.75,
          )
        : AppTypography.lightTitleLarge.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.75,
          );

    final subtitleStyle = isDark
        ? AppTypography.darkBodySmall.copyWith(
            color: AppColors.darkAccent.withAlpha(180),
          )
        : AppTypography.lightBodySmall.copyWith(
            color: AppColors.lightAccent.withAlpha(150),
          );

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: center
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        iconColor?.withAlpha(40) ??
                        (isDark
                            ? AppColors.darkHighlight.withAlpha(40)
                            : AppColors.lightHighlight.withAlpha(40)),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color:
                        iconColor ??
                        (isDark
                            ? AppColors.darkHighlight
                            : AppColors.lightHighlight),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Text(
                  title,
                  style: titleStyle,
                  textAlign: center ? TextAlign.center : TextAlign.start,
                ),
              ),
              GestureDetector(
                onTap: () => themeCubit.toggle(),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark
                        ? AppColors.darkHighlight
                        : AppColors.lightHighlight,
                  ),
                  child: Icon(
                    isDark ? Icons.nightlight_round : Icons.wb_sunny,
                    size: 20,
                    color: isDark
                        ? AppColors.darkPrimary
                        : AppColors.lightPrimary,
                  ),
                ),
              ),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: subtitleStyle,
              textAlign: center ? TextAlign.center : TextAlign.start,
            ),
          ],
          if (withDivider) ...[
            const SizedBox(height: 12),
            Container(
              height: 1,
              color: isDark
                  ? AppColors.darkAccent.withAlpha(60)
                  : AppColors.lightAccent.withAlpha(60),
            ),
          ],
        ],
      ),
    );
  }
}
