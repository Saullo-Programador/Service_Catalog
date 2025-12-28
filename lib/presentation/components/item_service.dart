import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobs_app/core/util/formatar.dart';

enum ServiceMenuAction { editar, deletar }

class ItemService extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final String title;
  final String subtitulo;
  final double valor;
  final IconData icon;
  final Color? color;

  const ItemService({
    super.key,
    required this.title,
    required this.subtitulo,
    required this.valor,
    required this.icon,
    this.color,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordas arredondadas
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: SizedBox(
          height: 80,
          width: double.infinity,
          child: Center(
            child: Row(
              children: [
                Card(
                  color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ), // Bordas arredondadas
                  ),
                  child: SizedBox(
                    width: 60,
                    child: Center(
                      child: Icon(icon, color: color ?? Colors.white, size: 28),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capitalize(title),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subtitulo,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            'R\$ ${NumberFormat.currency(locale: 'pt_BR', symbol: '').format(valor)}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert_rounded, size: 20),
                  onSelected: (action) {
                    if (action == ServiceMenuAction.editar) {
                      onEdit();
                    } else if (action == ServiceMenuAction.deletar) {
                      onDelete();
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: ServiceMenuAction.editar,
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 18),
                          SizedBox(width: 8),
                          Text('Editar'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: ServiceMenuAction.deletar,
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 18, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Deletar', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
