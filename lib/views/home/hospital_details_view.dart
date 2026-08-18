import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justhospital/core/app/theme/app_theme.dart';
import 'package:justhospital/core/helpers/contact_helper.dart';
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
                    hospital.description.isEmpty
                        ? 'No description available.'
                        : hospital.description,
                    style: Get.textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      color: AppTheme.secondaryTextColor,
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            hospital.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.headlineMedium,
          ),
        ),

        if (hospital.rating > 0) ...[
          const SizedBox(width: 12),
          ratingBadge(),
        ],
      ],
    );
  }

  Widget locations() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 20,
          color: AppTheme.secondaryTextColor,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            hospital.location,
            style: Get.textTheme.bodyLarge?.copyWith(
              color: AppTheme.secondaryTextColor,
            ),
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.borderColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppTheme.primaryLightColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.location_on_outlined,
              size: 21,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              hospital.address.isEmpty
                  ? 'Address not available.'
                  : hospital.address,
              style: Get.textTheme.bodyLarge?.copyWith(
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget phone() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.borderColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppTheme.primaryLightColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.phone_outlined,
              size: 21,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              hospital.phone.isEmpty
                  ? 'Phone number not available.'
                  : hospital.phone,
              style: Get.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
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
        onPressed: hospital.phone.trim().isEmpty
            ? null
            : () async {
                try {
                  await ContactHelper.callHospital(
                    hospital.phone,
                  );
                } catch (_) {
                  Get.snackbar(
                    'Unable to call',
                    'Could not open the phone dialer.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
        icon: const Icon(
          Icons.phone_rounded,
        ),
        label: const Text(
          'Call Hospital',
        ),
      ),
    );
  }

  Widget ratingBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star_rounded,
            size: 18,
            color: Colors.amber,
          ),
          const SizedBox(width: 3),
          Text(
            hospital.rating.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF7A5A00),
            ),
          ),
        ],
      ),
    );
  }
}