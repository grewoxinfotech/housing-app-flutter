import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../app/constants/size_manager.dart';

class NesticoPeNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<NavigationController>(() => NavigationController());
    NavigationController controller = Get.find();
    TextStyle style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: Get.theme.colorScheme.primary,
    );
    double iconSize = 18;

    return Obx(
      () => Card(
        elevation: 5,
        shadowColor: Get.theme.colorScheme.surface,
        color: Get.theme.colorScheme.surface,
        margin: EdgeInsets.only(
          left: AppMargin.small,
          bottom: AppMargin.small,
          right: AppMargin.small,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.large),
        ),
        child: Container(
          height: kToolbarHeight,
          alignment: Alignment.center,
          child: SalomonBottomBar(
            duration: const Duration(milliseconds: 400),
            unselectedItemColor: Get.theme.colorScheme.onSurface.withOpacity(
              0.7,
            ),
            margin: const EdgeInsets.all(AppPadding.small),
            itemShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.large),
            ),
            itemPadding: EdgeInsets.all(AppPadding.small),
            currentIndex: controller.currentIndex.value,
            onTap: (i) => controller.changeIndex(i),
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home, size: iconSize),
                title: Text("Home", style: style),
              ),

              SalomonBottomBarItem(
                icon: Icon(Icons.explore, size: iconSize),
                title: Text("Explore", style: style),
              ),

              SalomonBottomBarItem(
                icon: Icon(FontAwesomeIcons.heart, size: iconSize),
                title: Text("Wishlist", style: style),
              ),

              SalomonBottomBarItem(
                icon: Icon(FontAwesomeIcons.message, size: iconSize),
                title: Text("Message", style: style),
              ),

              SalomonBottomBarItem(
                icon: Icon(FontAwesomeIcons.user, size: iconSize),
                title: Text("Profile", style: style),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  changeIndex(int i) => currentIndex(i);
}
