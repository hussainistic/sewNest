import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sewnest/models/tailor_model.dart';

class HomeScreenController extends GetxController {
  final CollectionReference tailorRef = FirebaseFirestore.instance.collection("tailors");
  RxList<TailorModel> tailorList = <TailorModel>[].obs;

  // Fetch and update tailors
  void fetchTailors() {
    tailorRef.snapshots().listen((snapshot) {
      tailorList.value = snapshot.docs.map((doc) => TailorModel.fromDocumentSnapshot(doc)).toList();
    });
  }

  @override
  void onInit() {
    super.onInit();
    fetchTailors(); // Fetch data when the controller is initialized
  }
}
