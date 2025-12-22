import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/wildlifecenterdashboard/controller/report_controller.dart';
import 'package:wildlife/features/wildlifecenterdashboard/model/wild_life_report_model.dart';
import 'package:wildlife/features/wildlifecenterdashboard/presentations/screens/add_report_screen.dart';
import 'package:wildlife/features/wildlifecenterdashboard/presentations/screens/center_profile_screen.dart';
import 'package:wildlife/features/wildlifecenterdashboard/presentations/screens/center_settings_screen.dart';
import 'package:wildlife/features/wildlifecenterdashboard/presentations/widgets/report_card.dart';

class CenterDashboardScreen extends StatelessWidget {
  const CenterDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reportController = Get.put(ReportsController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Wildlife Center Dashboard'),
        actions: [
          IconButton(
            tooltip: 'Profile',
            icon: const Icon(Icons.person_outline),
            onPressed: () => Get.to(() => const CenterProfileScreen()),
          ),
          IconButton(
            tooltip: 'Settings',
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Get.to(() => const CenterSettingsScreen()),
          ),
        ],
      ),
      body: Obx(() {
        if (reportController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (reportController.reports.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'No reports found',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => reportController.loadReports(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reload Reports'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => await reportController.loadReports(),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: reportController.reports.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ReportCard(report: reportController.reports[index]),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () async {
          final newReport = await Get.to<WildlifeReportModel>(
            () => AddReportScreen(),
          );
          if (newReport != null) {
            reportController.addReport(newReport);
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
        tooltip: 'Add New Report',
      ),
    );
  }
}
