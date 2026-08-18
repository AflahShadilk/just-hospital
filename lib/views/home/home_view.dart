import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justhospital/controllers/hospital_controller.dart';
import 'package:justhospital/views/widgets/empty_hospital_state.dart';
import 'package:justhospital/views/widgets/home_header.dart';
import 'package:justhospital/views/widgets/hospital_search_field.dart';
import 'package:justhospital/views/widgets/error_state.dart';
import 'package:justhospital/views/widgets/hospital_card.dart';


class HomeView extends GetView<HospitalController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),

            HospitalSearchField(
              onChanged: controller.searchHospitals,
            ),

            const SizedBox(height: 8),

            Expanded(
              child: buildHospitalList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHospitalList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (controller.errorMessage.value.isNotEmpty) {
        return ErrorState(
          message: controller.errorMessage.value,
        );
      }

      if (controller.filteredHospitals.isEmpty) {
        return const EmptyHospitalState();
      }

      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(
          20,
          12,
          20,
          24,
        ),
        itemCount:
            controller.filteredHospitals.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final hospital =
              controller.filteredHospitals[index];

          return HospitalCard(
            hospital: hospital,
          );
        },
      );
    });
  }
}