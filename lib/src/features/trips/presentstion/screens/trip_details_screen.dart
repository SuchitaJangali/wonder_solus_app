import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wonder_souls/src/features/trips/model/trip.dart';
import 'package:wonder_souls/src/utils/common_widgets/size.dart';
import 'package:wonder_souls/src/utils/extensions/context_colors.dart';
import 'package:wonder_souls/src/utils/extensions/context_text.dart';

class TripDetailsScreen extends StatefulWidget {
  Trip? trip;
  static const String routeName = "/TripDetailsScreen";

  TripDetailsScreen({super.key, required this.trip});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.trip = sampleTrip;
  }

  @override
  Widget build(BuildContext context) {
    print("Staa");
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildTripHeader(context),
                SizedBox(height: 70.h, child: _buildTabs(context)),
                _buildPlacesList(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250.h,
      pinned: true,
      backgroundColor: context.surface,

      // // 👇 Title appears ONLY when collapsed
      title: Text(
        widget.trip?.name ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: context.onSurface,
        ),
      ),
      leading: IconButton(
        icon: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.surface,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back,
              size: 24.sp,
              color: context.onSurface,
            ),
          ),
        ),
        onPressed: () => Navigator.pop(context),
      ),

      actions: [
        IconButton(
          icon: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: context.surface,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.share, size: 24.sp, color: context.onSurface),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: context.surface,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.more_vert, size: 24.sp, color: context.primary),
          ),
          onPressed: () {},
        ),
      ],

      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: widget.trip?.imageUrl ?? '',
              memCacheWidth: 800,
              memCacheHeight: 600,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => Container(
                color: Colors.grey[300],
                child: Icon(Icons.image, size: 64.sp, color: Colors.grey),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripHeader(BuildContext context) {
    return Container(
      color: context.surface,
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.trip?.name ?? "",
                      style: context.titleLarge?.copyWith(fontSize: 20.sp),
                    ),
                    4.h.height,
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16.sp,
                          color: context.onSurface,
                        ),
                        4.w.width,
                        Text(
                          widget.trip?.country ?? "",
                          style: context.bodyMedium?.copyWith(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit_outlined, color: context.primary),
                onPressed: () {},
              ),
            ],
          ),
          16.h.height,
          Container(
            height: 150.h,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map_outlined,
                    size: 48.sp,
                    color: Colors.grey[400],
                  ),
                  8.h.height,
                  Text(
                    'Map View',
                    style: context.text.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> tabs = ['December 16th', 'December 17th', "December 18"];
  Widget _buildTabs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: tabs.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            _buildTab(tabs[index], index == 0, context),
        separatorBuilder: (BuildContext context, int index) => 8.w.width,
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isSelected ? context.colors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isSelected
              ? context.colors.primary
              : context.colors.onSurfaceVariant.withAlpha(150),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : context.colors.onSurfaceVariant,
          fontSize: 13.sp,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildPlacesList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16.w),
      itemCount: widget.trip?.places.length,
      itemBuilder: (context, index) =>
          _buildPlaceCard(widget.trip?.places[index], context),
    );
  }

  Widget _buildPlaceCard(Place? place, BuildContext context) {
    final isRestaurant = place?.category == 'restaurant';
    final icon = isRestaurant ? Icons.restaurant : Icons.attractions;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: CachedNetworkImage(
              imageUrl: place?.imageUrl ?? "",
              height: 160.h, // ✅ LIMIT decoded image size
              memCacheWidth: 800,
              memCacheHeight: 600,
              width: double.infinity,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => Container(
                height: 160.h,
                color: Colors.grey[300],
                child: Icon(Icons.image, size: 64.sp, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 20.sp,
                      color: context.colors.onSurface.withAlpha(20),
                    ),
                    8.w.width,
                    Expanded(
                      child: Text(
                        place?.name ?? "",
                        style: context.text.labelMedium,
                      ),
                    ),
                  ],
                ),
                8.h.height,
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16.sp,
                      color: context.colors.primary,
                    ),
                    4.w.width,
                    Text('${place?.rating}', style: context.text.bodyMedium),
                    4.w.width,
                    Text(
                      '(${place?.reviews} reviews)',
                      style: context.text.labelSmall?.copyWith(),
                    ),
                  ],
                ),
                12.h.height,
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16.sp,
                      color: context.colors.onSurface.withAlpha(25),
                    ),
                    8.w.width,
                    Text(
                      '${place?.openTime} - ${place?.closeTime}',
                      style: context.bodyMedium,
                    ),
                  ],
                ),
                8.h.height,
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      size: 16.sp,
                      color: context.colors.onSurface.withAlpha(25),
                    ),
                    8.w.width,
                    Text(
                      '\$${place?.price.toStringAsFixed(2)}',
                      style: context.bodyMedium,
                    ),
                  ],
                ),
                12.h.height,
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.map,
                        size: 16.sp,
                        color: context.colors.primary,
                      ),
                      8.w.width,
                      Text(
                        'View on Google Maps',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: context.colors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
