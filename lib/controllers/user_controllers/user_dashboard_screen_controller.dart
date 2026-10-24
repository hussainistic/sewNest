import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sewnest/models/user_model.dart';
import 'package:sewnest/presentation/user_views/chat_screen/user_chat_screen.dart';
import 'package:sewnest/presentation/user_views/profile_screen/user_settings_screen.dart';
import 'package:sewnest/presentation/user_views/orders_screen/user_orders_screen.dart';
import 'package:sewnest/presentation/user_views/home_screen/user_home_screen.dart';
import '../../presentation/user_views/rider_screen/user_rider_screen.dart';

class UserDashboardController extends GetxController {

   final PageController pageController = PageController();
   var pageIndex = 0.obs;
   late List<Widget> screens;

   UserDashboardController(UserModel user) {
     screens = [
       UserHomeScreen(userId: user.id),
       UserOrdersView(),
       const UserChatScreen(),
       UserSettingsScreen(),
       RiderScreen(),
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
