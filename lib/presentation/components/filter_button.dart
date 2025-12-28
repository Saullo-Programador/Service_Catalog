import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onTap;
  const FilterButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60, 
      width: 60, 
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: const Icon(
            Icons.tune_rounded, // ou settings
            color: Colors.white,
            size: 26,
          ),
        )
      )
    );
  }
}
