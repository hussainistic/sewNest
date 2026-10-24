import 'package:get/get.dart';

class RateUsFeedbackController extends GetxController {
  // Rating value
  var rating = 0.obs;

  // Feedback value
  var feedback = ''.obs;

  // Function to update the rating when a star is clicked
  void updateRating(int newRating) {
    rating.value = newRating;
  }

  // Function to handle 'Submit' button action for rating
  void submitRating() {
   Get.snackbar("Success", "Rating submitted: $rating");
  }

  // Function to handle 'Submit Feedback' action
  // void submitFeedback(String feedbackText) {
  //   feedback.value = feedbackText;
  //   Get.snackbar("Success", "Feedback submitted: $feedback.value");
  // }

  // Function to handle 'Cancel' button action
  void cancelAction() {
    Get.back();
  }
}
