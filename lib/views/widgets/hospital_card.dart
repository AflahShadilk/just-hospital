import 'package:flutter/material.dart';
import 'package:justhospital/core/app/theme/app_theme.dart';
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
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HospitalImage(
              imageUrl: hospital.imageUrl,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                15,
                16,
                16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hospital name + rating
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          hospital.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),

                      if (hospital.rating > 0) ...[
                        const SizedBox(width: 10),
                        buildRating(),
                      ],
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Location
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: AppTheme.secondaryTextColor,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          hospital.location,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),

                  // Specialisations
                  if (hospital
                      .specialisations
                      .isNotEmpty) ...[
                    const SizedBox(height: 16),

                    Text(
                      'Specialisations',
                      style: theme.textTheme.titleMedium,
                    ),

                    const SizedBox(height: 9),

                    buildSpecialisations(),
                  ],

                  const SizedBox(height: 16),

                  // Details action
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end,
                    children: [
                      Text(
                        'View details',
                        style:
                            theme.textTheme.titleMedium
                                ?.copyWith(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(width: 4),

                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 19,
                        color: AppTheme.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRating() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E6),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star_rounded,
            size: 17,
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

  Widget buildSpecialisations() {
    const int maxVisibleSpecialisations = 3;

    final visibleSpecialisations =
        hospital.specialisations
            .take(maxVisibleSpecialisations)
            .toList();

    final remainingCount =
        hospital.specialisations.length -
            visibleSpecialisations.length;

    return Wrap(
      spacing: 7,
      runSpacing: 7,
      children: [
        ...visibleSpecialisations.map(
          (specialisation) {
            return SpecialisationChip(
              label: specialisation,
            );
          },
        ),

        if (remainingCount > 0)
          _buildMoreChip(remainingCount),
      ],
    );
  }

  Widget _buildMoreChip(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '+$count more',
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppTheme.secondaryTextColor,
        ),
      ),
    );
  }
}