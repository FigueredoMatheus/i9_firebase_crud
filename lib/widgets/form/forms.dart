import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/widgets/form/register_text_field.dart';

class FormsWidget extends StatefulWidget {
  final TextEditingController nomeController;
  final TextEditingController idadeController;
  final TextEditingController periodoController;
  final GlobalKey<FormState>? formKey;
  final bool readOnly;
  const FormsWidget({
    Key? key,
    required this.nomeController,
    required this.idadeController,
    required this.periodoController,
    required this.formKey,
    required this.readOnly,
  }) : super(key: key);

  @override
  State<FormsWidget> createState() => _FormsWidgetState();
}

class _FormsWidgetState extends State<FormsWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFieldWidget(
            textController: widget.nomeController,
            label: 'Nome',
            textFieldWidth: 300,
            keyboardType: TextInputType.name,
            readOnly: widget.readOnly,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              TextFieldWidget(
                textController: widget.idadeController,
                label: 'Idade',
                textFieldWidth: 130,
                keyboardType: TextInputType.number,
                readOnly: widget.readOnly,
              ),
              const SizedBox(width: 40),
              TextFieldWidget(
                textController: widget.periodoController,
                label: 'Período',
                textFieldWidth: 130,
                keyboardType: TextInputType.number,
                readOnly: widget.readOnly,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
