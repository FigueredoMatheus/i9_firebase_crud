import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/utils/dialogs.dart';

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
        onPressed: () {
          dialogLoading(context, 'Excluindo');

          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pop(context);
            dialogSuccess(
              context,
              'Excluido com sucesso.',
            ).then(
              (value) {
                Navigator.pop(context);
              },
            );
          });
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
