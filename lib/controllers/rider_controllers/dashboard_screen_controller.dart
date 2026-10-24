import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sewnest/presentation/rider_views/orders_screen/rider_orders_screen.dart';
import 'package:sewnest/presentation/rider_views/profile_screen/settings_screen.dart';

class RiderDashboardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    pageController.addListener(
      () {
        int currentPage = pageController.page?.round() ?? 0;
        if (pageIndex.value != currentPage) {
          pageIndex.value = currentPage;
        }
      },
    );
  }

  var pageIndex = 0.obs;
  final PageController pageController = PageController();

  final List<Widget> screens = [

    RiderOrdersView(),
    RiderSettingsScreen(),
  ];

  void setPage(int index) {
    pageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
