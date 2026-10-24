import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/custom_widgets/header_design.dart';
import 'package:sewnest/models/tailor_model.dart';
import 'package:sewnest/presentation/user_views/home_screen/dialogue/measurement_alert_dialogue.dart';
import 'package:sewnest/utilis/dimensions.dart';
import 'package:sewnest/utilis/styles/CustomAppTextStyle.dart';
import 'package:sewnest/utilis/styles/customColors.dart';

class TailorDetailScreen extends StatelessWidget {
  final TailorModel tailor;
  final String userId;

  TailorDetailScreen({required this.tailor, Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            HeaderDesign(
              title: tailor.tailorName,
              icon: Icons.home,
              onIconPressed: null,
              backIconPressed: () => Get.back(),
            ),
            // Tailor Details Section
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Section
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: const AssetImage('assets/images/avatar_-removebg-preview.png'),
                          backgroundColor: CustomColors.primaryColor.withOpacity(0.2),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            tailor.specialization,
                            style: headingTextStyle(
                                color: CustomColors.secondaryColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Information Section
                    const Text(
                      "Details",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: CustomColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: const Icon(Icons.email, color: CustomColors.primaryColor),
                      title: Text(
                        "Email: ${tailor.email}",
                        style: customTextStyle(
                          fontSize: Dimensions.fontSizeLarge,
                          color: CustomColors.primaryColor,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone, color: CustomColors.primaryColor),
                      title: Text(
                        "Phone No: ${tailor.phoneNo}",
                        style: customTextStyle(
                          fontSize: Dimensions.fontSizeLarge,
                          color: CustomColors.primaryColor,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.timer, color: CustomColors.primaryColor),
                      title: Text(
                        "Experience: ${tailor.experience} years",
                        style: customTextStyle(
                          fontSize: Dimensions.fontSizeLarge,
                          color: CustomColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.dialog(
            MeasurementAlertDialog(userId: userId, tailorId: tailor.id),
          );
        },
        backgroundColor: CustomColors.primaryColor,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
            "Add Measurements",
        style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
