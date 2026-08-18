class HospitalModel {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final double rating;
  final List<String> specialisations;
  final String address;
  final String phone;
  final String description;

  const HospitalModel({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.specialisations,
    required this.address,
    required this.phone,
    required this.description,
  });

  factory HospitalModel.fromMap(
    String id,
    Map<String, dynamic> map,
  ) {
    return HospitalModel(
      id: id,
      name: map['name'] as String? ?? '',
      location: map['location'] as String? ?? '',
      imageUrl: map['imageUrl'] as String? ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 0,
      specialisations: List<String>.from(
        map['specialisations'] ?? const [],
      ),
      address: map['address'] as String? ?? '',
      phone: map['phone'] as String? ?? '',
      description: map['description'] as String? ?? '',
    );
  }
}