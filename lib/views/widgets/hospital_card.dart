import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justhospital/models/hospital_model.dart';
import 'hospital_image.dart';
import 'specialisation_chip.dart';

class HospitalCard extends StatelessWidget {
  final HospitalModel hospital;
  final VoidCallback? onTap;

  const HospitalCard({
    super.key,
    required this.hospital,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            HospitalImage(
              imageUrl: hospital.imageUrl,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    hospital.name,
                    style: Get.textTheme.titleLarge,
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: Color(0xFF6B7280),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          hospital.location,
                          style:
                              Get.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),

                  if (hospital.rating > 0) ...[
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 20,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          hospital.rating
                              .toStringAsFixed(1),
                          style:
                              Get.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],

                  if (hospital
                      .specialisations.isNotEmpty) ...[
                    const SizedBox(height: 14),

                    Text(
                      'Specialisations',
                      style:
                          Get.textTheme.titleMedium,
                    ),

                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: hospital
                          .specialisations
                          .map(
                            (specialisation) {
                              return SpecialisationChip(
                                label:
                                    specialisation,
                              );
                            },
                          )
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}