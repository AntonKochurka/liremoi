import 'package:flutter/material.dart';
import 'package:liremoi/core/style.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool center;
  final IconData? icon;
  final Color? iconColor;
  final bool withDivider;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onThemeToggle;

  const AppHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.center = false,
    this.icon,
    this.iconColor,
    this.withDivider = true,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
    this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
            mainAxisAlignment: center
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: center
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
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
                  Flexible(
                    child: Text(
                      title,
                      style: titleStyle,
                      textAlign: center ? TextAlign.center : TextAlign.start,
                    ),
                  ),
                ],
              ),
              if (onThemeToggle != null && !center) ...[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 60,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: isDark
                          ? [Color(0xFF2D2D2D), Color(0xFF404040)]
                          : [Color(0xFFE5E5E5), Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        left: isDark ? 30 : 2,
                        top: 2,
                        child: GestureDetector(
                          onTap: onThemeToggle,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: isDark
                                    ? [Color(0xFF90A4AE), Color(0xFF607D8B)]
                                    : [
                                        AppColors.lightHighlight,
                                        Color(0xFFFFA726),
                                      ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              isDark ? Icons.nightlight_round : Icons.wb_sunny,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 9,
                        child: Icon(
                          Icons.wb_sunny,
                          size: 14,
                          color: isDark
                              ? AppColors.darkAccent.withAlpha(120)
                              : AppColors.lightHighlight,
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 9,
                        child: Icon(
                          Icons.nightlight_round,
                          size: 14,
                          color: isDark
                              ? AppColors.darkSecondary
                              : AppColors.lightAccent.withAlpha(120),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Text(
                subtitle!,
                style: subtitleStyle,
                textAlign: center ? TextAlign.center : TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          if (withDivider) ...[
            const SizedBox(height: 12),
            Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    (isDark
                        ? AppColors.darkAccent.withAlpha(60)
                        : AppColors.lightAccent.withAlpha(60)),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
