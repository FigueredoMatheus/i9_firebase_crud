import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/widgets/edit%20person/edit_widgets.dart';

class EditPersonPage extends StatelessWidget {
  final Map<String, String> person;
  const EditPersonPage({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Editar'),
          centerTitle: true,
          backgroundColor: const Color(0xFF333D4C),
        ),
        backgroundColor: const Color(0xFF092435),
        resizeToAvoidBottomInset: false,
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
                child: EditWidgets(
                  person: person,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
