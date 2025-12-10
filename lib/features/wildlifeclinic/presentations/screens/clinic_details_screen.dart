import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/wildlifeclinic/model/clicnic_model.dart';

class ClinicDetailsScreen extends StatelessWidget {
  final ClinicModel clinic;

  const ClinicDetailsScreen({super.key, required this.clinic});

  void _callClinic() async {
    final uri = Uri.parse("tel:${clinic.phone.replaceAll(' ', '')}");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _openMaps() async {
    final uri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=${clinic.name}",
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clinic Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Section with Icon
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary.withValues(alpha: 0.8), AppColors.primary.withValues(alpha: 0.5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 8),
                      ],
                    ),
                    child: const Icon(Icons.local_hospital, size: 50, color: AppColors.primary),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    clinic.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        "${clinic.rating ?? 4.0}",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description
                  _buildSectionCard(
                    title: "About",
                    icon: Icons.info_outline,
                    child: Text(
                      clinic.description,
                      style: const TextStyle(fontSize: 14, height: 1.6, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Distance & Contact
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoBox(
                          icon: Icons.location_on,
                          label: "Distance",
                          value: clinic.distance,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildInfoBox(
                          icon: Icons.phone,
                          label: "Phone",
                          value: clinic.phone,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Address
                  _buildSectionCard(
                    title: "Address",
                    icon: Icons.home,
                    child: Text(
                      clinic.address,
                      style: const TextStyle(fontSize: 14, height: 1.6, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Hours
                  _buildSectionCard(
                    title: "Hours of Operation",
                    icon: Icons.access_time,
                    child: Text(
                      clinic.hours,
                      style: const TextStyle(fontSize: 14, height: 1.6, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Services
                  _buildSectionCard(
                    title: "Services Offered",
                    icon: Icons.medical_services,
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: clinic.services.split(", ").map((service) {
                        return Chip(
                          label: Text(service, style: const TextStyle(fontSize: 12)),
                          backgroundColor: AppColors.softgreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Action Buttons
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: _callClinic,
                      icon: const Icon(Icons.phone, color: Colors.white),
                      label:  Text('Call Clinic',style: const TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: _openMaps,
                      icon: const Icon(Icons.directions, color: AppColors.primary),
                      label: const Text('Get Directions',style: TextStyle(color: AppColors.primary),),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primary, width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      color: AppColors.softgreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Card(
      color: color.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 18),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
