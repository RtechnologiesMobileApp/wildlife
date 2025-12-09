import 'package:wildlife/features/wildlifecenterdashboard/model/wild_life_report_model.dart';

class MockReportsService {
  List<WildlifeReportModel> getReports() {
    return [
      WildlifeReportModel(
        animal: 'Injured Hawk',
        condition: 'Moderate',
        time: '12 minutes ago',
        location: 'Green Valley Park',
        photo: null,
      ),
      WildlifeReportModel(
        animal: 'Baby Deer',
        condition: 'Critical',
        time: '30 minutes ago',
        location: 'Riverbend Trail',
        photo: null,
      ),
    ];
  }
}
