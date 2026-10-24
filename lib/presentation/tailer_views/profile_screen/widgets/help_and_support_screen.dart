import 'package:flutter/material.dart';
import 'package:sewnest/utilis/app_constants.dart';
import '../../../../custom_widgets/header_design.dart';
import '../../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../../utilis/styles/customColors.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

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
              backIconPressed: () { true; },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title: "Help and Support"
                    Text(
                      'Need Help? We\'re here to assist you!',
                      style: headingTextStyle(color: CustomColors.secondaryColor),
                    ),
                    const SizedBox(height: 20),

                    // Introduction Text
                    Text(
                      'Welcome to SewNest! If you are a tailor using our platform, this guide is designed to assist you.',
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
                      '1. How do I update my tailoring services?\n'
                          'To update your tailoring services, go to the "My Services" section, select the service you want to edit, and make the necessary changes.',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '2. How do I manage customer orders?\n'
                          'You can view and manage customer orders under the "Orders" section. Update the order status to inform customers of progress.',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '3. How do I receive payments for completed orders?\n'
                          'Payments are processed securely and deposited into your linked account. You can view payment details in the "Earnings" section.',
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
                      'If you need further assistance or have specific concerns about using the platform, feel free to reach out to our support team.',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Contact our Support Team:\n'
                          '    Email: ${AppConstants.email}\n'
                          '    Phone: +1 (800) 123-4567\n'
                          '    Hours: 9 AM - 9 PM (Mon-Fri)',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 20),

                    // Closing Statement
                    Text(
                      'Thank you for partnering with SewNest. We\'re here to help you grow your tailoring business!',
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
