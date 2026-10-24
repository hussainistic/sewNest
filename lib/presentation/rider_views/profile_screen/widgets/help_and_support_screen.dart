import 'package:flutter/material.dart';
import 'package:sewnest/utilis/app_constants.dart';
import '../../../../custom_widgets/header_design.dart';
import '../../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../../utilis/styles/customColors.dart';

class RiderHelpAndSupportScreen extends StatelessWidget {
  const RiderHelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderDesign(
              title: 'Help & Support',
              icon: null,
              onIconPressed: null,
              navigateBack: true,
              backIconPressed: () { Navigator.pop(context); },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title: "Help and Support"
                    Text(
                      'Need Help? We\'re here for Riders!',
                      style: headingTextStyle(color: CustomColors.secondaryColor),
                    ),
                    const SizedBox(height: 20),

                    // Introduction Text
                    Text(
                      'Welcome to the SewNest! If you have questions or need assistance with your delivery tasks, you\'re in the right place.',
                      style: subHeadingTextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),

                    // FAQs Section
                    Text(
                      'Frequently Asked Questions:',
                      style: subHeadingTextStyle(color: CustomColors.secondaryColor),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '1. How do I accept a delivery task?\n'
                          'Log in to the app, go to "Available Tasks," and click "Accept" to confirm a delivery.',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '2. How do I update the delivery status?\n'
                          'Once the delivery is complete, go to "My Deliveries" and update the status to "Delivered."',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '3. What should I do if the customer is unreachable?\n'
                          'If the customer is not responding, use the "Report Issue" button in the app to inform support.',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 20),

                    // Contact Support Section
                    Text(
                      'Need Further Assistance?',
                      style: subHeadingTextStyle(color: CustomColors.secondaryColor),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'For additional help with app issues, payment concerns, or task-related queries, contact our support team.',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Contact our Rider Support Team:\n'
                          '    Email: ${AppConstants.email}\n'
                          '    Phone: +1 (800) 987-6543\n'
                          '    Hours: 8 AM - 8 PM (Mon-Sat)',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 20),

                    // Closing Statement
                    Text(
                      'We value your dedication as a rider. Thank you for partnering with SewNest!',
                      style: customTextStyle(color: CustomColors.secondaryColor, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
