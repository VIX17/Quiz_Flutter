import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 0;
  int acertos = 0;
  int erros = 0;

  List<Map<String, dynamic>> quiz = [
    {
      "pergunta":
          "Qual é o nome do protagonista da série de jogos The Legend of Zelda?",
      "respostas": [
        "Zelda",
        "Ganondorf",
        "Link",
        "Epona",
      ],
      "alternativa_correta": 2,
    },
    {
      "pergunta":
          "Qual é a principal moeda usada no jogo The Witcher 3: Wild Hunt?",
      "respostas": [
        "Dracmas",
        "Euros",
        "Orens",
        "Gils",
      ],
      "alternativa_correta": 2,
    },
    {
      "pergunta": "Em qual ano foi lançado o jogo Super Mario Bros.?",
      "respostas": [
        "1988",
        "1985",
        "1990",
        "1992",
      ],
      "alternativa_correta": 1,
    },
    {
      "pergunta": "Qual é o objetivo principal do jogo Minecraft?",
      "respostas": [
        "Resgatar a princesa",
        "Construir e explorar",
        "Correr e pular obstáculos",
        "Vencer corridas de kart",
      ],
      "alternativa_correta": 1,
    },
    {
      "pergunta": "Qual dessas empresas desenvolveu o jogo Fortnite?",
      "respostas": [
        "Valve",
        "Blizzard",
        "Epic Games",
        "Rockstar Games",
      ],
      "alternativa_correta": 2,
    },
    {
      "pergunta":
          "Qual dessas franquias de jogos é conhecida por sua temática de corrida?",
      "respostas": [
        "Resident Evil",
        "Halo",
        "Need for Speed",
        "The Sims",
      ],
      "alternativa_correta": 2,
    },
    {
      "pergunta": "Qual é o nome do personagem principal de The Last of Us?",
      "respostas": [
        "Joel",
        "Nathan Drakeros",
        "Kratos",
        "Arthur Morgan",
      ],
      "alternativa_correta": 0,
    },
    {
      "pergunta": "Qual é o dispositivo de controle usado no jogo Guitar Hero?",
      "respostas": [
        "Teclado",
        "Baixo",
        "Bateria",
        "Guitarra",
      ],
      "alternativa_correta": 3,
    },
    {
      "pergunta":
          "Qual jogo popular tem como personagem principal um ouriço azul?",
      "respostas": [
        "Sonic the Hedgehog",
        "Speedy Gonzales",
        "Hedgehog Hero",
        "The Legend of Zelda: Ocarina of Time",
      ],
      "alternativa_correta": 0,
    },
    {
      "pergunta": "Qual jogo de RPG tem a cidade de Midgar?",
      "respostas": [
        "Chrono Trigger",
        "Final Fantasy VII",
        "Dragon Quest VIII",
        "Kingdom Hearts",
      ],
      "alternativa_correta": 1,
    }
  ];

  void responder(int respostaNumero) {
    setState(() {
      if (quiz[perguntaNumero]['alternativa_correta'] == respostaNumero) {
        acertos++;
      } else {
        erros++;
      }

      if (perguntaNumero < quiz.length - 1) {
        perguntaNumero++;
      } else {
        // Quiz terminou
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Quiz terminado'),
            content: Text('Acertos: $acertos\nErros: $erros'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  reiniciarQuiz();
                },
                child: Text('Reiniciar'),
              ),
            ],
          ),
        );
      }
    });
  }

  void reiniciarQuiz() {
    setState(() {
      perguntaNumero = 0;
      acertos = 0;
      erros = 0;
    });
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagens/fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Pergunta ${perguntaNumero + 1} de ${quiz.length}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  quiz[perguntaNumero]['pergunta'],
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ...List.generate(
                  quiz[perguntaNumero]['respostas'].length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        responder(index);
                      },
                      child: Text(
                        quiz[perguntaNumero]['respostas'][index],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        responder(-1);
                      },
                      child: Text(
                        'Próxima Pergunta',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
