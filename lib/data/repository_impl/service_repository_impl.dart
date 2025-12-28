import 'package:jobs_app/data/dataSources/firestore_service_datasource.dart';
import 'package:jobs_app/data/models/service_model.dart';
import 'package:jobs_app/domain/repository/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final FirestoreServiceDatasource datasource;

  ServiceRepositoryImpl(this.datasource);

  @override
  Future<void> addService(ServiceModel service) async {
    await datasource.addService(service);
  }

  @override
  Stream<List<ServiceModel>> getServices() {
    return datasource.getServices();
  }

  @override
  Future<void> deleteService(String id) async {
    return await datasource.deleteService(id);
  }

  @override
  Future<void> updateService(String id, ServiceModel service) async {
    return await datasource.updateService(id, service);
  }
}
