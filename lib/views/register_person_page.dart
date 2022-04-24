import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/widgets/register person/register_widgets.dart';

class RegisterPersonPage extends StatelessWidget {
  const RegisterPersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrar'),
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
              const Positioned(
                top: 30,
                child: RegisterWidgets(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
