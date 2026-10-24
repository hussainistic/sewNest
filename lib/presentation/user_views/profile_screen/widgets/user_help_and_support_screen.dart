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
              backIconPressed: () { Navigator.pop(context); },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title: Help and Support
                  Text(
                    'Need Help? We\'re here to assist you!',
                    style: headingTextStyle(color: CustomColors.secondaryColor),
                  ),
                  const SizedBox(height: 20),

                  // Introduction Text
                  Text(
                    'Welcome to SewNest! If you have any questions or need assistance, you\'ve come to the right place.',
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
                    '1. How do I place an order for tailoring services?\n'
                        '   To place an order, browse available services, select your desired service (e.g. custom tailoring), and click "Book Now". Fill in your details to complete the order.',
                    style: TextStyle(color: Colors.black, height: 1.5),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '2. What payment methods are accepted?\n'
                        '   We accept payments via credit/debit cards, PayPal, and other secure payment gateways.',
                    style: TextStyle(color: Colors.black, height: 1.5),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '3. How can I track my tailoring order?\n'
                        '   Track the status of your order in the app under the "My Orders" section.',
                    style: TextStyle(color: Colors.black, height: 1.5),
                  ),
                  const SizedBox(height: 20),

                  // Contact Support Section
                  Text(
                    'Need Further Assistance?',
                    style: subHeadingTextStyle(color: CustomColors.secondaryColor),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'If you need further assistance or have specific concerns, feel free to reach out to our support team.',
                    style: TextStyle(color: Colors.black, height: 1.5),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Contact our Support Team:\n'
                        '   Email: ${AppConstants.email}\n'
                        '   Phone: +1 (800) 123-4567\n'
                        '   Hours: 9 AM - 9 PM (Mon-Fri)',
                    style: TextStyle(color: Colors.black, height: 1.5),
                  ),
                  const SizedBox(height: 20),

                  // Closing Statement
                  Text(
                    'We\'re here to help you get the perfect fit! Thank you for choosing SewNest.',
                    style: customTextStyle(color: CustomColors.secondaryColor, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
