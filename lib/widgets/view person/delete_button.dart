import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/utils/dialogs.dart';
import 'package:i9_firebase_crud/views/home_page.dart';

class DeleteButton extends StatelessWidget {
  final String personId;
  const DeleteButton({
    Key? key,
    required this.personId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFFE5822),
        ),
        onPressed: () async {
          dialogLoading(context, 'Excluindo');

          await FirebaseFirestore.instance
              .collection('pessoas')
              .doc(personId)
              .delete();

          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.pop(context);
              dialogSuccess(
                context,
                'Excluido com sucesso.',
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
        child: const Text(
          'Excluir',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
