import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppAuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Sign up user and assign a role
  static Future<User?> signupToApp(String userEmail, String userPassword, String role) async {
    try {
      // Create a new user in Firebase Authentication
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      if (role == 'user') {
        await firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': userEmail,
          'role': role,
          'createdAt': FieldValue.serverTimestamp(),
        });
        return userCredential.user;
      }
      else if(role == 'tailor'){
        await firestore.collection('tailors').doc(userCredential.user!.uid).set({
          'email': userEmail,
          'role': role, // role could be 'tailor', 'customer', etc.
          'createdAt': FieldValue.serverTimestamp(),
        });
        return userCredential.user;
      }
      else if (role == 'rider') {
        await firestore.collection('riders').doc(userCredential.user!.uid).set({
          'email': userEmail,
          'role': role, // role could be 'tailor', 'customer', etc.
          'createdAt': FieldValue.serverTimestamp(),
        });
        return userCredential.user;
      }
      else{
        return null;
      }

    } on FirebaseAuthException catch (a) {
      if (a.code == "email-already-in-use") {
        print("Email address is already in use");
      } else if (a.code == "weak-password") {
        print("Please use a strong password");
      }
    } catch (e) {
      print("Exception Occurred--------------->: $e");
      return null;
    }
    return null;
  }

  // Login user
  static Future<User?> userLoginToApp(String userEmail, String userPassword) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      // Fetch the role from Firestore
      var userDoc = await firestore.collection('users').doc(userCredential.user!.uid).get();
      String userRole = userDoc['role'];
      print('User Role: $userRole');

      if(userRole == "user"){
        return userCredential.user;
      }else{
        return null;
      }

    } on FirebaseAuthException catch (a) {
      if (a.code == "operation-not-allowed") {
        print("You can't login: Contact Administration");
      } else if (a.code == "weak-password") {
        print("Please use a strong password");
      }
    } catch (e) {
      print("Exception Occurred--------------->: $e");
      return null;
    }
    return null;
  }

  // Login rider
  static Future<User?> riderLoginToApp(String userEmail, String userPassword) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      // Fetch the role from Firestore
      var roleDocRider = await firestore.collection('riders').doc(userCredential.user!.uid).get();
      String userRole = roleDocRider['role'];
      print('User Role: $userRole');

      if(userRole == "rider"){
        return userCredential.user;
      }else{
        return null;
      }

    } on FirebaseAuthException catch (a) {
      if (a.code == "operation-not-allowed") {
        print("You can't login: Contact Administration");
      } else if (a.code == "weak-password") {
        print("Please use a strong password");
      }
    } catch (e) {
      print("Exception Occurred--------------->: $e");
      return null;
    }
    return null;
  }

  // Login tailor
  static Future<User?> tailorLoginToApp(String userEmail, String userPassword) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      var roleDocTailor = await firestore.collection('tailors').doc(userCredential.user!.uid).get();
      String userRole = roleDocTailor['role'];
      print('User Role: $userRole');

      if(userRole == "tailor"){
        return userCredential.user;
      }else{
        return null;
      }

    } on FirebaseAuthException catch (a) {
      if (a.code == "operation-not-allowed") {
        print("You can't login: Contact Administration");
      } else if (a.code == "weak-password") {
        print("Please use a strong password");
      }
    } catch (e) {
      print("Exception Occurred--------------->: $e");
      return null;
    }
    return null;
  }

}
