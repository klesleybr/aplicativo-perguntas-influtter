import 'package:flutter/material.dart';
import 'package:aplicativo_perguntas/question.dart';


void main() => runApp(AplicativoPerguntas());

class AplicativoPerguntas extends StatefulWidget {
  const AplicativoPerguntas({super.key});

  @override
  AplicativoPerguntasState createState() {
    return AplicativoPerguntasState();
  }
}

class AplicativoPerguntasState extends State<AplicativoPerguntas> {
  var countClick = 0;
  var score = 0;
  List<String> userAnswers = [];

    void toAnswer(String answer) { 
      setState(() {
        userAnswers.add(answer);

        if(answer == questionsAndAnswers[countClick]['correct'] as String){
          score ++;
        }

        print(score);

        countClick++;
      });
    }

    List<Map<String, Object>> questionsAndAnswers = const [
      {
        'question' : 'Qual o nome completo do aluno?',
        'answers' : ['Maria da Conceição', 'Rubens Paiva', 'Charles Júnior', 'Amaralina da Rocha'],
        'correct' : 'Amaralina da Rocha'
      },
      {
        'question' : 'Qual a data de nascimento do aluno?',
        'answers' : ['29 de abril de 2000', '21 de outubro de 2002', '04 de fevereiro de 2001', '10 de dezembro de 1998'],
        'correct' : '21 de outubro de 2002'
      },
      {
        'question' : 'Qual o nome do pai do aluno?',
        'answers' : ['Roberto de Carvalho', 'Altamiro Carrilho', 'Josué da Silva Penha', 'Antônio Carlos Miranda'],
        'correct' : 'Roberto de Carvalho'
      },
      {
        'question' : 'Qual o nome da mãe do aluno?',
        'answers' : ['Vanessa Ferreira', 'Juvelina Cardeal', 'Rita Rock Lee', 'Isabela Miranda'],
        'correct' : 'Isabela Miranda'
      },
      {
        'question' : 'Qual a profissão deseja seguir?',
        'answers' : ['Jogador de futebol', 'Economista', 'Artista plástico', 'Matemático'],
        'correct' : 'Economista'
      }
    ];

    bool possibleCount() {
      return countClick < questionsAndAnswers.length;
    }

  @override
  Widget build(BuildContext context) {  
    List<String> listAnswers = possibleCount() ? questionsAndAnswers[countClick]['answers'] as List<String>: [];

    return MaterialApp(

      home: Scaffold(

        appBar: AppBar(
          title: Row(              
            mainAxisSize: MainAxisSize.min, // mínimo de tamanho necessário
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 100),  // não funcionou!              
              ),
              Text(
                'PersonQuiz',
                
                //textAlign: TextAlign.center, // centraliza o texto apenas
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,              
                ),
              ),

              SizedBox(width: 10), // separa o texto da imagem
              
              Image.asset('assets/images/interrogation.png', height: 43),
            ]
          ),
          

          centerTitle: true, // centraliza o conjunto (texto e icon)
          backgroundColor: Color(0xFFfad3b2), // manter Color(0xFF_________),
        ),

        body: possibleCount() ? Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            question(questionsAndAnswers[countClick]['question'] as String),
            SizedBox(height: 100),
            ...listAnswers.map((t) => Container(

              margin: EdgeInsets.only(bottom: 5, left: 40, right: 40),
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 48, 188, 231),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),

                onPressed: () => toAnswer(t),
                child: Text(
                  t,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),


                    )),
          ]

        ) : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          

          children: [                    
            Text(
              'Parabéns, caro(a) ${questionsAndAnswers[4]['correct']} ${questionsAndAnswers[0]['correct']}. Você concluiu o jogo.',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                
              ),
              textAlign: TextAlign.center,
              ),

            if(score == 5)
              Text('Você acertou todas as perguntas!!!')

            else
              Text('Você acertou $score questões e errou ${5 - score}.')
              
          ],

        ),


      ),

    );
  }
}