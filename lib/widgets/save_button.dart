import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/utils/dialogs.dart';

class SaveButton extends StatelessWidget {
  final TextEditingController nomeController;
  final TextEditingController idadeController;
  final TextEditingController periodoController;
  final GlobalKey<FormState> formKey;
  final bool isEdit;

  const SaveButton({
    Key? key,
    required this.nomeController,
    required this.idadeController,
    required this.periodoController,
    required this.formKey,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    editPerson() {
      Map<String, String> person = {
        'nome': nomeController.text,
        'idade': idadeController.text,
        'periodo': periodoController.text,
      };
    }

    registerPerson() {
      Map<String, String> person = {
        'nome': nomeController.text,
        'idade': idadeController.text,
        'periodo': periodoController.text,
      };
    }

    return SizedBox(
      width: 180,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFFE5822),
        ),
        onPressed: () {
          if (!formKey.currentState!.validate()) {
            return;
          }

          if (isEdit) {
            editPerson();
          } else {
            registerPerson();
          }

          dialogLoading(context, isEdit ? 'Salvando' : 'Cadastrando');

          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.pop(context);
              dialogSuccess(
                context,
                isEdit ? 'Salvo com sucesso.' : 'Cadastrado com sucesso.',
              ).then(
                (value) {
                  Navigator.pop(context);
                  if (isEdit) {
                    Navigator.pop(context);
                  }
                },
              );
            },
          );
        },
        child: Text(
          isEdit ? 'Salvar' : 'Cadastrar',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
