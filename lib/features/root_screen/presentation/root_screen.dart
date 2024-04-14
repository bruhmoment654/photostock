import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photos/presentation/screens/photo_fav/photo_fav_flow.dart';
import 'package:photostock/features/photos/presentation/screens/photo_list/photo_list_flow.dart';
import 'package:photostock/features/settings/presentation/settings_flow.dart';
import 'package:photostock/l10n/app_localizations_x.dart';

@RoutePage()
class RootScreenFlow extends StatefulWidget {
  const RootScreenFlow({super.key});

  @override
  State<RootScreenFlow> createState() => _RootScreenFlowState();
}

class _RootScreenFlowState extends State<RootScreenFlow> {
  late final PageController _controller;
  late final List<Widget> _screens;

  int _currentIndex = 0;

  @override
  void initState() {
    _controller = PageController();

    _screens = [
      const PhotoListFlow().wrappedRoute(context),
      const PhotoFavFlow().wrappedRoute(context),
      const SettingsFlow().wrappedRoute(context)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              label: l10n.bottomNavBarHomeButtonText,
              icon: IconButton(
                  onPressed: () => _goTo(0), icon: const Icon(Icons.public))),
          BottomNavigationBarItem(
              label: l10n.bottomNavBarFavouriteButtonText,
              icon: IconButton(
                  onPressed: () => _goTo(1), icon: const Icon(Icons.home))),
          BottomNavigationBarItem(
              label: l10n.bottomNavBarSettingsButtonText,
              icon: IconButton(
                  onPressed: () => _goTo(2), icon: const Icon(Icons.settings))),
        ],
      ),
      body: PageView(
        onPageChanged: (index) => setState(() {
          _currentIndex = index;
        }),
        controller: _controller,
        children: _screens,
      ),
    );
  }

  void _goTo(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }
}
