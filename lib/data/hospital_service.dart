import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:justhospital/models/hospital_model.dart';


class HospitalService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Stream<List<HospitalModel>> watchHospitals() {
    return _firestore
        .collection('hospitals')
        .orderBy('name')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((document) {
        return HospitalModel.fromMap(
          document.id,
          document.data(),
        );
      }).toList();
    });
  }
}