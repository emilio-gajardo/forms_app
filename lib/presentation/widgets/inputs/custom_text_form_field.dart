import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? label;
  final String? hintText;
  final String? errorMessage;
  final bool? obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.errorMessage,
    this.obscureText,
    this.onChanged,
    this.validator,
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(25)
    );

    return TextFormField(

      obscureText: obscureText ?? false,
      onChanged: onChanged,
      validator: validator,
      
      /*(value) {
        if (value == null || value.isEmpty || value.trim().isEmpty) return 'Campo vacío';
        return null;
      },*/

      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: colors.error)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: colors.error)),

        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        errorText: errorMessage,
        focusColor: colors.primary,
        // icon: Icon(Icons.account_box_rounded, color: colors.primary)// icono por fuera
        // prefixIcon: Icon(Icons.account_box_rounded, color: colors.primary)// icono por dentro a la izquierda
        // suffixIcon: Icon(Icons.account_box_rounded, color: colors.primary)// icono por dentro a la derecha

      ),
    );
  }
}