import 'package:flutter/material.dart';
import '../../../../custom_widgets/header_design.dart';
import '../../../../utilis/app_constants.dart';
import '../../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../../utilis/styles/customColors.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderDesign(
              title: 'Terms of Service',
              icon: null,
              onIconPressed: null,
              navigateBack: false,
              backIconPressed: () { true; },
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title: "Terms of Service"
                  Text(
                    'Terms of Service',
                    style: headingTextStyle(color: CustomColors.secondaryColor),
                  ),
                  const SizedBox(height: 20),

                  // Introduction Text
                  Text(
                    'Welcome to the SewNest! By using our tailoring services, you agree to the following terms and conditions.',
                    style: subHeadingTextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // Terms Sections
                  const Text(
                    '1. Acceptance of Terms\n'
                        'By accessing or using our services, you agree to comply with these terms of service. If you do not agree with these terms, you may not use the services.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '2. Changes to Terms\n'
                        'We reserve the right to update or modify these terms at any time. Any changes will be effective immediately upon posting, and your continued use of the service will constitute acceptance of the updated terms.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '3. User Responsibilities\n'
                        'You agree to use the tailoring services in compliance with all applicable laws and regulations. You are responsible for providing accurate measurements and information for your orders.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '4. Privacy Policy\n'
                        'We value your privacy. Please refer to our Privacy Policy for information on how we collect, use, and protect your personal and order data.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '5. Termination\n'
                        'We may suspend or terminate your access to our services at any time if we believe you are in violation of these terms or engaging in fraudulent activity.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '6. Contact Us\n'
                        'If you have any questions or concerns regarding these terms, please contact us at ${AppConstants.email}.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),

                  // Closing Statement
                  Text(
                    'By using this app, you acknowledge that you have read and understood these terms of service.',
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
