import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/views/edit_person_page.dart';

class EditButton extends StatelessWidget {
  final Map<String, dynamic> person;
  const EditButton({
    Key? key,
    required this.person,
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPersonPage(person: person),
            ),
          );
        },
        child: const Text(
          'Editar',
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
