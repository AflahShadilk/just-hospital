import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:justhospital/data/hospital_service.dart';
import 'package:justhospital/models/hospital_model.dart';


class HospitalController extends GetxController {
  final HospitalService _hospitalService = HospitalService();

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
    _listenToHospitals();
  }

  void _listenToHospitals() {
    isLoading.value = true;
    errorMessage.value = '';

    _hospitalSubscription =
        _hospitalService.watchHospitals().listen(
      (data) {
        hospitals.assignAll(data);
        filteredHospitals.assignAll(data);

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
    final value = query.trim().toLowerCase();

    if (value.isEmpty) {
      filteredHospitals.assignAll(hospitals);
      return;
    }

    final result = hospitals.where((hospital) {
      final name = hospital.name.toLowerCase();
      final location = hospital.location.toLowerCase();

      final specialisations = hospital.specialisations
          .join(' ')
          .toLowerCase();

      return name.contains(value) ||
          location.contains(value) ||
          specialisations.contains(value);
    }).toList();

    filteredHospitals.assignAll(result);
  }

  @override
  void onClose() {
    _hospitalSubscription?.cancel();
    super.onClose();
  }
}