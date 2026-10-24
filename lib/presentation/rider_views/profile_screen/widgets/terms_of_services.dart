import 'package:flutter/material.dart';
import '../../../../custom_widgets/header_design.dart';
import '../../../../utilis/app_constants.dart';
import '../../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../../utilis/styles/customColors.dart';

class RiderTermsOfServiceScreen extends StatelessWidget {
  const RiderTermsOfServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderDesign(
              title: 'Rider Terms of Service',
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
                'Rider Terms of Service',
                style: headingTextStyle(color: CustomColors.secondaryColor),
              ),
              const SizedBox(height: 20),

              // Introduction Text
              Text(
                'Welcome to SewNest Rider Platform! By working with us as a rider, you agree to the following terms and conditions.',
                style: subHeadingTextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Terms Sections
              const Text(
                '1. Acceptance of Terms\n'
                    'By registering as a rider and using our platform, you agree to comply with these terms of service. If you do not agree with these terms, you may not use the platform.',
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 10),
                  const Text(
                    '2. Rider Responsibilities\n'
                        'You are responsible for:\n'
                        '- Safely delivering orders to customers.\n'
                        '- Updating delivery statuses in real-time.\n'
                        '- Communicating any issues promptly to the support team.',
                    style: TextStyle(color: Colors.black),
                  ),

                  const SizedBox(height: 10),
            const Text(
              '3. Payment Terms\n'
                  'Riders will receive payment based on completed tasks as outlined in our payment policy. Payment cycles and methods are subject to updates communicated via the rider app.',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            const Text(
              '4. Compliance with Laws\n'
                  'You agree to adhere to all local traffic laws and regulations while performing your duties as a rider.',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            const Text(
              '5. Privacy Policy\n'
                  'We value your privacy. Please refer to our Privacy Policy for information on how we collect, use, and protect your personal and task-related data.',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            const Text(
              '6. Termination\n'
                  'We reserve the right to suspend or terminate your rider account if we believe you are in violation of these terms or engaging in fraudulent or unsafe activities.',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            const Text(
              '7. Contact Us\n'
                  'For any questions or concerns, please contact our Rider Support Team at ${AppConstants.email}.',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),

            // Closing Statement
            Text(
              'By working with SewNest as a rider, you acknowledge that you have read and understood these terms of service.',
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
