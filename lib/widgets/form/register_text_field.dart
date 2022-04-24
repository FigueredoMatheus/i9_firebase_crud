import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController textController;
  final String label;
  final double textFieldWidth;
  final TextInputType keyboardType;
  final bool readOnly;
  const TextFieldWidget({
    Key? key,
    required this.textController,
    required this.label,
    required this.textFieldWidth,
    required this.keyboardType,
    required this.readOnly,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: widget.textFieldWidth,
          child: TextFormField(
            textAlign: TextAlign.center,
            readOnly: widget.readOnly,
            controller: widget.textController,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.keyboardType == TextInputType.number
                ? [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ]
                : null,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
            validator: (text) {
              if (text != null && text.isEmpty) {
                return 'Compo obrigatório.';
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}
