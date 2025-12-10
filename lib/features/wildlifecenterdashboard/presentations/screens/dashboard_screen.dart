import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/features/wildlifecenterdashboard/controller/report_controller.dart';
import 'package:wildlife/features/wildlifecenterdashboard/presentations/widgets/report_card.dart';
import 'package:wildlife/features/wildlifecenterdashboard/presentations/screens/center_profile_screen.dart';
import 'package:wildlife/features/wildlifecenterdashboard/presentations/screens/center_settings_screen.dart';

class CenterDashboardScreen extends StatelessWidget {
  const CenterDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reportController = Get.put(ReportsController());

    return Scaffold(
      appBar: AppBar(
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
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: reportController.reports.length,
          itemBuilder: (context, index) {
            return ReportCard(report: reportController.reports[index]);
          },
        );
      }),
    );
  }
}
