import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/widgets/view person/views_widget.dart';

class ViewPersonPage extends StatelessWidget {
  final Map<String, dynamic> person;

  const ViewPersonPage({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(person['nome']!),
          centerTitle: true,
          backgroundColor: const Color(0xFF333D4C),
        ),
        backgroundColor: const Color(0xFF092435),
        body: SizedBox(
          width: screenWidth,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 20,
                child: SizedBox(
                  height: 210,
                  width: screenWidth,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(
                      'assets/2-logotipo-fundo-azul-HD.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                child: ViewsWidgets(person: person),
              )
            ],
          ),
        ),
      ),
    );
  }
}
