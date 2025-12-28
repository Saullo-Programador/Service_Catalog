import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final Color? iconColor;
  final bool obscure;
  final TextEditingController controller;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  // novos parâmetros
  final double? width;
  final double? height;

  const MyInput({
    super.key,
    required this.label,
    this.hint,
    this.icon,
    this.obscure = false,
    required this.controller,
    this.maxLines = 1,
    this.validator,
    this.keyboardType,
    this.width,
    this.height,
    this.iconColor,
  });

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(color: Colors.black),
        maxLines: widget.maxLines,
        obscureText: widget.obscure,
        validator: widget.validator,
        cursorColor: Theme.of(context).primaryColor,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          prefixIcon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: widget.iconColor ?? Theme.of(context).primaryColor,
                )
              : null,
          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () => widget.controller.clear(),
                  icon: const Icon(Icons.clear_rounded, color: Colors.black),
                )
              : null,
          labelText: widget.label,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
          labelStyle: const TextStyle(color: Colors.black, fontSize: 19),
          //errorText: 'Erro, Tente novamente!'
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey[500]),

          // 🔥 ESSENCIAL: controla a altura real do input
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: widget.height != null ? (widget.height! / 3) : 16,
          ),

          filled: true,
          fillColor: Colors.white,

          enabledBorder: OutlineInputBorder(
            gapPadding: 4,
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorScheme.of(context).error),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}
