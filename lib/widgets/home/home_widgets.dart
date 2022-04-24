import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/views/register_person_page.dart';
import 'package:i9_firebase_crud/widgets/home/person_container.dart';

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: 220,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFFE5822),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterPersonPage(),
                ),
              );
            },
            child: const Text(
              'Cadastrar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: screenWidth,
          child: const Divider(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('pessoas').get(),
          builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.none) {
              return const Center(
                child: Text(
                  'Erro!!!!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            }

            return Column(
              children: snapshot.data!.docs
                  .map(
                    (doc) => PersonContainer(
                      person: doc.data() as Map<String, dynamic>,
                    ),
                  )
                  .toList(),
            );
          }),
        ),
      ],
    );
  }
}
