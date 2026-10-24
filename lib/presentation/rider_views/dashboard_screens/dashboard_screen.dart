import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/controllers/rider_controllers/dashboard_screen_controller.dart';
import '../../../utilis/app_images.dart';
import '../../../utilis/styles/customColors.dart';

class RiderDashboardScreen extends StatelessWidget {
  RiderDashboardScreen({super.key});

  final RiderDashboardController dashboardController = Get.put(RiderDashboardController());

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
              _barItem(AppImages.setting, "Settings", 1, dashboardController),
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
      String image, String label, int index, RiderDashboardController controller) {
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
