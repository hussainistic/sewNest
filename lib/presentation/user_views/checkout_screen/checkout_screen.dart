import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/user_controllers/checkout_controller.dart';
import '../../../custom_widgets/header_design.dart';
import '../../../utilis/dimensions.dart';
import '../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../utilis/styles/customColors.dart';

class CheckoutScreen extends StatelessWidget {
  final String tailorId;
  final String userId;
  final Map<String, dynamic> measurements;
  final int totalPrice;

   CheckoutScreen({
    Key? key,
    required this.tailorId,
    required this.userId,
    required this.measurements,
    required this.totalPrice,
  }) : super(key: key);

  final CheckOutController checkOutController = Get.put(CheckOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderDesign(
              title: 'Check Out',
              icon: null,
              onIconPressed: null,
              backIconPressed: () { Get.back(); },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: checkOutController.formkey,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      "Your Details",
                      style: headingTextStyle(
                        color: CustomColors.secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 40),
                    buildTextField(
                      controller: checkOutController.nameController,
                      label: 'Name',
                      hintText: "Enter your Name",
                      icon: Icons.person,
                      validator: (value) =>
                      value == null || value.isEmpty ? "Name is required" : null,
                    ),
                    const SizedBox(height: 25),
                    buildTextField(
                      controller: checkOutController.phoneController,
                      label: 'Phone No',
                      hintText: "Enter Phone No",
                      icon: Icons.phone,
                      validator: (value) =>
                      value == null || value.isEmpty ? "Phone is required" : null,
                    ),
                    const SizedBox(height: 25),
                    buildTextField(
                      controller: checkOutController.addressController,
                      label: 'Address',
                      hintText: "Enter your Address",
                      icon: Icons.location_on,
                      maxLines: 5,
                      validator: (value) =>
                      value == null || value.isEmpty ? "Address is required" : null,
                    ),
                    const SizedBox(height: 60),
                    Text(
                      "Total Amount: PKR $totalPrice",
                      style: customTextStyle(
                        color: CustomColors.primaryColor,
                        fontSize: Dimensions.fontSizeExtraLarge,
                      ),
                    ),
                    const SizedBox(height: 70),
                    ElevatedButton(
                      onPressed: () {
                        checkOutController.submitForm(
                          total: totalPrice,
                          tailorId: tailorId,
                          userId: userId,
                          measurements: measurements,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.secondaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal:40, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('Pay', style: customTextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.fontSizeHeading,
                      )),
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

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: CustomColors.productColor.withOpacity(0.3),
        filled: true,
        labelText: label,
        hintText:  hintText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
