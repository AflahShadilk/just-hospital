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

  HospitalModel({
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

  factory HospitalModel.fromFirestore(
    String documentId,
    Map<String, dynamic> data,
  ) {
    return HospitalModel(
      id: documentId,
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      specialisations:
          List<String>.from(data['specialisations'] ?? []),
      address: data['address'] ?? '',
      phone: data['phone'] ?? '',
      description: data['description'] ?? '',
    );
  }
}