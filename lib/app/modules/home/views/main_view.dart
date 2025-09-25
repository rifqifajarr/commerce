import 'package:commerce/app/core/resources/themes.dart';
import 'package:commerce/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainView extends GetView<HomeController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          type: BottomNavigationBarType.shifting,
          backgroundColor: colorScheme(context).surface,
          selectedItemColor: colorScheme(context).primary,
          unselectedItemColor: colorScheme(context).secondary,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: "Profile",
            ),
          ],
        );
      }),
    );
  }
}
