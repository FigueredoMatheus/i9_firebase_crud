import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/utils/dialogs.dart';
import 'package:i9_firebase_crud/views/home_page.dart';

class SaveButton extends StatelessWidget {
  final TextEditingController nomeController;
  final TextEditingController idadeController;
  final TextEditingController periodoController;
  final GlobalKey<FormState> formKey;
  final bool isEdit;
  final String id;

  const SaveButton({
    Key? key,
    required this.nomeController,
    required this.idadeController,
    required this.periodoController,
    required this.formKey,
    required this.isEdit,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    editPerson() async {
      Map<String, String> person = {
        'nome': nomeController.text,
        'idade': idadeController.text,
        'periodo': periodoController.text,
      };

      await FirebaseFirestore.instance
          .collection('pessoas')
          .doc(id)
          .update(person);
    }

    registerPerson() async {
      Map<String, String> person = {
        'nome': nomeController.text,
        'idade': idadeController.text,
        'periodo': periodoController.text,
      };

      await FirebaseFirestore.instance
          .collection('pessoas')
          .add(person)
          .then((doc) async {
        await doc.update({'id': doc.id});
      });
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false);
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
