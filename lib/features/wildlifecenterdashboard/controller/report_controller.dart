import 'package:get/get.dart';
import 'package:wildlife/features/wildlifecenterdashboard/model/wild_life_report_model.dart';
import 'package:wildlife/features/wildlifecenterdashboard/services/report_services.dart';

class ReportsController extends GetxController {
  final service = MockReportsService();
  var reports = <WildlifeReportModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadReports();
  }

  void loadReports() {
    reports.value = service.getReports();
  }
}
