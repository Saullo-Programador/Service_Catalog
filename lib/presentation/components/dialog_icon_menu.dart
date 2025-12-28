import 'package:flutter/material.dart';

class DialogIconMenu extends StatefulWidget {

  final Function(IconData) onIconSelected;
  const DialogIconMenu({
    super.key,
    required this.onIconSelected,
  });

  @override
  State<DialogIconMenu> createState() => _DialogIconMenu();
}

class _DialogIconMenu extends State<DialogIconMenu> {
  final List<IconData> iconsList = [
    Icons.work,
    Icons.settings,
    Icons.computer,
    Icons.build,
    Icons.design_services,
    Icons.home_repair_service,
    Icons.security,
    Icons.support_agent,
  ];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Escolha um ícone'),
      content: SizedBox(
        width: double.maxFinite,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: iconsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                widget.onIconSelected(iconsList[index]);
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  iconsList[index],
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
