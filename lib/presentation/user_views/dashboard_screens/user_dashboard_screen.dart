import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/models/user_model.dart';
import '../../../controllers/user_controllers/user_dashboard_screen_controller.dart';
import '../../../utilis/app_images.dart';
import '../../../utilis/styles/customColors.dart';

class UserDashboardScreen extends StatelessWidget {
  final UserModel user;

  UserDashboardScreen({required this.user, Key? key})
      : userDashboardController = UserDashboardController(user), // Initialize controller
        super(key: key);

  final UserDashboardController userDashboardController;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            selectedItemColor: CustomColors.secondaryColor,
            unselectedItemColor: CustomColors.inactiveColor,
            currentIndex: userDashboardController.pageIndex.value,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            onTap: (value) {
              userDashboardController.setPage(value);
            },
            items: [
              _barItem(AppImages.home, "Home", 0, userDashboardController),
              _barItem(AppImages.cart, "Orders", 1, userDashboardController),
              _barItem(AppImages.chat, "Chat", 2, userDashboardController),
              _barItem(AppImages.setting, "Settings", 3, userDashboardController),
              _barItem(AppImages.rider, "Rider", 4, userDashboardController),
            ]),
      ),
      body: PageView(
          controller: userDashboardController.pageController,
          children: userDashboardController.screens,
      ),
    );
  }

  BottomNavigationBarItem _barItem(
      String image, String label, int index, UserDashboardController controller) {
    return BottomNavigationBarItem(
        icon: Obx(
          () => SizedBox(
            width: 20,
            child: Image.asset(image,
                color: index == controller.pageIndex.value
                    ? CustomColors.secondaryColor
                    : CustomColors.inactiveColor),
          ),
        ),
        label: label);
  }
}
