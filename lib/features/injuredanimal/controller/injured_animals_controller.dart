import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class InjuredAnimalController extends GetxController {
  var species = ''.obs;
  var condition = ''.obs;
  var distance = ''.obs;
  var image = Rx<XFile?>(null);

  final speciesOptions = ['Bird', 'Mammal', 'Reptile', 'Unknown'];
  final conditionOptions = [
    'Limping',
    'Not moving',
    'Bleeding',
    'Tangled',
    'Orphaned',
  ];
  final distanceOptions = ['0–10 yards', '10–25', '25–50', '50+'];

  final locationTimestamp = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate auto-location + timestamp
    locationTimestamp.value =
        'Lat: XX.XXXX, Long: YY.YYYY\nTime: ${DateTime.now()}';
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      image.value = pickedFile;
    }
  }

  void submitReport() {
    Get.dialog(
      AlertDialog(
        title: Text('Report Submitted'),
        content: Text(
          'Your report has been sent to the nearest participating wildlife hospital.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(), // Close dialog
            child: Text('Back to Home'),
          ),
        ],
      ),
    );
  }
}
