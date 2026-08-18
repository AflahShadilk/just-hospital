
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:justhospital/models/hospital_model.dart';

class HospitalService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Stream<List<HospitalModel>> getHospitals() {
    return _firestore
        .collection('hospitals')
        .snapshots()
        .map(
          (snapshot) {
            return snapshot.docs.map(
              (document) {
                return HospitalModel.fromFirestore(
                  document.id,
                  document.data(),
                );
              },
            ).toList();
          },
        );
  }
}