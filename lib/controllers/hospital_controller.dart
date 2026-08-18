import 'dart:async';
import 'package:get/get.dart';
import 'package:justhospital/data/hospital_data.dart';
import 'package:justhospital/models/hospital_model.dart';


class HospitalController extends GetxController {
  final HospitalService _hospitalService =
      HospitalService();

  final RxList<HospitalModel> hospitals =
      <HospitalModel>[].obs;

  final RxList<HospitalModel> filteredHospitals =
      <HospitalModel>[].obs;

  final RxBool isLoading = true.obs;

  final RxString errorMessage = ''.obs;

  StreamSubscription<List<HospitalModel>>?
      _hospitalSubscription;

  @override
  void onInit() {
    super.onInit();

    listenToHospitals();
  }

  void listenToHospitals() {
    isLoading.value = true;
    errorMessage.value = '';

    _hospitalSubscription =
        _hospitalService.getHospitals().listen(
      (hospitalList) {
        hospitals.assignAll(hospitalList);
        filteredHospitals.assignAll(hospitalList);

        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
        errorMessage.value =
            'Unable to load hospitals.';
      },
    );
  }

  void searchHospitals(String query) {
    final searchText = query.trim().toLowerCase();

    if (searchText.isEmpty) {
      filteredHospitals.assignAll(hospitals);
      return;
    }

    final results = hospitals.where(
      (hospital) {
        final name =
            hospital.name.toLowerCase();

        final location =
            hospital.location.toLowerCase();

        final specialisations =
            hospital.specialisations
                .join(' ')
                .toLowerCase();

        return name.contains(searchText) ||
            location.contains(searchText) ||
            specialisations.contains(searchText);
      },
    ).toList();

    filteredHospitals.assignAll(results);
  }

  @override
  void onClose() {
    _hospitalSubscription?.cancel();

    super.onClose();
  }
}