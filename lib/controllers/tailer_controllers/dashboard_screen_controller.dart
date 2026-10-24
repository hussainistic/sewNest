import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sewnest/models/tailor_model.dart';
import 'package:sewnest/presentation/tailer_views/chat_screen/tailor_chat_screen.dart';
import 'package:sewnest/presentation/tailer_views/orders_screen/tailer_orders_screen.dart';
import '../../presentation/tailer_views/profile_screen/settings_screen.dart';

class TailorDashboardController extends GetxController {

  var pageIndex = 0.obs;
  final PageController pageController = PageController();
  late List<Widget> screens;

  TailorDashboardController(TailorModel tailor) {
    screens = [
      TailorOrdersView(),
      TailorChatScreen(),
      TailorSettingsScreen(tailorId: tailor.id),
    ];
  }
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

  void setPage(int index) {
    pageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
