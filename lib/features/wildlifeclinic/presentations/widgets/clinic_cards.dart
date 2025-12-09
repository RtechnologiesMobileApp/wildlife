import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wildlife/features/wildlifeclinic/model/clicnic_model.dart';

class ClinicCard extends StatelessWidget {
  final ClinicModel clinic;

  const ClinicCard({super.key, required this.clinic});

  void openMaps() async {
    final uri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=${clinic.name}",
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Clinic Name
            Text(
              clinic.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 6),

            // Distance
            Row(
              children: [
                Icon(Icons.location_on, size: 18, color: Colors.green),
                SizedBox(width: 6),
                Text(clinic.distance),
              ],
            ),

            SizedBox(height: 6),

            // Phone
            Row(
              children: [
                Icon(Icons.phone, size: 18, color: Colors.blue),
                SizedBox(width: 6),
                Text(clinic.phone),
              ],
            ),

            SizedBox(height: 12),

            // Directions Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: openMaps,
                icon: Icon(Icons.directions),
                label: Text("Directions"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
