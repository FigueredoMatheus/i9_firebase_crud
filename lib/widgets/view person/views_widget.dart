import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/widgets/form/forms.dart';
import 'package:i9_firebase_crud/widgets/view person/delete_button.dart';
import 'package:i9_firebase_crud/widgets/view person/edit_button.dart';

class ViewsWidgets extends StatefulWidget {
  final Map<String, String> person;
  const ViewsWidgets({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  State<ViewsWidgets> createState() => _ViewsWidgetsState();
}

class _ViewsWidgetsState extends State<ViewsWidgets> {
  late TextEditingController nomeController;

  late TextEditingController idadeController;

  late TextEditingController periodoController;

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
          formKey: null,
          idadeController: idadeController,
          nomeController: nomeController,
          periodoController: periodoController,
          readOnly: true,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            EditButton(person: widget.person),
            const SizedBox(width: 20),
            DeleteButton(personId: widget.person['id']!),
          ],
        )
      ],
    );
  }
}
