import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/models/tailor_model.dart';
import '../../../controllers/tailer_controllers/dashboard_screen_controller.dart';
import '../../../utilis/app_images.dart';
import '../../../utilis/styles/customColors.dart';

class TailorDashboardScreen extends StatelessWidget {
  final TailorModel tailor;

  TailorDashboardScreen({required this.tailor, Key? key})
      : dashboardController = TailorDashboardController(tailor), // Initialize controller
        super(key: key);

  final TailorDashboardController dashboardController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            selectedItemColor: CustomColors.secondaryColor,
            unselectedItemColor: CustomColors.inactiveColor,
            currentIndex: dashboardController.pageIndex.value,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            onTap: (value) {
              dashboardController.setPage(value);
            },
            items: [
              _barItem(AppImages.cart, "Orders", 0, dashboardController),
              _barItem(AppImages.chat, "Chat", 1, dashboardController),
              _barItem(AppImages.setting, "Settings", 2, dashboardController),
            ]),
      ),
      body: PageView.builder(
          controller: dashboardController.pageController,
          itemCount: dashboardController.screens.length,
          itemBuilder: (context, index){
          return dashboardController.screens[index];
      }),
    );
  }

  BottomNavigationBarItem _barItem(
      String image, String label, int index, TailorDashboardController controller) {
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
