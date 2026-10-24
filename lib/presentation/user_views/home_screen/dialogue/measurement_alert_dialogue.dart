import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/app_database/firestoreDB.dart';
import 'package:sewnest/presentation/user_views/home_screen/price_calculation.dart';
import 'package:sewnest/utilis/styles/CustomAppTextStyle.dart';
import 'package:sewnest/utilis/styles/customColors.dart';
import 'package:sewnest/controllers/user_controllers/MeasurementController.dart';

class MeasurementAlertDialog extends StatelessWidget {
  final String tailorId;
  final String userId;

  MeasurementAlertDialog({Key? key, required this.userId, required this.tailorId}) : super(key: key);

  final MeasurementController controller = Get.put(MeasurementController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Place Order',
                  style: headingTextStyle(
                    color: CustomColors.secondaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildMeasurementField(
                label: 'Chest',
                hint: 'chest measurement (inches)',
                icon: Icons.accessibility_new,
                onChanged: (value) => controller.chest.value = value,
              ),
              const SizedBox(height: 15),
              _buildMeasurementField(
                label: "Waist",
                hint: ' waist measurement (inches)',
                icon: Icons.format_align_center,
                onChanged: (value) => controller.waist.value = value,
              ),
              const SizedBox(height: 15),
              _buildMeasurementField(
                label: 'Length',
                hint: 'length measurement (inches)',
                icon: Icons.straighten,
                onChanged: (value) => controller.length.value = value,
              ),
              const SizedBox(height: 15),
              _buildMeasurementField(
                label: 'Shoulder',
                hint: 'shoulder measurement (inches)',
                icon: Icons.settings_accessibility,
                onChanged: (value) => controller.shoulder.value = value,
              ),
              const SizedBox(height: 15),
              _buildMeasurementField(
                label: 'Sleeve',
                hint: 'sleeve measurement (inches)',
                icon: Icons.handshake,
                onChanged: (value) => controller.sleeve.value = value,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: CustomColors.secondaryColor,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        if (_formKey.currentState!.validate()) {
                          try {
                            await MyFirestore_db.saveMeasurementData(
                              userId: userId,
                              tailorId: tailorId,
                              chest: controller.chest.value,
                              waist: controller.waist.value,
                              length: controller.length.value,
                              shoulder: controller.shoulder.value,
                              sleeve: controller.sleeve.value,
                            );

                            Get.snackbar(
                              'Success',
                              'Measurements saved successfully!',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green.shade400,
                              colorText: Colors.white,
                              duration: const Duration(seconds: 3),
                            );
                            Get.to(() => PriceCalculationScreen(
                              userId: userId, tailorId: tailorId,
                              waist: controller.waist.value,
                                chest: controller.chest.value,
                              length: controller.length.value,
                              shoulder: controller.shoulder.value,
                                sleeve: controller.sleeve.value ));
                          } catch (e) {
                            Get.snackbar(
                              'Error',
                              'Failed to save measurements. Please try again.',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        } else {
                          Get.snackbar(
                            'Error',
                            'Please fill in all fields with valid values.',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: Text(
                        'Submit',
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
    );
  }

  Widget _buildMeasurementField({
    required String label,
    required String hint,
    required IconData icon,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label measurement';
        }
        if (double.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: '$label Measurement',
        hintText: hint,
        prefixIcon: Icon(icon, color: CustomColors.secondaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: CustomColors.secondaryColor,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: CustomColors.primaryColor.withOpacity(0.1),
      ),
    );
  }
}
