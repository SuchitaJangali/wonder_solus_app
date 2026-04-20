import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wonder_souls/src/config/core/injector/injector.dart';
import 'package:wonder_souls/src/config/core/logger/app_logger.dart';
import 'package:wonder_souls/src/config/utils/common_widgets/shimmer_box.dart';
import 'package:wonder_souls/src/features/home/presentation/cubit/search/search_cubit.dart';
import 'package:wonder_souls/src/features/home/presentation/cubit/trips/get_trips_cubit.dart';
import 'package:wonder_souls/src/features/trips/model/static_data.dart';
import 'package:wonder_souls/src/features/trips/presentation/screens/list_article.dart';
import 'package:wonder_souls/src/features/trips/presentation/screens/list_destination.dart';
import 'package:wonder_souls/src/features/trips/presentation/screens/trip_details_screen.dart';
import 'package:wonder_souls/src/config/utils/common_widgets/article_card.dart';
import 'package:wonder_souls/src/config/utils/common_widgets/destination_card.dart';
import 'package:wonder_souls/src/config/utils/common_widgets/size.dart';
import 'package:wonder_souls/src/config/utils/extensions/context_colors.dart';
import 'package:wonder_souls/src/config/utils/extensions/context_text.dart';

import '../../../auth/domain/enitiy/trip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Card width = 55% of screen — good on small, medium, and large phones
    final cardWidth = MediaQuery.of(context).size.width * 0.55;

    return BlocProvider(
      create: (_) => SearchCubit(sl()),
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔍 Search Bar
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        shadowColor: context.softShadow,
                        child: InkWell(
                          onTap: () {
                            log.i("search tapped: ${searchController.text}");
                            context.read<SearchCubit>().onQueryChanged(
                              searchController.text,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 10.h,
                            ),
                            child: Row(
                              spacing: 12.w,
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 24,
                                  color: context.onSurfaceVariant,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: searchController,
                                    decoration: const InputDecoration(
                                      hintText: "Search destinations...",
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      context
                                          .read<SearchCubit>()
                                          .onQueryChanged(value);
                                    },
                                    style: context.bodyMuted?.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      22.h.height,

                      // ── Popular Trips ──────────────────────────────────
                      _SectionHeader(
                        title: 'Popular Trips',
                        onViewAll: () => Navigator.pushNamed(
                          context,
                          ListDestination.routeName,
                        ),
                      ),
                      16.h.height,

                      BlocBuilder<GetTripsCubit, GetTripsState>(
                        builder: (context, state) {
                          if (state is GetTripsLoading) {
                            return SizedBox(
                              height: cardWidth * 1.2,
                              child: ShimmerBox(
                                width: cardWidth * 1.2,
                                height: cardWidth * 1.2,
                              ),
                            );
                          }
                          if (state is GetTripsError) {
                            return SizedBox(
                              height: cardWidth * 1.2,
                              child: Center(child: Text(state.errorMessge)),
                            );
                          }
                          if (state is GetTripsLoaded) {
                            final listHeight = cardWidth * 1.35;

                            return SizedBox(
                              height: listHeight,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.trips.length,
                                shrinkWrap: true,
                                separatorBuilder: (_, __) =>
                                    SizedBox(width: 8.w),
                                itemBuilder: (context, index) {
                                  final d = state.trips[index];
                                  return SizedBox(
                                    width: cardWidth,
                                    // ✅ THIS gives the card a finite width
                                    child: InkWell(
                                      // onTap: () => onTap(d),
                                      borderRadius: BorderRadius.circular(16.r),
                                      child: DestinationCard(
                                        imageUrl: d.coverImage,
                                        // city: d.destinations.,
                                        country: d.destinations.first.country,
                                        // flagEmoji: ,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                          return 0.w.width;
                        },
                      ),

                      24.h.height,

                      // ── Popular Destinations ───────────────────────────
                      _SectionHeader(
                        title: 'Popular Destinations',
                        onViewAll: () => Navigator.pushNamed(
                          context,
                          ListDestination.routeName,
                        ),
                      ),
                      16.h.height,

                      _HorizontalCardList(
                        cardWidth: cardWidth,
                        items: destinations,
                        onTap: (d) => Navigator.pushNamed(
                          context,
                          TripDetailsScreen.routeName,
                          arguments: Trip,
                        ),
                      ),

                      24.h.height,

                      // ── Popular Articles ───────────────────────────────
                      _SectionHeader(
                        title: 'Popular Articles',
                        onViewAll: () =>
                            Navigator.pushNamed(context, ListArticle.routeName),
                      ),
                      16.h.height,

                      SizedBox(
                        height: 220.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: articles.length,
                          shrinkWrap: true,
                          separatorBuilder: (_, __) => SizedBox(width: 8.w),
                          itemBuilder: (context, index) {
                            final article = articles[index];
                            return SizedBox(
                              width: cardWidth, // ✅ fixed width
                              child: ArticleCard(
                                imageUrl: article['imageUrl']!,
                                title: article['title']!,
                                date: article['date']!,
                              ),
                            );
                          },
                        ),
                      ),

                      24.h.height,
                    ],
                  ),
                ),
              ),

              // 🔍 Search overlay
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) => _buildOverlay(context, state),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ── Horizontal card list ───────────────────────────────────────────────────────
class _HorizontalCardList extends StatelessWidget {
  final double cardWidth;
  final List<Map<String, String>> items;
  final void Function(Map<String, String>) onTap;

  const _HorizontalCardList({
    required this.cardWidth,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // List height = card width * ratio so it's proportional on all screens
    final listHeight = cardWidth * 1.35;

    return SizedBox(
      height: listHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        shrinkWrap: true,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final d = items[index];
          return SizedBox(
            width: cardWidth, // ✅ THIS gives the card a finite width
            child: InkWell(
              onTap: () => onTap(d),
              borderRadius: BorderRadius.circular(16.r),
              child: DestinationCard(
                imageUrl: d['imageUrl']!,
                city: d['city']!,
                country: d['country']!,
                flagEmoji: d['flagEmoji']!,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ── Section header ─────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const _SectionHeader({required this.title, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.titleLarge?.copyWith(fontSize: 20)),
        InkWell(
          onTap: onViewAll,
          child: Row(
            children: [
              Text('View All', style: context.primaryLabel),
              4.w.width,
              Icon(Icons.arrow_forward, color: context.primary, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Search overlay ─────────────────────────────────────────────────────────────
Widget _buildOverlay(BuildContext context, SearchState state) {
  return Positioned(
    top: 80,
    left: 20,
    right: 20,
    child: Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 300),
        child: state is SearchActive
            ? const Padding(
                padding: EdgeInsets.all(20),
                child: Center(child: CircularProgressIndicator()),
              )
            : state is SearchLoaded
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: state.places.length,
                itemBuilder: (context, index) {
                  final place = state.places[index];
                  return ListTile(
                    title: Text(place.description ?? ""),
                    onTap: () => context.read<SearchCubit>().closeSearch(),
                  );
                },
              )
            : const SizedBox.shrink(),
      ),
    ),
  );
}
