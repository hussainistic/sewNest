import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../auth_services/my_auth_services.dart';
import '../../models/rider_model.dart';

class ProfileController extends GetxController{
  AppAuthService firebaseAuthService = AppAuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var selectedImagePath = "".obs;
  var uploadedImageURL = "".obs;


  /// Fetch rider details from Firestore
  Future<RiderModel> fetchRiderDetails(String riderId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('riders').doc(riderId).get();

      if (!doc.exists) {
        throw Exception("Rider not found");
      }

      return RiderModel.fromDocumentSnapshot(doc);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to fetch rider details: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  /// Update rider details in Firestore
  Future<void> updateRiderDetails(String riderId, Map<String, dynamic> updatedData) async {
    try {
      await _firestore.collection('riders').doc(riderId).update(updatedData);

      Get.snackbar(
        "Success",
        "Rider details updated successfully.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to update rider details: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
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
