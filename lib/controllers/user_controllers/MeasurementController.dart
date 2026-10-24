import 'package:get/get.dart';

class MeasurementController extends GetxController {
  // Variables for the measurements
  var chest = ''.obs;
  var waist = ''.obs;
  var length = ''.obs;
  var shoulder = ''.obs;
  var sleeve = ''.obs;

  // Method to validate and save the measurements
  bool validateMeasurements() {
    return chest.isNotEmpty &&
        waist.isNotEmpty &&
        length.isNotEmpty &&
        shoulder.isNotEmpty &&
        sleeve.isNotEmpty;
  }
}
