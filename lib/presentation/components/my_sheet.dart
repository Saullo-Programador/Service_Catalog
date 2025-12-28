import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MySheet extends StatelessWidget {
  final IconData icon;
  final double valor;
  final String titulo;
  final String subTitulo;
  final String duracao;
  final String descricao;

  const MySheet({
    super.key,
    required this.valor,
    required this.duracao,
    required this.titulo,
    required this.subTitulo,
    required this.descricao, 
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (_, controller) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Material(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15),
                        child: Icon(
                          icon, // ou settings
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        titulo,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        subTitulo,
                        style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TPM: $duracao',
                        style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                      ),
                      Text(
                        'R\$ ${NumberFormat.currency(locale: 'pt_BR', symbol: '').format(valor)}',
                        style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Descrição: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5),
                Text(
                  descricao,
                  style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
