import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/widgets/form/forms.dart';
import 'package:i9_firebase_crud/widgets/save_button.dart';

class RegisterWidgets extends StatefulWidget {
  const RegisterWidgets({Key? key}) : super(key: key);

  @override
  State<RegisterWidgets> createState() => _RegisterWidgetsState();
}

class _RegisterWidgetsState extends State<RegisterWidgets> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController periodoController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormsWidget(
          formKey: formKey,
          idadeController: idadeController,
          nomeController: nomeController,
          periodoController: periodoController,
          readOnly: false,
        ),
        const SizedBox(height: 25),
        SaveButton(
          formKey: formKey,
          idadeController: idadeController,
          nomeController: nomeController,
          periodoController: periodoController,
          isEdit: false,
          id: '',
        ),
      ],
    );
  }
}
