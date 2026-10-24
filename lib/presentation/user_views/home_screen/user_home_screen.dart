import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/controllers/user_controllers/user_homescreen_controller.dart';
import 'package:sewnest/custom_widgets/header_design.dart';
import 'package:sewnest/presentation/auth_screens/login_screens/user_login_screen.dart';
import 'package:sewnest/utilis/styles/CustomAppTextStyle.dart';
import 'package:sewnest/utilis/styles/customColors.dart';
import 'package:sewnest/presentation/user_views/home_screen/user_tailor_detail_screen.dart';
class UserHomeScreen extends StatelessWidget {

  final String userId;

  UserHomeScreen({required this.userId ,super.key});

  final HomeScreenController userHomeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderDesign(
              title: 'Stitch Panel',
              icon: Icons.home,
              onIconPressed: null,
              backIconPressed: () => Get.to(() => UserLoginScreen()),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (userHomeScreenController.tailorList.isEmpty) {
                  return const Center(
                    child: Text("No Tailors Found", style: TextStyle(fontSize: 18)),
                  );
                }
                return ListView.builder(
                  itemCount: userHomeScreenController.tailorList.length,
                  itemBuilder: (context, index) {
                    final tailor = userHomeScreenController.tailorList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: CustomColors.secondaryColor.withOpacity(0.201),
                          border: Border.all(
                            width: 3,
                            color: const Color(0xEA744C85),
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: ClipRRect(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(width: 1, color: CustomColors.secondaryColor),
                              ),
                              child: const Icon(Icons.person),
                            ),
                          ),
                          title: Text(
                            tailor.tailorName,
                            style: subHeadingTextStyle(
                              color: CustomColors.secondaryColor,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Specialization: ${tailor.specialization}",
                                style: labelTextStyle,
                              ),
                              Text(
                                "Experience: ${tailor.experience} years",
                                style: labelTextStyle,
                              ),
                            ],
                          ),
                            onTap: () {
                                  Get.to(() => TailorDetailScreen(userId : userId ,tailor: tailor));
                                  },
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
