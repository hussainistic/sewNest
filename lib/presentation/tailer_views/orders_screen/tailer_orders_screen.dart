import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sewnest/models/order_model.dart';
import '../../../controllers/orders_screen_controller.dart';
import 'package:get/get.dart';
import '../../../utilis/dimensions.dart';
import '../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../utilis/styles/customColors.dart';

class TailorOrdersView extends StatelessWidget {
  TailorOrdersView({super.key});

  final OrdersController ordersController = Get.put(OrdersController());

  late OrderModel orderModel;

  String tailorId = FirebaseAuth.instance.currentUser?.uid ?? '';

  String formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();  // Firestore Timestamp ko DateTime mein convert karna
    return "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}:${dateTime.second}";
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.orange;
      case "Delivered":
        return Colors.green;
      case "Canceled":
        return Colors.red;
      case "Deleted":
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders", style: appBarTextStyle),
        backgroundColor: CustomColors.primaryColor,
        centerTitle: true,
      ),
      body: StreamBuilder<List<OrderModel>>(
        stream: ordersController.fetchTailorOrders(tailorId),  // Fetch orders for this tailor
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error fetching orders"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No orders found."));
          }

          final orders = snapshot.data!;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  color: Theme.of(context).cardColor.withOpacity(0.6),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(
                        order.name,
                        style: customTextStyle(color: CustomColors.secondaryColor, fontSize: Dimensions.fontSizeLarge)
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.phone,
                          style: customTextStyle(color: CustomColors.primaryColor, fontSize: Dimensions.fontSizeDefault),
                        ),
                        Text(
                          order.address,
                          style: customTextStyle(color: CustomColors.primaryColor, fontSize: Dimensions.fontSizeDefault),
                        ),
                        Text(
                          "Price: \$${order.price}",
                          style: customTextStyle(color: CustomColors.primaryColor, fontSize: Dimensions.fontSizeDefault),
                        ),
                        Text(
                          "Order Placed On: ${formatTimestamp(order.timestamp)}",
                          style: customTextStyle(color: CustomColors.primaryColor, fontSize: Dimensions.fontSizeDefault),
                        ),
                      ],
                    ),
                    trailing: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                            decoration: BoxDecoration(
                              color: getStatusColor(order.status).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: getStatusColor(order.status),
                              ),
                            ),
                            child: Text(
                              order.status,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: getStatusColor(order.status),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          // Action Buttons
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red,size: 30,),
                                onPressed: () {
                                  ordersController.deleteOrder(order.orderId);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

