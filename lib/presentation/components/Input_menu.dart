import 'package:flutter/material.dart';

class InputMenu extends StatefulWidget {
  final Function(String)? onChanged;

  const InputMenu({super.key, required this.onChanged});

  @override
  State<InputMenu> createState() => _InputMenuState();
}

class _InputMenuState extends State<InputMenu> {
  final TextEditingController controller = TextEditingController();
  String? selectedValue;

  List<String> get incomeTPM => [
    "30 Min",
    "1 Hora",
    "1h e 30m",
    "3 Hora",
    "5 Hora",
    "1 Dia ",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        child: Center(
          child: DropdownMenu<String>(
            width: double.infinity,
            textStyle: TextStyle(color: Colors.black),
            controller: controller,
            label: Text('Tempo Médio', style: const TextStyle(color: Colors.black)),
            onSelected: (String? value) {
              setState(() => selectedValue = value);
              widget.onChanged?.call(value ?? "");
            },
          
            menuStyle: MenuStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
          
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
          
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.5,
                ),
              ),
          
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorScheme.of(context).error),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              labelStyle: const TextStyle(color: Colors.black),
              floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
            ),
            dropdownMenuEntries: incomeTPM.map((item) {
              return DropdownMenuEntry<String>(
                value: item,
                label: item,
                style: MenuItemButton.styleFrom(foregroundColor: Colors.black),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
