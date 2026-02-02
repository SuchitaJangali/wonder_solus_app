import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String city;
  final String country;
  final String flagEmoji;

  const PropertyCard({
    super.key,
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.flagEmoji,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: colors.onSurface.withAlpha(
        25,
      ), // instead of withOpacity(0.1)
      color: colors.surfaceVariant, // theme-aware background
      child: SizedBox(
        width: 200.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 200.w,
                    height: 140.w,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return Container(
                        width: 200.w,
                        height: 140.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color:
                              colors.surfaceVariant, // theme-aware placeholder
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: colors.primary, // theme-aware
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        width: 200.w,
                        height: 140.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              colors.primary.withAlpha(128), // 50% alpha
                              colors.secondary.withAlpha(128), // 50% alpha
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: colors.surface, // small theme-aware card for icon
                    elevation: 2,
                    shadowColor: colors.onSurface.withAlpha(25),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.bookmark_border,
                        size: 20,
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(city, style: textTheme.labelMedium)),
                Icon(Icons.more_vert, size: 20, color: colors.onSurface),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  flagEmoji,
                  style: TextStyle(fontSize: 16, color: colors.onSurface),
                ),
                const SizedBox(width: 8),
                Expanded(child: Text(country, style: textTheme.bodyMedium)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
