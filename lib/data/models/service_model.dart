import 'package:flutter/material.dart';

class ServiceModel {
  final String id;
  final int iconCode;
  final String titulo;
  final String subTitulo;
  final String tpm;
  final double valor;
  final String descricao;

  ServiceModel({
    required this.id,
    required this.iconCode,
    required this.titulo,
    required this.subTitulo,
    required this.tpm,
    required this.valor,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'iconCode': iconCode,
      'titulo': titulo,
      'subTitulo': subTitulo,
      'tmp': tpm,
      'valor': valor,
      'descricao': descricao,
    };
  }

  factory ServiceModel.fromMap(String id, Map<String, dynamic> map) {
    return ServiceModel(
      id: id,
      iconCode: map['iconCode'] ?? Icons.android.codePoint,
      titulo: map['titulo'] ?? '',
      subTitulo: map['subTitulo'] ?? '',
      tpm: map['tpm'] ?? '',
      valor: map['valor'] ?? 0.0,
      descricao: map['descricao'] ?? '',
    );
  }
  IconData get icon => IconData(iconCode, fontFamily: 'MaterialIcons');
}
