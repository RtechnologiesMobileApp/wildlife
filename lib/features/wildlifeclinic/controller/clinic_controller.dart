import 'package:get/get.dart';
import 'package:wildlife/features/wildlifeclinic/model/clicnic_model.dart';

class ClinicsController extends GetxController {
  var searchQuery = ''.obs;

  var clinics = <ClinicModel>[
    ClinicModel(
      name: "Green Valley Wildlife Center",
      distance: "2.4 miles away",
      phone: "+1 555 123 456",
      address: "1234 Forest Lane, Greenville, CA 90210",
      hours: "Mon-Fri: 9:00 AM - 6:00 PM, Sat-Sun: 10:00 AM - 4:00 PM",
      services: "Injury treatment, Rehabilitation, Surgical care, Dietary support",
      rating: 4.8,
      description: "Green Valley Wildlife Center is a leading facility specializing in the rehabilitation of injured and orphaned wildlife. Our team of experienced veterinarians and wildlife specialists provide comprehensive care across all native species.",
    ),
    ClinicModel(
      name: "Forest Haven Rehab Clinic",
      distance: "5.1 miles away",
      phone: "+1 555 987 654",
      address: "5678 Pine Road, Forestville, CA 90211",
      hours: "Mon-Sun: 8:00 AM - 8:00 PM",
      services: "Emergency care, Recovery monitoring, Physical therapy, Educational programs",
      rating: 4.6,
      description: "Forest Haven Rehab Clinic offers 24/7 emergency response for injured wildlife. We pride ourselves on innovative rehabilitation techniques and high success rates in animal recovery.",
    ),
    ClinicModel(
      name: "Riverbank Animal Rescue",
      distance: "7.3 miles away",
      phone: "+1 555 221 330",
      address: "9101 Riverside Ave, Riverton, CA 90212",
      hours: "Tue-Sun: 10:00 AM - 5:00 PM (Closed Mondays)",
      services: "Temporary shelter, Medical assessment, Release preparation, Community outreach",
      rating: 4.5,
      description: "Riverbank Animal Rescue is dedicated to protecting wildlife along our region's waterways. We work closely with local communities to rescue, rehabilitate, and release animals back into their natural habitats.",
    ),
  ].obs;
}
