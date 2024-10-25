import 'package:bee_corp_app/screens/login/components/text_field_container.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController inputController;
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;
  final Icon prefixIcon;
  final FormFieldValidator<String> validator;

  const InputField(
      {super.key,
      required this.inputController,
      required this.keyboardType,
      required this.labelText,
      required this.hintText,
      required this.prefixIcon,
      required this.validator});

  @override
  State<InputField> createState() => _InputField();
}

class _InputField extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
          controller: widget.inputController,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              border: const OutlineInputBorder()),
          onChanged: (String value) {},
          validator: widget.validator),
    );
  }
}
