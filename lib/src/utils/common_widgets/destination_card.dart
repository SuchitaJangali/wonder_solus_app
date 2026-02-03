import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wonder_souls/src/utils/common_widgets/saved_icon.dart';
import 'package:wonder_souls/src/utils/common_widgets/size.dart';
import 'package:wonder_souls/src/utils/extensions/context_colors.dart';
import 'package:wonder_souls/src/utils/extensions/context_text.dart';

class DestinationCard extends StatelessWidget {
  final String imageUrl;
  final String city;
  final String country;
  final String flagEmoji;

  /// NEW
  final double cardWidth;
  final double imageHeight;

  const DestinationCard({
    super.key,
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.flagEmoji,
    // default for Home
    this.cardWidth = 200,
    this.imageHeight = 140, // default for Home
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.text;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: colors.onSurface.withAlpha(25),
      color: context.surface,
      child: SizedBox(
        width: cardWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // IMAGE
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 11,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                      bottom: Radius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: imageHeight,
                      width: double.infinity, // ✅ LIMIT decoded image size
                      memCacheWidth: 800,
                      memCacheHeight: 600,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => Container(
                        height: imageHeight,
                        color: colors.onSurfaceVariant,
                        child: const Icon(Icons.image, size: 40),
                      ),
                    ),
                  ),
                ),
                Positioned(top: 12, right: 12, child: SavedIcon()),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(city, style: textTheme.labelMedium),
                  6.h.height,
                  Row(
                    children: [
                      Text(flagEmoji, style: const TextStyle(fontSize: 16)),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(country, style: textTheme.bodyMedium),
                      ),
                    ],
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
