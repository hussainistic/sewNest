import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/app_database/firestoreDB.dart';
import 'package:sewnest/custom_widgets/header_design.dart';
import 'package:sewnest/utilis/styles/CustomAppTextStyle.dart';
import 'package:sewnest/utilis/styles/customColors.dart';
import 'dart:math';
import '../checkout_screen/checkout_screen.dart';

class PriceCalculationScreen extends StatefulWidget {
  final String tailorId;
  final String userId;
  final String waist ;
  final String chest ;
  final String length;
  final String shoulder;
  final String sleeve;

  const PriceCalculationScreen({
    Key? key,
    required this.userId,
    required this.tailorId,
    required this.waist,
    required this.chest,
    required this.length,
    required this.shoulder,
    required this.sleeve,
  }) : super(key: key);

  @override
  State<PriceCalculationScreen> createState() => _PriceCalculationScreenState();
}

class _PriceCalculationScreenState extends State<PriceCalculationScreen> {
  // Generate random prices
  final random = Random();

  late int basePrice;
  late int fabricCost;
  late int additionalCharges;
  late int totalPrice;

  @override
  void initState() {
    super.initState();
    _generateRandomPrices();
  }

  void _generateRandomPrices() {
    basePrice = (random.nextInt(31) + 60) * 10;
    fabricCost = (random.nextInt(51) + 80) * 10;
    additionalCharges = (random.nextInt(16) + 20) * 10;
    totalPrice = basePrice + fabricCost + additionalCharges;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            HeaderDesign(
              title: "Price Calculation",
              icon: Icons.home,
              onIconPressed: null,
              backIconPressed: () => Get.back(),
            ),
            // Tailor Details Section
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Measurement Details Section
                    Text(
                      "Measurements Details",
                      style: headingTextStyle(color: CustomColors.secondaryColor),
                    ),
                    const SizedBox(height: 10),
                    _buildDetailRow(label: "Chest:", value: widget.chest),
                    _buildDetailRow(label: "Waist:", value: widget.waist),
                    _buildDetailRow(label: "Length:", value: widget.length),
                    _buildDetailRow(label: "Shoulder:", value: widget.shoulder),
                    _buildDetailRow(label: "Sleeve:", value: widget.sleeve),
                    const Divider(height: 30, thickness: 2),

                    // Pricing Section
                    Text(
                      "Price Breakdown",
                      style: headingTextStyle(color: CustomColors.secondaryColor),
                    ),
                    const SizedBox(height: 10),
                    _buildDetailRow(label: "Base Price:", value: "PKR $basePrice"),
                    _buildDetailRow(label: "Fabric Cost:", value: "PKR $fabricCost"),
                    _buildDetailRow(label: "Additional Charges:", value: "PKR $additionalCharges"),
                    const Divider(height: 30, thickness: 2),
                    _buildDetailRow(
                      label: "Total Price:",
                      value: "PKR $totalPrice",isBold: true,
                    ),
                    const SizedBox(height: 60),
                    // Confirm and Cancel Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Get.back(); // Navigate to the previous screen
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: CustomColors.secondaryColor,
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              'Cancel',
                              style: customTextStyle(
                                color: CustomColors.secondaryColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              await MyFirestore_db.saveMeasurementData(
                                userId: widget.userId,
                                tailorId: widget.tailorId,
                                chest: widget.chest,
                                waist: widget.waist,
                                length: widget.length,
                                shoulder: widget.shoulder,
                                sleeve: widget.sleeve,
                              );

                              Map<String, dynamic> measurements = {
                                "chest": widget.chest,
                                "waist": widget.waist,
                                "length": widget.length,
                                "shoulder": widget.shoulder,
                                "sleeve": widget.sleeve,
                              };
                              Get.to(
                                    () => CheckoutScreen(
                                  tailorId: widget.tailorId,
                                  userId: widget.userId,
                                  measurements: measurements,
                                  totalPrice: totalPrice,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              'Checkout',
                              style: customTextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Detail Rows
  Widget _buildDetailRow({
    required String label,
    required String value,
    bool isBold = false,
  })
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isBold
                ? subHeadingTextStyle(color: CustomColors.secondaryColor)
                : customTextStyle(fontSize: 16, color: CustomColors.secondaryColor),
          ),
          Text(
            value,
            style: isBold
                ? headingTextStyle(color: CustomColors.secondaryColor)
                : customTextStyle(fontSize: 16, color: CustomColors.secondaryColor),
          ),
        ],
      ),
    );
  }
}
