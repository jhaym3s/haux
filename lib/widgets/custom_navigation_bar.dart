import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haux/screens/screens.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class CustomNavigationBar extends StatefulWidget {
  static const routeName = "cusstomNavigationBar";
  const CustomNavigationBar({ Key? key }) : super(key: key);
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late PersistentTabController _pageController;
  List<Widget> _children() {
    return [
      const HomeScreen(),
      const FavouriteScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Colors.purple,
        inactiveColorPrimary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.doc_chart),
        title: ("Result"),
        activeColorPrimary:Colors.purple,
        inactiveColorPrimary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.book),
        title: ("Learning"),
        activeColorPrimary: Colors.purple,
        inactiveColorPrimary:Colors.purple,
      ),
     
    ];
  }

  //List<Map<Object, Object>> pages;
  //int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
     // selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pageController = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: PersistentTabView(
        context,
        controller: _pageController,
        screens: _children(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.purple, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: const NavBarDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
    
        popActionScreens: PopActionScreensType.once,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarHeight: 11,
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }
}
