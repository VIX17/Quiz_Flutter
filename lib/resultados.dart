import 'package:flutter/material.dart';

class Resultados extends StatelessWidget {
  final int acertos;

  const Resultados({Key? key, this.acertos = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Resultado',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Você acertou $acertos de 10 perguntas',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  print('Botão Jogar Novamente pressionado');
                },
                child: Text(
                  'Jogar Novamente',
                  style: TextStyle(fontSize: 27),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
