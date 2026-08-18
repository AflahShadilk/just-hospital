import '../models/hospital_model.dart';

class HospitalData {
  HospitalData._();

  static final List<HospitalModel> hospitals = [
    HospitalModel(
      id: 'hospital_001',
      name: 'Aster MIMS Hospital',
      location: 'Kozhikode',
      image: 'assets/images/hospital_1.jpg',
      rating: 4.5,
      specialisations: [
        'Cardiology',
        'Neurology',
        'Orthopaedics',
      ],
      address: 'Mini Bypass Road, Govindapuram, Kozhikode, Kerala',
      phone: '+91 495 123 4567',
      description:
          'A multi-speciality hospital providing comprehensive healthcare services across various medical departments.',
    ),

    HospitalModel(
      id: 'hospital_002',
      name: 'Amrita Hospital',
      location: 'Kochi',
      image: 'assets/images/hospital_2.jpg',
      rating: 4.6,
      specialisations: [
        'Cardiology',
        'Oncology',
        'Neurosurgery',
      ],
      address: 'Ponekkara, AIMS P.O., Kochi, Kerala',
      phone: '+91 484 280 1234',
      description:
          'A major multi-speciality healthcare institution offering advanced medical treatment and specialised care.',
    ),

    HospitalModel(
      id: 'hospital_003',
      name: 'Rajagiri Hospital',
      location: 'Kochi',
      image: 'assets/images/hospital_3.jpg',
      rating: 4.5,
      specialisations: [
        'Cardiology',
        'Orthopaedics',
        'Gastroenterology',
      ],
      address: 'Chunangamvely, Aluva, Kochi, Kerala',
      phone: '+91 484 290 5000',
      description:
          'A multi-speciality hospital providing a wide range of medical and surgical services.',
    ),

    HospitalModel(
      id: 'hospital_004',
      name: 'Baby Memorial Hospital',
      location: 'Kozhikode',
      image: 'assets/images/hospital_4.jpg',
      rating: 4.4,
      specialisations: [
        'Cardiology',
        'Gastroenterology',
        'Neurology',
      ],
      address: 'Indira Gandhi Road, Kozhikode, Kerala',
      phone: '+91 495 272 3272',
      description:
          'A multi-speciality healthcare centre offering medical, surgical and diagnostic services.',
    ),

    HospitalModel(
      id: 'hospital_005',
      name: 'Lakeshore Hospital',
      location: 'Kochi',
      image: 'assets/images/hospital_5.jpg',
      rating: 4.5,
      specialisations: [
        'Cardiology',
        'Nephrology',
        'Orthopaedics',
      ],
      address: 'Nettoor, Maradu, Kochi, Kerala',
      phone: '+91 484 270 1032',
      description:
          'A multi-speciality hospital providing specialised healthcare and diagnostic services.',
    ),
  ];
}