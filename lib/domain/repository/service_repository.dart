import 'package:jobs_app/data/models/service_model.dart';

abstract interface class ServiceRepository {
  Future<void> addService(ServiceModel service);
  Stream<List<ServiceModel>> getServices();
  Future<void> updateService(String id, ServiceModel service);
  Future<void> deleteService(String id);
}
