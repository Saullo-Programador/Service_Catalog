import 'package:flutter/material.dart';
import 'package:jobs_app/data/models/service_model.dart';
import 'package:jobs_app/domain/repository/service_repository.dart';

class ServiceController extends ChangeNotifier {
  final ServiceRepository repository;

  List<ServiceModel> items = [];

  ServiceController(this.repository) {
    _listenServices();
  }

  bool isLoading = false;

  void _listenServices() {
    isLoading = true;
    notifyListeners();

    repository.getServices().listen((list) {
      items = list;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> refresh() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 800));

    isLoading = false;
    notifyListeners();
  }

  Future<void> addService(ServiceModel service) async {
    if (service.titulo.isEmpty ||
        service.subTitulo.isEmpty ||
        service.valor <= 0 ||
        service.descricao.isEmpty) {
      throw Exception('Preencha todos os campos corretamente');
    }

    isLoading = true;
    notifyListeners();

    try {
      await repository.addService(service);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateService(String id, ServiceModel service) async {
    await repository.updateService(id, service);
  }

  Future<void> deleteService(String id) async {
    await repository.deleteService(id);
  }
}
