import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Screens
import 'package:wonder_souls/src/features/home/presentation/screens/home_screen.dart';
import 'package:wonder_souls/src/features/trips/presentstion/screens/my_trips_screen.dart';
import 'package:wonder_souls/src/features/trips/presentstion/screens/saved_trips_screen.dart';
import 'package:wonder_souls/src/utils/common_widgets/size.dart';
import 'package:wonder_souls/src/utils/extensions/context_colors.dart';
import 'package:wonder_souls/src/utils/extensions/context_text.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({super.key});

  static const String routeName = "/HomeBottomBar";
  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  final List<String> _titles = ['WonderSolus', 'Saved', 'My Trips', 'Settings'];
  final List<Widget> _pages = [
    const HomeScreen(),
    const SavedTripsScreen(),
    const MyTripsScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _titles.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Fixed AppBar, title changes with tab
      appBar: AppBar(
        centerTitle: true,

        leadingWidth: 56,

        title: AnimatedBuilder(
          animation: _tabController,
          builder: (context, _) => SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Icon(Icons.eco, color: context.onPrimary),
                  ),
                ),
                Text(
                  _titles[_tabController.index],
                  style: context.text.titleLarge,
                ),
                30.w.width,
              ],
            ),
          ),
        ),
      ),

      // ✅ Body: TabBarView takes full height
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),

      // ✅ Bottom TabBar
      bottomNavigationBar: Material(
        color: context.surface,
        child: SafeArea(
          child: TabBar(
            dividerColor: Colors.transparent,
            controller: _tabController,
            labelColor: context.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: context.primary,
            tabs: const [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.bookmark_border), text: 'Saved'),
              Tab(icon: Icon(Icons.location_on_outlined), text: 'My Trips'),
              Tab(icon: Icon(Icons.settings_outlined), text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("settings");
  }
}
