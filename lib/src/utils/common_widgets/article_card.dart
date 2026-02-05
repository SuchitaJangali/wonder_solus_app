import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wonder_souls/src/utils/common_widgets/size.dart';
import 'package:wonder_souls/src/utils/extensions/context_colors.dart';
import 'package:wonder_souls/src/utils/extensions/context_text.dart';

class ArticleCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;

  const ArticleCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: context.onSurface.withAlpha(25),
      color: context.surface,
      child: SizedBox(
        width: 200.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            AspectRatio(
              aspectRatio: 16 / 12,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover, // ✅ LIMIT decoded image size
                  memCacheWidth: 800,
                  memCacheHeight: 600,
                  errorWidget: (_, __, ___) => Container(
                    color: context.colors.surface.withAlpha(20),
                    child: Icon(
                      Icons.image,
                      color: context.colors.onSurface.withAlpha(40),
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        6.h.height,
                        Text(date, style: context.text.labelSmall),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: context.onSurface,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
