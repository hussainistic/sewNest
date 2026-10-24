import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/controllers/user_controllers/user_homescreen_controller.dart';
import 'package:sewnest/controllers/user_controllers/user_rider_screen_controller.dart';
import 'package:sewnest/custom_widgets/header_design.dart';
import 'package:sewnest/presentation/auth_screens/login_screens/user_login_screen.dart';
import 'package:sewnest/utilis/styles/CustomAppTextStyle.dart';
import 'package:sewnest/utilis/styles/customColors.dart';
import 'package:sewnest/presentation/user_views/home_screen/user_tailor_detail_screen.dart';
class RiderScreen extends StatelessWidget {

  RiderScreen({super.key});

  final RiderScreenController riderScreenController = Get.put(RiderScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderDesign(
              title: 'Riders',
              icon: Icons.home,
              onIconPressed: null,
              backIconPressed: () => Get.to(() => UserLoginScreen()),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (riderScreenController.riderList.isEmpty) {
                  return const Center(
                    child: Text("No Tailors Found", style: TextStyle(fontSize: 18)),
                  );
                }
                return ListView.builder(
                  itemCount: riderScreenController.riderList.length,
                  itemBuilder: (context, index) {
                    final rider = riderScreenController.riderList[index];
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
                            rider.riderName,
                            style: subHeadingTextStyle(
                              color: CustomColors.secondaryColor,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone Number: ${rider.phoneNo}",
                                style: labelTextStyle,
                              ),
                              Text(
                                "Email : ${rider.email}",
                                style: labelTextStyle,
                              ),
                            ],
                          ),
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
