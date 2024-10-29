import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PrefixType { none, username, email, password }

class AppTextField extends StatefulWidget {
  final String? hint;
  final String label;
  final bool isPassword, isFormatter;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int maxLines;
  final PrefixType prefixType;
  final TextStyle? style;
  final FloatingLabelBehavior float;
  final String? Function(String? value)? validator;

  const AppTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.keyboardType,
    this.hint,
    this.controller,
    this.maxLines = 1,
    this.prefixType = PrefixType.none,
    this.isFormatter = false,
    this.style,
    this.validator,
    this.float = FloatingLabelBehavior.auto,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {setState(() {FocusManager.instance.primaryFocus?.unfocus();});},
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      obscuringCharacter: '*',
      validator: widget.validator,
      obscureText: isHidden && widget.isPassword,
      decoration: InputDecoration(
        floatingLabelBehavior: widget.float,
        hintText: widget.hint,

        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Color(0xFF9CA3AF)
        ),
        filled: true,
        fillColor: const Color(0xFFD1D5DB).withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon:
                    Icon(isHidden ? (Icons.visibility_off) : Icons.visibility),
                onPressed: () {
                  isHidden = !isHidden;
                  setState(() {});
                },
                color: const Color(0xFF54565A),
              )
            : null,
        enabled: true,
        prefixIcon: _buildPrefixIcon(),
      ),
      controller: widget.controller,
      inputFormatters: widget.isFormatter
          ? [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z0-9@#$%^&*(),.?":{}|<>]')),
              LengthLimitingTextInputFormatter(20),
            ]
          : null,
    );
  }

  Widget? _buildPrefixIcon() {
    switch (widget.prefixType) {
      case PrefixType.username:
        return const Icon(Icons.person, color: Color(0xFF54565A));
      case PrefixType.email:
        return const Icon(Icons.email, color: Color(0xFF54565A));
      case PrefixType.password:
        return const Icon(Icons.lock, color: Color(0xFF54565A));
      case PrefixType.none:
        return null;
    }
  }
}
