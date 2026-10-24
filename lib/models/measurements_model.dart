import 'package:cloud_firestore/cloud_firestore.dart';

class MeasurementModel {
  late final String id;
  late final String userId;
  late final String tailorId;
  late final String chest;
  late final String waist;
  late final String length;
  late final String shoulder;
  late final String sleeve;
  late final Timestamp timestamp;

  MeasurementModel({
    required this.id,
    required this.userId,
    required this.tailorId,
    required this.chest,
    required this.waist,
    required this.length,
    required this.shoulder,
    required this.sleeve,
    required this.timestamp,
  });

  // Convert data from Firestore document
  MeasurementModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    userId = documentSnapshot['userId'];
    tailorId = documentSnapshot['tailorId'];
    chest = documentSnapshot['chest'];
    waist = documentSnapshot['waist'];
    length = documentSnapshot['length'];
    shoulder = documentSnapshot['shoulder'];
    sleeve = documentSnapshot['sleeve'];
    timestamp = documentSnapshot['timestamp'];
  }

  // Send data to Firestore database
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'tailorId': tailorId,
      'chest': chest,
      'waist': waist,
      'length': length,
      'shoulder': shoulder,
      'sleeve': sleeve,
      'timestamp': timestamp,
    };
  }
}
