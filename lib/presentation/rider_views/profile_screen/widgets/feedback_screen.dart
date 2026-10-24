import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/tailer_controllers/rateus_feedback_controller.dart';
import '../../../../custom_widgets/header_design.dart';
import '../../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../../utilis/styles/customColors.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RateUsFeedbackController feedbackController = Get.put(RateUsFeedbackController());
    TextEditingController feedbackTextController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             HeaderDesign(title: 'Feedback', icon: null, onIconPressed: null, navigateBack: true, backIconPressed: () { true; },),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Give your feedback about our app',
                    style: headingTextStyle(color: CustomColors.secondaryColor),
                  ),
                  const SizedBox(height: 20),

                  // Feedback Text Field
                  Text(
                    'Tell us what can be improved!',
                    style: subHeadingTextStyle(color: CustomColors.productColor),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: feedbackTextController,
                    decoration: InputDecoration(
                      labelText: "Feedback",
                      labelStyle: labelTextStyle,
                      hintText: 'Write your feedback...',
                      hintStyle: const TextStyle(
                        color: CustomColors.inactiveColor,
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    ),
                    maxLines: 5,
                  ),
                  // Container(
                  //   height: 200,
                  //   width: 400,
                  //   child: Lottie.asset("assets/images/lottie/feedback_animation.json"),
                  // ),
                  const SizedBox(height: 100),

                  // Submit Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // String feedbackText = feedbackTextController.text;
                        // feedbackController.submitFeedback(feedbackText);
                        Get.snackbar('Thank you', 'Your feedback has been submitted!');
                        feedbackTextController.clear();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 14),
                      ),
                      child: Text(
                        'Submit Feedback',
                        style: customTextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
