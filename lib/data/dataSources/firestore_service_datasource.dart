import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_app/data/models/service_model.dart';

class FirestoreServiceDatasource {
  final FirebaseFirestore firestore;

  FirestoreServiceDatasource(this.firestore);

  Future<void> addService(ServiceModel service) async {
    await firestore.collection('services').add(service.toMap());
  }

  Stream<List<ServiceModel>> getServices() {
    return firestore
        .collection('services')
        .snapshots()
        .map(
          (snapshots) => snapshots.docs
              .map((doc) => ServiceModel.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }

  Future<void> updateService(String id, ServiceModel service) async {
    await firestore.collection('services').doc(id).update(service.toMap());
  }

  Future<void> deleteService(String id) async {
    await firestore.collection('services').doc(id).delete();
  }
}
