import 'package:cloud_firestore/cloud_firestore.dart';

class RiderModel {
  late final String id;
  late final String riderName;
  late final String phoneNo;
  late final String email;
  late final String vehicleDetails;
  late final String licenseNo;
  late final String role;

  RiderModel({
    required this.id,
    required this.riderName,
    required this.phoneNo,
    required this.email,
    required this.vehicleDetails,
    required this.licenseNo,
    required this.role,
  });

  // Convert data from Cloud Firestore
  RiderModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot['id'];
    riderName = documentSnapshot['riderName'];
    phoneNo = documentSnapshot['phoneNo'];
    email = documentSnapshot['email'];
    vehicleDetails= documentSnapshot['vehicleDetails'];
    licenseNo = documentSnapshot['licenseNo'];
    role = documentSnapshot['role'];
  }

  // Send data to Firestore DB
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['riderName'] = riderName;
    data['phoneNo'] = phoneNo;
    data['email'] = email;
    data['vehicleDetails'] = vehicleDetails;
    data['licenseNo'] = licenseNo;
    data['role'] = role;

    return data;
  }
}
