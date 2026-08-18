import 'package:get/get.dart';
import 'package:justhospital/data/hospital_data.dart';
import 'package:justhospital/models/hospital_model.dart';

class HospitalController extends GetxController {
  final RxList<HospitalModel> hospitals =
      <HospitalModel>[].obs;

  final RxList<HospitalModel> filteredHospitals =
      <HospitalModel>[].obs;

  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();

    loadHospitals();
  }

  void loadHospitals() {
    hospitals.assignAll(HospitalData.hospitals);

    filteredHospitals.assignAll(hospitals);
  }

  void searchHospitals(String query) {
    searchQuery.value = query;

    if (query.trim().isEmpty) {
      filteredHospitals.assignAll(hospitals);
      return;
    }

    final searchText = query.toLowerCase().trim();

    final results = hospitals.where((hospital) {
      final name = hospital.name.toLowerCase();
      final location = hospital.location.toLowerCase();

      final specialisations = hospital.specialisations
          .map((specialisation) => specialisation.toLowerCase())
          .join(' ');

      return name.contains(searchText) ||
          location.contains(searchText) ||
          specialisations.contains(searchText);
    }).toList();

    filteredHospitals.assignAll(results);
  }

  void clearSearch() {
    searchQuery.value = '';

    filteredHospitals.assignAll(hospitals);
  }
}