class HospitalModel {
  final String id;
  final String name;
  final String location;
  final String image;
  final double rating;
  final List<String> specialisations;
  final String address;
  final String phone;
  final String description;

  HospitalModel({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.rating,
    required this.specialisations,
    required this.address,
    required this.phone,
    required this.description,
  });
}