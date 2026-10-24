import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../auth_services/my_auth_services.dart';
import '../../models/tailor_model.dart';

class ProfileController extends GetxController{
  AppAuthService firebaseAuthService = AppAuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var selectedImagePath = "".obs;
  var uploadedImageURL = "".obs;

  /// Fetch tailor details from Firestore
  /// Fetch tailor details from Firestore
  Future<TailorModel> fetchTailorDetails(String tailorId) async {
    if (tailorId.isEmpty) {
      throw Exception("Tailor ID cannot be empty");
    }

    try {
      DocumentSnapshot doc = await _firestore.collection('tailors').doc(tailorId).get();

      if (!doc.exists) {
        throw Exception("Tailor not found");
      }

      return TailorModel.fromDocumentSnapshot(doc);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to fetch tailor details: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
      print("Error----------------------------------------------------> $e");
      rethrow;
    }
  }

  /// Update tailor details in Firestore
  Future<void> updateTailorDetails(String tailorId, Map<String, dynamic> updatedData) async {
    try {
      await _firestore.collection('tailors').doc(tailorId).update(updatedData);

      Get.snackbar(
        "Success",
        "Tailor details updated successfully.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to update tailor details: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

//fetch user profile from firestore
// Future<DocumentSnapshot> fetchUserProfile() async {
//   var userSnapShot = await FirebaseFirestore.instance.collection("users")
//       .doc(firebaseAuthService.getCurrentUserId).get();
//
//   uploadedImageURL.value = userSnapShot["profileImage"];
//   return userSnapShot;
// }

}