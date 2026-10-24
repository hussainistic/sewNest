import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/tailer_controllers/rateus_feedback_controller.dart';
import '../../../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../../../utilis/styles/customColors.dart';

class RateUsAlertDialog extends StatelessWidget {
  const RateUsAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RateUsFeedbackController rateUsController = Get.put(RateUsFeedbackController());

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      content: Container(
        width: 350,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Rate Us',
              textAlign: TextAlign.center,
              style: headingTextStyle(color: CustomColors.secondaryColor)
            ),
            const SizedBox(height: 10),

            Text(
              'Make better app for you, and would love to know how would you rate our app?',
              textAlign: TextAlign.center,
              style: subHeadingTextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    // Toggle logic to update rating (revert if same star clicked)
                    if (rateUsController.rating.value == index + 1) {
                      // If the same star is clicked, reset the rating
                      rateUsController.updateRating(0);
                    } else {
                      // Otherwise, set the rating to the clicked star
                      rateUsController.updateRating(index + 1);
                    }
                  },
                  child: Obx(() {
                    return Icon(
                      index < rateUsController.rating.value
                          ? Icons.star_rate_rounded 
                          : Icons.star_border_rounded, 
                      color: Colors.amber,
                      size: 37,
                    );
                  }),
                );
              }),
            ),
            const SizedBox(height: 20),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: rateUsController.cancelAction, // Call cancel action from controller
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: CustomColors.secondaryColor,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  child: Text(
                    'Cancel',
                    style: customTextStyle(
                      color: CustomColors.secondaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    rateUsController.submitRating(); // Call submit function
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  child: Text(
                    'Submit',
                    style: customTextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
