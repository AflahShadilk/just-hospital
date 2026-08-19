import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalSeeder {
  HospitalSeeder._();

  static final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  static Future<void> seed() async {
    final hospitals = <String, Map<String, dynamic>>{
      'aster_mims': {
        'name': 'Aster MIMS Hospital',
        'location': 'Govindapuram, Kozhikode',
        'imageUrl': 'assets/hospitals/MIMS_Kozhikode.jpg',
        'rating': 0,
        'specialisations': [
          'Cardiology',
          'Neurosciences',
          'Orthopaedics',
          'Oncology',
          'Pulmonology',
        ],
        'address':
            'Mini By-pass Road, Govindapuram P.O., Kozhikode, Kerala 673016',
        'phone': '+91 495 2488 222',
        'description':
            'Aster MIMS Hospital is a multispecialty hospital providing comprehensive healthcare services across a wide range of medical specialties.',
      },

      'baby_memorial': {
        'name': 'Baby Memorial Hospital',
        'location': 'Arayidathupalam, Kozhikode',
        'imageUrl': 'assets/hospitals/baby memorial.jpg',
        'rating': 0,
        'specialisations': [
          'Cardiology',
          'Oncology',
          'Orthopaedics',
          'Neurology',
          'Nephrology',
        ],
        'address':
            'Indira Gandhi Road, Arayidathupalam, Kozhikode, Kerala 673004',
        'phone': '0495 277 7777',
        'description':
            'Baby Memorial Hospital is a multispecialty healthcare institution offering advanced medical and surgical services across multiple specialties.',
      },

      'iqraa': {
        'name':
            'IQRAA International Hospital & Research Centre',
        'location': 'Kozhikode, Kerala',
        'imageUrl': 'iqraa-international-hospital-research-centre-kozhikode-hospitals-qkm0gajy77.avif',
        'rating': 0,
        'specialisations': [
          'Cardiology',
          'Nephrology',
          'Neurology',
          'Oncology',
          'Orthopaedics',
        ],
        'address':
            'IQRAA International Hospital and Research Centre, Kozhikode, Kerala, India',
        'phone': '0495 2379100',
        'description':
            'IQRAA International Hospital & Research Centre provides multispecialty healthcare services with departments covering a wide range of medical needs.',
      },

      'meitra': {
        'name': 'Meitra Hospital',
        'location': 'Edakkad, Kozhikode',
        'imageUrl': 'assets/hospitals/meitra hospital.jpg',
        'rating': 0,
        'specialisations': [
          'Heart & Vascular',
          'Bone Joint & Spine',
          'Neurosciences',
          'Gastro Sciences',
          'Nephro-Urosciences',
        ],
        'address':
            'Building No. 38/2208-B, Karaparamba - Kunduparamba, Mini Bypass Rd, Edakkad, Kerala 673005, India',
        'phone': '+91 495 7123456',
        'description':
            'Meitra Hospital is a multispecialty hospital focused on advanced and patient-centred healthcare services.',
      },

      'starcare': {
        'name': 'Starcare Hospital Kozhikode',
        'location': 'Thondayad, Kozhikode',
        'imageUrl': 'assets/hospitals/starcare hospital.jpg',
        'rating': 0,
        'specialisations': [
          'Cardiology',
          'Orthopaedics',
          'Gastroenterology',
          'Nephrology',
          'Obstetrics & Gynaecology',
        ],
        'address':
            'NH Bypass Junction, Near Thondayad, Kozhikode, Kerala 673017',
        'phone': '0495 3069000',
        'description':
            'Starcare Hospital is a multispecialty hospital providing comprehensive diagnostic, medical, surgical and emergency healthcare services.',
      },

      'malabar': {
        'name': 'Malabar Hospital',
        'location': 'Eranhipalam, Kozhikode',
        'imageUrl': 'assets/hospitals/malabar hospital.jpg',
        'rating': 0,
        'specialisations': [
          'Urology',
          'Oncology',
          'Cardiology',
          'Gastroenterology',
          'Obstetrics & Gynaecology',
        ],
        'address':
            'Eranjipalam Junction, Eranjipalam, Kozhikode, Kerala 673020',
        'phone': '0495 238 7000',
        'description':
            'Malabar Hospital provides comprehensive medical care with centres of excellence across several important clinical specialties.',
      },

      'fathima': {
        'name': 'Fathima Hospital',
        'location': 'Bank Road, Kozhikode',
        'imageUrl': 'assets/hospitals/fathima hospital.jpg',
        'rating': 0,
        'specialisations': [
          'Cardiology',
          'Paediatrics & Neonatology',
          'Neurology',
          'Nephrology',
          'Urology',
        ],
        'address':
            'Bank Road, Kozhikode, Kerala 673001',
        'phone': '+91 4952334444',
        'description':
            'Fathima Hospital provides comprehensive healthcare services across multiple medical and surgical specialties.',
      },

      'government_general': {
        'name': 'Government General Hospital',
        'location': 'Calicut Beach, Kozhikode',
        'imageUrl':
            'assets/hospitals/goverment general.jpg',
        'rating': 0,
        'specialisations': [
          'General Medicine',
          'Emergency Medicine',
          'General Surgery',
          'Obstetrics & Gynaecology',
          'Paediatrics',
        ],
        'address':
            'Red Cross Road, Calicut Beach, Kozhikode, Kerala',
        'phone': '0495 2365917',
        'description':
            'Government General Hospital Kozhikode provides general and emergency healthcare services to the community.',
      },
    };

    final batch = _firestore.batch();

    for (final entry in hospitals.entries) {
      final document = _firestore
          .collection('hospitals')
          .doc(entry.key);

      batch.set(
        document,
        entry.value,
        SetOptions(merge: true),
      );
    }

    await batch.commit();
  }
}