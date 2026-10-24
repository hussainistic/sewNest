import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  late final String orderId;
  late final String userId;
  late final String tailorId;
  late final String name;
  late final String phone;
  late final String address;
  late final double price;
  late final String status;
  late final Map<String, dynamic> measurements;
  late final Timestamp timestamp;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.tailorId,
    required this.name,
    required this.phone,
    required this.address,
    required this.price,
    required this.status,
    required this.measurements,
    required this.timestamp,
  });

  // Convert data from Firestore document
  OrderModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    orderId = documentSnapshot.id;
    userId = documentSnapshot['userId'];
    tailorId = documentSnapshot['tailorId'];
    name = documentSnapshot["name"];
    phone = documentSnapshot["phone"];
    address = documentSnapshot["address"];
    price = documentSnapshot['price'];
    status = documentSnapshot['status'];
    measurements = Map<String, dynamic>.from(documentSnapshot['measurements']);
    timestamp = documentSnapshot['timestamp'];
  }

  // Send data to Firestore database
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'tailorId': tailorId,
      'name': name,
      'phone': phone,
      'address': address,
      'price': price,
      'status': status,
      'measurements': measurements,
      'timestamp': timestamp,
    };
  }
}
