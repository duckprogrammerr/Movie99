import 'package:flutter/cupertino.dart';
import 'package:movie99/core/constants/assets_path.dart';
import 'package:movie99/features/categories/categories_screen.dart';
import 'package:movie99/features/favorites/favorites_screen.dart';
import 'package:movie99/features/home/home_screen.dart';
import 'package:movie99/features/trend/trend_screen.dart';

class BottomNavItem {
  final String defaultIcon;
  final String activeIcon;
  final Widget page;
  // final GlobalKey<NavigatorState> navigatorKey;

  BottomNavItem({
    required this.defaultIcon,
    required this.activeIcon,
    required this.page,
    // required this.navigatorKey,
  });
}

final List<BottomNavItem> bottomNavItems = [
  BottomNavItem(
    defaultIcon: AssetsPath.homeOutlinedIcon,
    activeIcon: AssetsPath.homeFilledIcon,
    page: const HomeScreen(),
    // navigatorKey: GlobalKey<NavigatorState>(),
  ),
  BottomNavItem(
    defaultIcon: AssetsPath.trendOutlinedIcon,
    activeIcon: AssetsPath.trendFilledIcon,
    page: const TrendScreen(),
    // navigatorKey: GlobalKey<NavigatorState>(),
  ),
  BottomNavItem(
    defaultIcon: AssetsPath.genresOutlinedIcon,
    activeIcon: AssetsPath.genresFilledIcon,
    page: const CategoriesScreen(),
    // navigatorKey: GlobalKey<NavigatorState>(),
  ),
  BottomNavItem(
    defaultIcon: AssetsPath.favroiteOutlinedIcon,
    activeIcon: AssetsPath.favroiteFilledIcon,
    page: const FavoriteScreen(),
    // navigatorKey: GlobalKey<NavigatorState>(),
  ),
];
