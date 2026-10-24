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
                    'Welcome to SewNest! By using our tailoring services, you agree to the following terms and conditions.',
                    style: subHeadingTextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // Terms Sections
                  const Text(
                    '1. Service Agreement\n'
                        'By placing an order with SewNest, you agree to provide accurate measurements, garment details, and any specific tailoring instructions necessary for the service.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '2. Modifications and Alterations\n'
                        'Requests for modifications or alterations to your garment must be submitted within 7 days of delivery. Additional charges may apply for significant changes.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '3. Payments and Refunds\n'
                        'All orders must be paid in full at the time of booking. Refunds will only be issued in the case of service errors caused by SewNest and not due to inaccurate measurements provided by the user.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '4. Privacy and Data Usage\n'
                        'Your personal information, including measurements, will only be used to fulfill your orders and improve our services. Please refer to our Privacy Policy for more details.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '5. Order Turnaround Time\n'
                        'Our standard turnaround time is 7-10 business days for most orders. Delays may occur during peak seasons or for custom designs. You will be notified if any delays arise.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '6. Limitation of Liability\n'
                        'SewNest is not liable for damages caused by misuse, improper washing, or alterations made after delivery. Our responsibility is limited to the quality of the tailoring service provided.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '7. Contact Us\n'
                        'For questions or concerns about our services or these terms, please contact us at ${AppConstants.email}.',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),

                  // Closing Statement
                  Text(
                    'By using this app, you acknowledge that you have read, understood, and agreed to these terms of service.',
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
