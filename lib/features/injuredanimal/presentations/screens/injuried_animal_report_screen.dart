import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/features/injuredanimal/controller/injured_animals_controller.dart';
import 'package:wildlife/features/injuredanimal/presentations/screens/sucessfully_submit_screen.dart';
import 'package:wildlife/features/injuredanimal/presentations/widgets/custom_dropdown.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/rounded_button.dart';

class InjuredAnimalReportScreen extends StatelessWidget {
  final InjuredAnimalController controller = Get.put(InjuredAnimalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Injured Animal Report')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => CustomDropdownField(
                  hint: "Species",
                  icon: Icons.pets,
                  value: controller.species.value,
                  items: controller.speciesOptions,
                  onChanged: (val) => controller.species.value = val ?? '',
                ),
              ),
              SizedBox(height: 16),

              Obx(
                () => CustomDropdownField(
                  hint: "'Behavior / Condition'",
                  icon: Icons.health_and_safety,
                  value: controller.condition.value,
                  items: controller.conditionOptions,
                  onChanged: (val) => controller.condition.value = val ?? '',
                ),
              ),
              SizedBox(height: 16),

              // Distance Dropdown
              // Obx(
              //   () => DropdownButtonFormField<String>(
              //     decoration: InputDecoration(
              //       labelText: 'Distance',
              //       prefixIcon: Icon(Icons.place),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //     value: controller.distance.value.isEmpty
              //         ? null
              //         : controller.distance.value,
              //     items: controller.distanceOptions
              //         .map((d) => DropdownMenuItem(value: d, child: Text(d)))
              //         .toList(),
              //     onChanged: (val) => controller.distance.value = val ?? '',
              //   ),
              // ),
              Obx(
                () => CustomDropdownField(
                  hint: "Distance",
                  icon: Icons.place,
                  value: controller.distance.value,
                  items: controller.distanceOptions,
                  onChanged: (val) => controller.distance.value = val ?? '',
                ),
              ),

              SizedBox(height: 16),

              // Photo Upload
              Obx(
                () => Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: controller.pickImage,
                      icon: Icon(Icons.camera_alt, color: Colors.grey[600]),
                      label: Text(
                        'Upload Photo',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFFF0F0F0),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    if (controller.image.value != null) Text('Photo Selected'),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Auto-location + timestamp
              Obx(
                () => TextField(
                  decoration: InputDecoration(
                    labelText: 'Your Location & Timestamp',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  readOnly: true,
                  controller: TextEditingController(
                    text: controller.locationTimestamp.value,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Submit Button
              RoundedButton(
                text: "Submit Report",

                onPressed: () {
                  Get.to(ReportSuccessScreen());
                },
                // onPressed: controller.submitReport,
              ),
              // ElevatedButton(
              //   onPressed: controller.submitReport,
              //   child: Text('Submit Report'),
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size(double.infinity, 50),
              //   ),
              // ),
              SizedBox(height: 8),
              Text(
                'Your location will be sent privately to licensed rehab centers. Other users cannot see your report.',
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
