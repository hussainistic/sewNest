import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order_model.dart';

class OrdersController extends GetxController {
  CollectionReference orderRef = FirebaseFirestore.instance.collection("orders");

  RxList<OrderModel> orders = <OrderModel>[].obs;

  //user Orders
  Stream<List<OrderModel>> fetchUserOrders(String userId) {
    return orderRef
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc){
        return OrderModel.fromDocumentSnapshot(doc);
      }).toList();
    });
  }

  //tailor Orders
  Stream<List<OrderModel>> fetchTailorOrders(String tailorId) {
    return orderRef
        .where('tailorId', isEqualTo: tailorId)  // Filter orders by tailorId
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return OrderModel.fromDocumentSnapshot(doc);
      }).toList();
    });
  }

  // all Orders
  Stream<List<OrderModel>> fetchAllOrders() {
    return orderRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return OrderModel.fromDocumentSnapshot(doc);
      }).toList();
    });
  }

  // Update order status
  void updateOrderStatus(String orderId, String status) {
    orderRef.doc(orderId).update({
      'status': status,
    });
  }

  // Delete an order
  void deleteOrder(String orderId) {
    orderRef.doc(orderId).delete();
  }
}