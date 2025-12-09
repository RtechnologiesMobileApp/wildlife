import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/features/wildlifeclinic/controller/clinic_controller.dart';
import 'package:wildlife/features/wildlifeclinic/presentations/widgets/clinic_cards.dart';

class WildlifeClinicsScreen extends StatelessWidget {
  final ClinicsController controller = Get.put(ClinicsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.map, color: Colors.green),
            SizedBox(width: 8),
            Text("Wildlife Clinics Near You"),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search clinics...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onChanged: (val) => controller.searchQuery.value = val,
            ),

            SizedBox(height: 16),

            // Clinic List
            Expanded(
              child: Obx(() {
                var filtered = controller.clinics.where((clinic) {
                  return clinic.name.toLowerCase().contains(
                    controller.searchQuery.value.toLowerCase(),
                  );
                }).toList();

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (_, i) => ClinicCard(clinic: filtered[i]),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
