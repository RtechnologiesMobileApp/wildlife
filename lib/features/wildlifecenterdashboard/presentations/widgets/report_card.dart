import 'package:flutter/material.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/wildlifecenterdashboard/model/wild_life_report_model.dart';

class ReportCard extends StatelessWidget {
  final WildlifeReportModel report;

  const ReportCard({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softgreen,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail Image (if available)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: report.photo != null && report.photo!.isNotEmpty
                ? Image.network(
                    report.photo!,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.pets,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
          ),

          const SizedBox(width: 16),

          // Report Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  report.animal,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "Condition: ${report.condition}",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),

                const SizedBox(height: 4),

                Text(
                  "Time: ${report.time}",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 4),

                Text(
                  "Location: ${report.location}",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
