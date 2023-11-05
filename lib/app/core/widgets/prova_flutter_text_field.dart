import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/iu/prova_flutter_theme.dart';

class ProvaFlutterTextField extends StatelessWidget {
  final bool obscureText;
  final Icon? prefixIcon;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? formFieldValidator;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onCompleted;
  final String _label;

  const ProvaFlutterTextField(
      {super.key,
      required this.obscureText,
      this.prefixIcon,
      this.formFieldValidator,
      this.textEditingController,
      this.focusNode,
      this.padding,
      required String label,
      this.onCompleted})
      : assert(obscureText == true ? prefixIcon == null : true,
            "O obscureText não pode ser true juntamente com o prefixIcon"),
        _label = label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: TextField(
        onEditingComplete: onCompleted,
        controller: textEditingController,
        focusNode: focusNode,
        decoration: InputDecoration(
          label: Align(
            alignment: Alignment.center,
            child: Text(
              _label,
              style: ProvaFlutterTheme.styleTextItemBoxWidget,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          isDense: true,
          prefixIcon: prefixIcon,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
