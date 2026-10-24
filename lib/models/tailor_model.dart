import 'package:cloud_firestore/cloud_firestore.dart';

class TailorModel {
  late final String id;
  late final String tailorName;//....
  late final String phoneNo;//....
  late final String email;
  late final String specialization;//....
  late final int experience;//....
  late final String role;

  TailorModel({
    required this.id,
    required this.tailorName,
    required this.phoneNo,
    required this.email,
    required this.specialization,
    required this.experience,
    required this.role,
  });

  // Convert data from Cloud Firestore
  TailorModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot['id'];
    tailorName = documentSnapshot['tailorName'];
    phoneNo = documentSnapshot['phoneNo'];
    email = documentSnapshot['email'];
    specialization = documentSnapshot['specialization'];
    experience = documentSnapshot['experience'];
    role = documentSnapshot['role'];
  }

  // Send data to Firestore DB
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['tailorName'] = tailorName;
    data['phoneNo'] = phoneNo;
    data['email'] = email;
    data['specialization'] = specialization;
    data['experience'] = experience;
    data['role'] = role;

    return data;
  }
}
