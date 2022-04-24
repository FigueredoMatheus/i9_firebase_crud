import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/widgets/form/forms.dart';
import 'package:i9_firebase_crud/widgets/save_button.dart';

class EditWidgets extends StatefulWidget {
  final Map<String, dynamic> person;
  const EditWidgets({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  State<EditWidgets> createState() => _EditWidgetsState();
}

class _EditWidgetsState extends State<EditWidgets> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController periodoController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    nomeController = TextEditingController(text: widget.person['nome']);

    idadeController = TextEditingController(text: widget.person['idade']);

    periodoController = TextEditingController(text: widget.person['periodo']);
  }

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
          nomeController: nomeController,
          idadeController: idadeController,
          periodoController: periodoController,
          formKey: formKey,
          isEdit: true,
          id: widget.person['id'],
        )
      ],
    );
  }
}
