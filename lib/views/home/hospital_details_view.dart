import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justhospital/models/hospital_model.dart';
import 'package:justhospital/views/widgets/hospital_image.dart';
import 'package:justhospital/views/widgets/specialisation_chip.dart';

class HospitalDetailsView extends StatelessWidget {
  final HospitalModel hospital;

  const HospitalDetailsView({
    super.key,
    required this.hospital,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HospitalImage(
              imageUrl: hospital.imageUrl,
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hospitalName(),
                  const SizedBox(height: 8),
                  locations(),
                  const SizedBox(height: 12),
                  rating(),

                  const SizedBox(height: 24),

                  sectionTitle(
                    'Specialisations',
                  ),

                  const SizedBox(height: 12),

                  specialisations(),

                  const SizedBox(height: 28),

                  sectionTitle(
                    'About Hospital',
                  ),

                  const SizedBox(height: 10),

                  Text(
                    hospital.description,
                    style: Get.textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 28),

                  sectionTitle(
                    'Address',
                  ),

                  const SizedBox(height: 10),

                  address(),

                  const SizedBox(height: 24),

                  sectionTitle(
                    'Contact',
                  ),

                  const SizedBox(height: 10),

                  phone(),

                  const SizedBox(height: 28),

                  callButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget hospitalName() {
    return Text(
      hospital.name,
      style: Get.textTheme.headlineMedium,
    );
  }

  Widget locations() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 20,
          color: Color(0xFF6B7280),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            hospital.location,
            style: Get.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  Widget rating() {
    if (hospital.rating <= 0) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.amber,
          size: 22,
        ),
        const SizedBox(width: 5),
        Text(
          hospital.rating.toStringAsFixed(1),
          style: Get.textTheme.titleMedium,
        ),
      ],
    );
  }

  Widget specialisations() {
    if (hospital.specialisations.isEmpty) {
      return Text(
        'No specialisations available.',
        style: Get.textTheme.bodyMedium,
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 10,
      children: hospital.specialisations.map(
        (specialisation) {
          return SpecialisationChip(
            label: specialisation,
          );
        },
      ).toList(),
    );
  }

  Widget address() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 22,
          color: Color(0xFF1565C0),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            hospital.address,
            style: Get.textTheme.bodyLarge?.copyWith(
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget phone() {
    return Row(
      children: [
        const Icon(
          Icons.phone_outlined,
          size: 22,
          color: Color(0xFF1565C0),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            hospital.phone,
            style: Get.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: Get.textTheme.titleLarge,
    );
  }

  Widget callButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
        
        },
        icon: const Icon(Icons.phone),
        label: const Text('Call Hospital'),
      ),
    );
  }
}