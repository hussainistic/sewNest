import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late final String id;
  late final String userName;
  late final String phoneNo;
  late final String email;
  late final String role;


  UserModel({
    required this.id,
    required this.userName,
    required this.phoneNo,
    required this.email,
    required this.role,
  });
//Covert data from cloud firestore
  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot['id'];
    userName = documentSnapshot['userName'];
    phoneNo = documentSnapshot['phoneNo'];
    email = documentSnapshot['email'];
    role = documentSnapshot['role'];
  }
//send data to firestore db
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id']= id;
    data['userName']= userName;
    data['phoneNo']= phoneNo;
    data['email'] = email;
    data['role'] = role;

    return data;
  }
}
