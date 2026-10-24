import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sewnest/models/rider_model.dart';

class RiderScreenController extends GetxController {
  final CollectionReference ridersRef = FirebaseFirestore.instance.collection("riders");
  RxList<RiderModel> riderList = <RiderModel>[].obs;

  // Fetch and update tailors
  void fetchRaiders() {
    ridersRef.snapshots().listen((snapshot) {
      riderList.value = snapshot.docs.map((doc) => RiderModel.fromDocumentSnapshot(doc)).toList();
    });
  }

  @override
  void onInit() {
    super.onInit();
    fetchRaiders();
  }
}
