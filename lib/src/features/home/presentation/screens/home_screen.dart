import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wonder_souls/src/features/trips/model/static_data.dart';
import 'package:wonder_souls/src/utils/common_widgets/article_card.dart';
import 'package:wonder_souls/src/utils/common_widgets/destination_card.dart';
import 'package:wonder_souls/src/utils/common_widgets/size.dart';
import 'package:wonder_souls/src/utils/extensions/context_colors.dart';
import 'package:wonder_souls/src/utils/extensions/context_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ---------------- UI ----------------

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              color: context.surface.withAlpha(25),
              elevation: 2,
              shadowColor: context.softShadow,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 24,
                      color: context.onSurfaceVariant,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Search destinations...',
                      style: context.bodyMuted?.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            22.h.height,

            // 📍 Popular Destinations
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Destinations', style: context.titleLarge),
                Row(
                  children: [
                    Text('View All', style: context.primaryLabel),
                    4.w.width,
                    Icon(Icons.arrow_forward, color: context.primary, size: 20),
                  ],
                ),
              ],
            ),

            16.h.height,

            AspectRatio(
              aspectRatio: 4 / 3,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                shrinkWrap: true,
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  final d = destinations[index];
                  return DestinationCard(
                    imageUrl: d['imageUrl']!,
                    city: d['city']!,
                    country: d['country']!,
                    flagEmoji: d['flagEmoji']!,
                    cardWidth: 200.w,
                    // compact
                  );
                },
              ),
            ),
            24.h.height,

            // 📰 Popular Articles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Articles', style: context.titleLarge),
                Row(
                  children: [
                    Text('View All', style: context.primaryLabel),
                    4.w.width,
                    Icon(Icons.arrow_forward, color: context.primary, size: 20),
                  ],
                ),
              ],
            ),

            16.h.height,

            AspectRatio(
              aspectRatio: 4 / 3,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: articles.length,
                shrinkWrap: true,
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ArticleCard(
                    imageUrl: article['imageUrl']!,
                    title: article['title']!,
                    date: article['date']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- OTHER SCREENS ----------------
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings'));
  }
}
