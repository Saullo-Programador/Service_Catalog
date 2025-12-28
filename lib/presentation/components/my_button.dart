import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color? btnColor;
  final VoidCallback? onPressed;
  final double? fontsize;
  final Color? textColor;
  final double height;
  final double width;
  final IconData? icon;

  const MyButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.btnColor,
    this.height = 55.0,
    this.width = double.infinity,
    this.fontsize,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor ?? Theme.of(context).primaryColor,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Bordas arredondadas
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: fontsize ?? 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            if (icon != null) Icon(icon!, fontWeight: FontWeight.bold,),
          ],
        ),
      ),
    );
  }
}
