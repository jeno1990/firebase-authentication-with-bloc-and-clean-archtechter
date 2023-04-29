import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:interns_blog/features/auth/domain/entities/user_entity.dart';
import 'package:interns_blog/features/blog/presentation/pages/blog_add_page.dart';
import 'package:interns_blog/features/blog/presentation/pages/payment_page.dart';

import '../../features/blog/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile.dart';
import '../drawer/menu_item_model.dart';
import '../drawer/menu_page.dart';

class App extends StatefulWidget {
  const App({super.key, required this.user});
  final UserModel user;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  MenuItem currentItem = MenuItems.homePage;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      // style: DrawerStyle.style4,
      borderRadius: 20,
      showShadow: true,
      angle: -10,
      menuBackgroundColor: const Color.fromARGB(255, 117, 153, 231),

      slideWidth: MediaQuery.of(context).size.width * 0.70,
      drawerShadowsBackgroundColor: Colors.orange,
      mainScreen: getScreen(),
      mainScreenTapClose: true,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.easeInOut,
      menuScreen: Builder(builder: (context) {
        return MenuPage(
            user: widget.user,
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
                ZoomDrawer.of(context)!.close();
              });
            });
      }),
      // angle: -10,
      // showShadow: true,
    );
  }

  Widget getScreen() {
    if (currentItem == MenuItems.homePage) {
      return const HomePage();
    } else if (currentItem == MenuItems.profile) {
      return const ProfilePage();
    } else if (currentItem == MenuItems.payment) {
      return const Payment();
    } else if (currentItem == MenuItems.blogAdd) {
      return const AddBlogPage();
    } else {
      return Container();
    }
  }
}
