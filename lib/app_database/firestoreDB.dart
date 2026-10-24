import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sewnest/models/measurements_model.dart';
import '../models/user_model.dart';
import '../models/rider_model.dart';
import '../models/tailor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyFirestore_db {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference userCollectionReference =
  FirebaseFirestore.instance.collection("users");
  static CollectionReference riderCollectionReference =
  FirebaseFirestore.instance.collection("riders");
  static CollectionReference tailorCollectionReference =
  FirebaseFirestore.instance.collection("tailors");

  static CollectionReference measurementCollectionReference =
  FirebaseFirestore.instance.collection("measurements");

  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static String get currentUserID => firebaseAuth.currentUser!.uid;

  // Save user data to Firestore
  static Future<void> saveUserData(
      {
    required String userID,
    required String userName,
    required String phoneNo,
    required String email,
    String role = 'user',
  }) async {
    UserModel userModel = UserModel(
      id: userID,
      userName: userName,
      phoneNo: phoneNo,
      email: email,
      role: role,
    );

    Map<String, dynamic> dataForFirestore = userModel.toJson();

    await userCollectionReference.doc(userID).set(dataForFirestore).then((value) {
      print("User Added to Firestore");
    }).onError((error, stackTrace) {
      print("Error adding user to Firestore: $error");
    });
  }

  // Save rider data to Firestore
  static Future<void> saveRiderData({
    required String riderID,
    required String riderName,
    required String phoneNo,
    required String email,
    required String vehicleType,
    required String licenseNo,
    String role = 'rider',
  }) async {
    RiderModel riderModel = RiderModel(
      id: riderID,
      riderName: riderName,
      phoneNo: phoneNo,
      email: email,
      vehicleDetails: vehicleType,
      licenseNo: licenseNo,
      role: role,
    );

    Map<String, dynamic> dataForFirestore = riderModel.toJson();

    await riderCollectionReference.doc(riderID).set(dataForFirestore).then((value) {
      print("Rider Added to Firestore");
    }).onError((error, stackTrace) {
      print("Error adding rider to Firestore: $error");
    });
  }

  // Save tailor data to Firestore
  static Future<void> saveTailorData({
    required String tailorID,
    required String tailorName,
    required String phoneNo,
    required String email,
    required String specialization,
    required int experience,
    String role = 'tailor',
  }) async {
    TailorModel tailorModel = TailorModel(
      id: tailorID,
      tailorName: tailorName,
      phoneNo: phoneNo,
      email: email,
      specialization: specialization,
      experience: experience,
      role: role,
    );

    Map<String, dynamic> dataForFirestore = tailorModel.toJson();

    await tailorCollectionReference.doc(tailorID).set(dataForFirestore).then((value) {
      print("Tailor Added to Firestore");
    }).onError((error, stackTrace) {
      print("Error adding tailor to Firestore: $error");
    });
  }

  // Save measurement data to Firestore
  static Future<void> saveMeasurementData ({
    required String userId,
    required String tailorId,
    required String chest,
    required String waist,
    required String length,
    required String shoulder,
    required String sleeve,
  }) async {
    MeasurementModel measurement = MeasurementModel(
      id: measurementCollectionReference.doc().id,
      userId: userId,
      tailorId: tailorId,
      chest: chest,
      waist: waist,
      length: length,
      shoulder: shoulder,
      sleeve: sleeve,
      timestamp: Timestamp.now(),
    );

    Map<String, dynamic> dataForFirestore = measurement.toJson();

    await measurementCollectionReference
        .doc(measurement.id)
        .set(dataForFirestore)
        .then((value) {
      print("Measurement Added to Firestore");
    }).onError((error, stackTrace) {
      print("Error adding measurement to Firestore: $error");
    });
  }
}

