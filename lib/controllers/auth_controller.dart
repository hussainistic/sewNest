import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sewnest/presentation/role_selection.dart';
import '../presentation/auth_screens/login_screens/user_login_screen.dart';
import '../presentation/auth_screens/login_screens/tailor_login_screen.dart';
import '../presentation/auth_screens/login_screens/rider_login_screen.dart'; // Add your RiderLoginScreen import

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;

  // Convert user of app to Rx, initialize it as null
  static Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    // Initialize the firebaseUser after Firebase Auth is ready
    firebaseUser.value = _auth.currentUser;
    firebaseUser.bindStream(_auth.userChanges());   // userChanges() is a stream => user changes with stream
    ever(firebaseUser, _setInitialScreen);          // Call every time when user changes, e.g., login, signup
  }

  // This function will check the user and navigate based on the user state
  void checkUser() {
    if (firebaseUser.value != null) {
      // Get.offAll(() => DashboardScreen());
    } else {
      Get.offAll(() => UserLoginScreen());
    }
  }

  // This function will handle the initial screen setup based on user state
  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => UserLoginScreen());
    } else {
      // Fetch role from Firestore or another source
      FirebaseFirestore.instance.collection('users').doc(user.uid).get().then((doc) {
        if (doc.exists) {
          var role = doc['role'];
          if (role == 'tailor') {
            Get.offAll(() => TailorLoginScreen());
          } else if (role == 'rider') {
            Get.offAll(() => RiderLoginScreen());
          } else {
            Get.offAll(() => UserLoginScreen());
          }
        } else {
          Get.offAll(() => UserLoginScreen());
        }
      });
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.snackbar("Log Out", "You have been logged out");
      Get.offAll(() => RoleSelectionScreen());
    } catch (e) {
      print("----------------------->  $e");
      Get.snackbar("Failed", "Unable to log out");
    }
  }
}
