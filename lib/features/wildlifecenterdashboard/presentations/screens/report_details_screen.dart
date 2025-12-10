import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/wildlifecenterdashboard/model/wild_life_report_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportDetailsScreen extends StatelessWidget {
  final WildlifeReportModel report;

  const ReportDetailsScreen({super.key, required this.report});

  void _openMaps() async {
    final uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(report.location)}');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Photo / hero
            report.photo != null && report.photo!.isNotEmpty
                ? Image.network(report.photo!, height: 260, width: double.infinity, fit: BoxFit.cover)
                : Container(
                    height: 220,
                    color: AppColors.softgreen,
                    child: const Center(child: Icon(Icons.pets, size: 80, color: Colors.white)),
                  ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          report.animal,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Chip(
                        label: Text(report.condition),
                        backgroundColor: AppColors.primary.withValues(alpha: 0.12),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(report.time, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text('Location', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  Text(report.location, style: const TextStyle(fontSize: 14)),

                  const SizedBox(height: 18),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: _openMaps,
                      icon: const Icon(Icons.directions, color: Colors.white),
                      label: const Text('Open in Maps', style: TextStyle(color: Colors.white)),
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
                    child: OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Close', style: TextStyle(color: AppColors.primary)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
