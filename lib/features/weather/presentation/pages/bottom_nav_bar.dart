import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:smart_living/core/consts/consts.dart';
import 'package:smart_living/core/theme/theme.dart';
import 'package:smart_living/features/weather/presentation/pages/home_page.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      Container(),
      Container(),
      Container(),
      Container(),
      const HomePage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(ThemeData theme) {
    final activeColor = theme.orange;
    final inactiveColor = theme.textBlack.withOpacity(0.5);
    return [
      PersistentBottomNavBarItem(
        icon: _customIcon(
          title: 'Home',
          path: SvgAssets.bottomHome,
          height: 23.76,
          width: 24.19,
          color: activeColor,
          theme: theme,
        ),
        inactiveIcon: _customIcon(
          title: 'Home',
          path: SvgAssets.bottomHome,
          height: 23.76,
          width: 24.19,
          color: inactiveColor,
          theme: theme,
        ),
        activeColorPrimary: theme.orange,
        inactiveColorPrimary: theme.textBlack.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: _customIcon(
          title: 'Lifestyle',
          path: SvgAssets.lifeStyle,
          height: 27.8,
          width: 21.17,
          color: activeColor,
          theme: theme,
        ),
        inactiveIcon: _customIcon(
          title: 'Lifestyle',
          path: SvgAssets.lifeStyle,
          height: 27.8,
          width: 21.17,
          color: inactiveColor,
          theme: theme,
        ),
        activeColorPrimary: theme.orange,
        inactiveColorPrimary: theme.textBlack.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: _customIcon(
          title: 'Devices',
          path: SvgAssets.devices,
          height: 19.95,
          width: 25.71,
          color: activeColor,
          theme: theme,
        ),
        inactiveIcon: _customIcon(
          title: 'Devices',
          path: SvgAssets.devices,
          height: 19.95,
          width: 25.71,
          color: inactiveColor,
          theme: theme,
        ),
        activeColorPrimary: theme.orange,
        inactiveColorPrimary: theme.textBlack.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: _customIcon(
          title: 'Maps',
          path: SvgAssets.maps,
          height: 27.65,
          width: 20.16,
          color: activeColor,
          theme: theme,
        ),
        inactiveIcon: _customIcon(
          title: 'Maps',
          path: SvgAssets.maps,
          height: 27.65,
          width: 20.16,
          color: inactiveColor,
          theme: theme,
        ),
        activeColorPrimary: theme.orange,
        inactiveColorPrimary: theme.textBlack.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: _customIcon(
          title: 'Smart Living',
          path: SvgAssets.smart,
          height: 32,
          width: 32.26,
          color: activeColor,
          theme: theme,
        ),
        inactiveIcon: _customIcon(
          title: 'Smart Living',
          path: SvgAssets.smart,
          height: 32,
          width: 32.26,
          color: inactiveColor,
          theme: theme,
        ),
        activeColorPrimary: theme.orange,
        inactiveColorPrimary: theme.textBlack.withOpacity(0.5),
      ),
    ];
  }

  Widget _customIcon({
    required ThemeData theme,
    required double height,
    required double width,
    required Color color,
    required String title,
    required String path,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 38,
          child: SvgPicture.asset(
            path,
            color: color,
            height: height,
            width: width,
          ),
        ),
        Text(
          title,
          style: theme.extralSmallBody.copyWith(color: color),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(theme),
      backgroundColor: theme.white,
      navBarHeight: 65,
      popAllScreensOnTapOfSelectedTab: true,
      confineInSafeArea: true,
      margin: EdgeInsets.zero,
      padding: const NavBarPadding.all(0),
      popActionScreens: PopActionScreensType.all,
      bottomScreenMargin: 0,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          backgroundColor: theme.orange,
          onPressed: () {},
          child: SvgPicture.asset(
            SvgAssets.add,
            width: 22,
            height: 22,
          ),
        ),
      ),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
