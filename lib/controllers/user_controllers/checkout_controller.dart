import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/order_model.dart';
import '../../presentation/user_views/success_screen/success_screen.dart';
import '../../secrets/app_secrets.dart';

class CheckOutController extends GetxController {
  final CollectionReference orderRef = FirebaseFirestore.instance.collection("orders");
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get currentUserID => _auth.currentUser!.uid;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  Map<String, dynamic>? paymentIntentData;

  // Function to add an order to Firestore
  Future<void> addOrder({
    required String tailorId,
    required String name,
    required String phone,
    required String address,
    required double price,
    required String status,
    required Map<String, dynamic> measurements,
    required Timestamp timestamp,
  }) async {
    String orderID = orderRef.doc().id; // Generate new order ID
    OrderModel orderModel = OrderModel(
      orderId: orderID,
      userId: currentUserID, // Get current logged-in user ID
      tailorId: tailorId,
      name: name,
      phone: phone,
      address: address, // Use the tailorId passed from previous screens
      price: price, // Set the calculated price
      status: status, // Set the order status (e.g., "pending")
      measurements: measurements, // Set the measurements for the order
      timestamp: timestamp, // Set the timestamp for order creation
    );

    Map<String, dynamic> orderData = orderModel.toJson(); // Convert order data to map
    try {
      await orderRef.doc(orderID).set(orderData); // Save order data to Firestore
    } catch (e) {
      print('Error saving order: $e');
      Get.snackbar("Failed", "Order Not Saved");
    }
  }

  // Function to initiate the payment process
  Future<void> makePayment(
      String amount,
      String name,
      String phone,
      String address,
      String tailorId,
      String userId,
      Map<String, dynamic> measurements,
      ) async {
    try {
      paymentIntentData = await createPaymentIntent(amount: amount, currency: "SEK");

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!["client_secret"],
          customFlow: true,
          style: ThemeMode.dark,
          merchantDisplayName: "SewNest",
        ),
      );
      displayPaymentSheet(name, phone, address, double.parse(amount), tailorId, userId, measurements);
    } catch (e) {
      print("Payment Exception: $e");
    }
  }

  // Function to display the payment sheet and handle post-payment actions
  void displayPaymentSheet(
      String name,
      String phone,
      String address,
      double price,
      String tailorId,
      String userId,
      Map<String, dynamic> measurements,
      ) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        Get.snackbar("Payment Success", "You have paid successfully");

        addOrder(
          tailorId: tailorId,
          name: name,
          phone: phone,
          address: address,
          price: price, // The price after payment
          status: "pending", // Default status (can be updated based on order state)
          measurements: measurements, // Pass measurements as needed
          timestamp: Timestamp.now(), // Set the timestamp for order creation
        );

        Get.to(() => SuccessScreen()); // Navigate to success screen
        paymentIntentData = null; // Clear payment data after success
      }).onError((error, stackTrace) {
        print("Error displaying payment sheet: $error $stackTrace");
      });
    } catch (e) {
      print("Error displaying payment sheet: $e");
    }
  }

  // Function to create a payment intent on Stripe's API
  Future<Map<String, dynamic>> createPaymentIntent({
    required String amount,
    required String currency,
  }) async {
    try {
      Map<String, dynamic> body = {
        "amount": calculateAmount(amount),
        "currency": currency,
        "payment_method_types[]": "card",
      };

      var response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        body: body,
        headers: {
          "Authorization": "Bearer ${AppSecrets.secretKey}",
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print("Error creating payment intent: $e");
      return {};
    }
  }

  // Function to calculate the amount in the smallest currency unit (e.g., cents for SEK)
  String calculateAmount(String amount) {
    final int calculateAmount = (double.parse(amount) * 100).toInt(); // Multiply by 100
    return calculateAmount.toString(); // Return as string
  }

  // Validate the form and initiate payment
  void submitForm({
    required int total,
    required String tailorId,
    required String userId,
    required Map<String, dynamic> measurements,
  }) async {
    if (formkey.currentState!.validate()) {
      String name = nameController.text;
      String phone = phoneController.text;
      String address = addressController.text;

      await makePayment(total.toString(), name, phone, address, tailorId, userId, measurements);
    }
  }
}
