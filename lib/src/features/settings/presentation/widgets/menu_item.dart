import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wonder_souls/src/config/utils/common_widgets/size.dart';
import 'package:wonder_souls/src/config/utils/extensions/context_colors.dart';
import 'package:wonder_souls/src/config/utils/extensions/context_text.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? titleColor;
  final Color? iconColor;
  final bool showArrow;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.titleColor,
    this.iconColor,
    this.showArrow = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        color: context.colors.surface,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 4.w),
        child: Row(
          children: [
            Icon(
              icon,
              size: 28.sp,
              color: iconColor ?? context.colors.onSurfaceVariant,
            ),
            16.w.width,
            Expanded(
              child: Text(
                title,
                style: context.text.titleSmall?.copyWith(color: titleColor),
              ),
            ),
            if (showArrow)
              Icon(
                Icons.chevron_right,
                size: 24,
                color: iconColor ?? context.colors.onSurfaceVariant,
              ),
          ],
        ),
      ),
    );
  }
}
