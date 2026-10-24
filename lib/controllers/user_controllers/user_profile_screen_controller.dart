
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../auth_services/my_auth_services.dart';
import '../../models/user_model.dart';

class ProfileController extends GetxController{
  CollectionReference userRef = FirebaseFirestore.instance.collection("users");
  AppAuthService firebaseAuthService = AppAuthService();
  var selectedImagePath = "".obs;
  var uploadedImageURL = "".obs;

  // Fetch user details
  Future<UserModel> fetchUserDetails(String userId) async {
    DocumentSnapshot snapshot = await userRef.doc(userId).get();
    return UserModel.fromDocumentSnapshot(snapshot);
  }

  // Update user details
  Future<void> updateUserDetails(String userId, Map<String, dynamic> updatedData) async {
    await userRef.doc(userId).update(updatedData);
  }

}