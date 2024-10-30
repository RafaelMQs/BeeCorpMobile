import 'package:bee_corp_app/components/text_field_container.dart';
import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController inputController;
  final FormFieldValidator<String> validator;

  const PasswordInputField(
      {super.key, required this.inputController, required this.validator});

  @override
  State<PasswordInputField> createState() => _PasswordInputField();
}

class _PasswordInputField extends State<PasswordInputField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
          controller: widget.inputController,
          obscureText: hidePassword,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              labelText: 'Senha',
              hintText: 'Digite a sua Senha',
              prefixIcon: const Icon(Icons.password),
              suffixIcon: IconButton(
                  onPressed: () => setState(() => hidePassword = !hidePassword),
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                  )),
              border: const OutlineInputBorder()),
          onChanged: (String value) {},
          validator: widget.validator),
    );
  }
}
