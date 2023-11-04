import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProvaFlutterTextField extends StatelessWidget {
  final bool obscureText;
  final Icon? prefixIcon;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? formFieldValidator;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;

  const ProvaFlutterTextField({
    super.key,
    required this.obscureText,
    this.prefixIcon,
    this.formFieldValidator,
    this.textEditingController,
    this.focusNode,
    this.padding,
  }) : assert(obscureText == true ? prefixIcon == null : true,
            "O obscureText não pode ser true juntamente com o prefixIcon");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
        ],
        controller: textEditingController,
        focusNode: focusNode,
        validator: formFieldValidator,
        decoration: InputDecoration(
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
