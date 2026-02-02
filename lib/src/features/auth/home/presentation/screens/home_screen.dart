import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wonder_souls/src/utils/common_widgets/article_card.dart';
import 'package:wonder_souls/src/utils/common_widgets/property_card.dart';
import 'package:wonder_souls/src/utils/common_widgets/size.dart';
import 'package:wonder_souls/src/utils/common_widgets/text_styles.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  // Static data for destinations
  static final List<Map<String, String>> destinations = [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=400',
      'city': 'Tokyo, Tokyo',
      'country': 'Japan',
      'flagEmoji': '🇯🇵',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=400',
      'city': 'Paris, Paris',
      'country': 'France',
      'flagEmoji': '🇫🇷',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=400',
      'city': 'London, London',
      'country': 'United Kingdom',
      'flagEmoji': '🇬🇧',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1523906834658-6e24ef2386f9?w=400',
      'city': 'New York, New York',
      'country': 'United States',
      'flagEmoji': '🇺🇸',
    },
  ];

  // Static data for articles
  static final List<Map<String, String>> articles = [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=400',
      'title': 'Hidden Gems: Uncovering Secret Destinations',
      'date': 'Dec 05, 2023',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=400',
      'title': 'Packing Hacks: Travel Light, Travel Smart',
      'date': 'Dec 06, 2023',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=400',
      'title': 'Budget Travel: Explore More, Spend Less',
      'date': 'Dec 07, 2023',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=400',
      'title': 'Best Photography Spots Around the World',
      'date': 'Dec 08, 2023',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2DD4A3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.eco, color: Colors.white),
          ),
        ),
        title: SafeArea(
          child: Text(
            'WonderSouls',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(
                    20,
                  ), // theme-aware background
                  elevation: 2,
                  shadowColor: Theme.of(
                    context,
                  ).colorScheme.onSurface.withAlpha(25),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 24,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurfaceVariant, // theme-aware icon
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Search destinations...',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey[200]),

                          // style: Theme.of(context).textTheme.bodyMedium
                          //     ?.copyWith(
                          //       color: Theme.of(
                          //         context,
                          //       ).colorScheme.onSurfaceVariant,
                          //       fontWeight: FontWeight.w400,
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
                22.h.height,

                // Popular Destinations Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Destinations',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Row(
                      children: [
                        Text(
                          'View All',
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).colorScheme.primary,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                16.h.height,

                // Destinations List
                SizedBox(
                  height: 180.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: destinations.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final destination = destinations[index];
                      return PropertyCard(
                        imageUrl: destination['imageUrl']!,
                        city: destination['city']!,
                        country: destination['country']!,
                        flagEmoji: destination['flagEmoji']!,
                      );
                    },
                  ),
                ),
                // 10.h.height,

                // Popular Articles Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Articles',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'View All',
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        4.w.width,
                        Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).colorScheme.primary,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Articles List
                SizedBox(
                  height: 180.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: articles.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: const Color(0xFF2DD4A3),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'My Trips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
