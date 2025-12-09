import 'package:get/get.dart';
import 'package:wildlife/features/wildlifeclinic/model/clicnic_model.dart';

class ClinicsController extends GetxController {
  var searchQuery = ''.obs;

  var clinics = <ClinicModel>[
    ClinicModel(
      name: "Green Valley Wildlife Center",
      distance: "2.4 miles away",
      phone: "+1 555 123 456",
    ),
    ClinicModel(
      name: "Forest Haven Rehab Clinic",
      distance: "5.1 miles away",
      phone: "+1 555 987 654",
    ),
    ClinicModel(
      name: "Riverbank Animal Rescue",
      distance: "7.3 miles away",
      phone: "+1 555 221 330",
    ),
  ].obs;
}
