import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/views/view_person_page.dart';

class PersonContainer extends StatelessWidget {
  final Map<String, String> person;
  const PersonContainer({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle() {
      return const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewPersonPage(person: person),
          ),
        );
      },
      child: Card(
        color: const Color(0xFF2F3A48),
        elevation: 5,
        child: SizedBox(
          width: screenWidth * 0.83,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome: ${person['nome']}',
                  style: textStyle(),
                ),
                const SizedBox(height: 5),
                Text(
                  'Idade: ${person['idade']}',
                  style: textStyle(),
                ),
                const SizedBox(height: 5),
                Text(
                  'Período: ${person['periodo']}',
                  style: textStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
