import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wonder_souls/src/config/utils/common_widgets/saved_icon.dart';
import 'package:wonder_souls/src/config/utils/extensions/context_colors.dart';
import 'package:wonder_souls/src/config/utils/extensions/context_text.dart';

class DestinationCard extends StatelessWidget {
  final String imageUrl;
  final String? city;
  final String country;
  final String? flagEmoji;

  const DestinationCard({
    super.key,
    required this.imageUrl,
    this.city,
    required this.country,
    this.flagEmoji,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.text;

    // Image = 55% of the card height, info = rest
    // Card width comes from parent SizedBox — card never sets its own width
    final imageHeight = MediaQuery.of(context).size.height * 0.20;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 4,
      shadowColor: colors.onSurface.withAlpha(25),
      color: context.surface,
      clipBehavior: Clip.antiAlias, // rounds image corners via card clip
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // only as tall as content
        children: [
          // ── IMAGE ──────────────────────────────────────────────
          // SizedBox gives finite height.
          // Stack(fit: expand) pushes finite bounds into CachedNetworkImage.
          // NO explicit width anywhere — width comes from parent SizedBox.
          SizedBox(
            height: imageHeight,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  // no width, no height — Stack handles it
                  placeholder: (_, __) => Container(
                    color: colors.surfaceVariant,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (_, __, ___) => Container(
                    color: colors.surfaceVariant,
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: colors.onSurfaceVariant,
                      size: 36.sp,
                    ),
                  ),
                ),
                Positioned(top: 10.h, right: 10.w, child: SavedIcon()),
              ],
            ),
          ),

          // ── INFO ───────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        city ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text(
                            flagEmoji ?? "",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              country,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall?.copyWith(
                                color: colors.onSurface.withAlpha(160),
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: colors.onSurface.withAlpha(180),
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
