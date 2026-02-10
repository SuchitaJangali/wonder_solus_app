import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wonder_souls/src/features/trips/presentstion/screens/my_trips_screen.dart';
import 'package:wonder_souls/src/utils/extensions/context_colors.dart';
import 'package:wonder_souls/src/utils/extensions/context_text.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key, required this.trip});
  final TripData trip;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rounded top corners
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.sp),
                child: CachedNetworkImage(
                  imageUrl: trip.imageUrl,
                  height: 170.h, // ✅ LIMIT decoded image size
 
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) => Container(
                    height: 140.h,
                    color: context.colors.surface.withAlpha(20),
                    child: const Icon(Icons.image, size: 40),
                  ),
                ),
              ),
            ],
          ),

          // Trip details
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            trip.name,
                            style: context.text.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(trip.flag, style: TextStyle(fontSize: 20.sp)),
                        ],
                      ),
                    ),
                    // Three dots menu
                    Icon(
                      Icons.more_vert,
                      color: context.onSurface.withAlpha(153),
                      size: 24.sp,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  '${trip.dateRange} · ${trip.tripType} · ${trip.category}',
                  style: context.text.bodyMedium?.copyWith(
                    color: context.onSurface.withAlpha(153),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
