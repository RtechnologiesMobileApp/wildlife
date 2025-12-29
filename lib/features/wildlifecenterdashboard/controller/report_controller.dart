import 'package:get/get.dart';
import 'package:wildlife/features/wildlifecenterdashboard/model/wild_life_report_model.dart';
import 'package:wildlife/features/wildlifecenterdashboard/services/report_services.dart';

class ReportsController extends GetxController {
  var isLoading = false.obs;
  final service = MockReportsService();
  var reports = <WildlifeReportModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadReports();
  }

  Future<void> loadReports() async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 1));
      reports.value = service.getReports();
    } finally {
      isLoading.value = false;
    }
  }

  void addReport(WildlifeReportModel report) {
    reports.insert(0, report); // add to top of list
  }
}
