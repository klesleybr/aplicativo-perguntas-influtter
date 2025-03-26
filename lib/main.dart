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

    void toAnswer(String answer) { 
      setState(() {
        
        if(answer == questionsAndAnswers[countClick]['correct'] as String){
          score ++;
        }      

        countClick++;
      });
    }

    void toReset() {
      setState(() {
        score = 0;
        countClick = 0;
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
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),

      home: Scaffold(
        backgroundColor: Color(0xFFf1e9bb),        

        appBar: AppBar(
          title: Row(              
            mainAxisSize: MainAxisSize.min, // mínimo de tamanho necessário
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 100),  // não funcionou!              
              ),
              Text(
                style: TextStyle(
                  fontFamily: 'Bingo',
                  fontSize: 78,
                  color: Color.fromARGB(255, 63, 63, 63),
                ),

                'PersonQuiz',
                
                //textAlign: TextAlign.center, // centraliza o texto apenas
                
              ),

              SizedBox(width: 10), // separa o texto da imagem
              
              Image.asset('assets/images/interrogation.png', height: 52),
            ]
          ),

          bottom: PreferredSize(
              preferredSize: Size.fromHeight(5), 
              child: Container(
                color: const Color.fromARGB(255, 96, 95, 95),
                height: 2,
              )
            ),
          
          toolbarHeight: 100,
          centerTitle: true, // centraliza o conjunto (texto e icon)
          backgroundColor: Color(0xFFf3c363), // manter Color(0xFF_________),
          elevation: 0,          
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
                  backgroundColor: const Color(0xFFcf6123),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),

                onPressed: () => toAnswer(t),
                child: Text(
                  t,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Nunito',                  
                  ),
                ),
              ),


                    )),
          ]

        ) : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          

          children: [
            Image.asset('assets/images/ok_icon.png'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Parabéns, caro(a) ${questionsAndAnswers[4]['correct']} ${questionsAndAnswers[0]['correct']}. Você concluiu o jogo.',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',                
                ),
                textAlign: TextAlign.center,              
              ),


            ),
            

            SizedBox(height: 25),

            if(score == 5)
              Text(
                'Você acertou todas as perguntas!!!',
                style: TextStyle(
                  fontSize: 19,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Nunito',
                )
              )

            else
              Text(
                'Você acertou $score questões e errou ${5 - score}.',
                style: TextStyle(
                  fontSize: 19,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Nunito',
                )
              )
            
            
            , SizedBox(height: 25),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: ElevatedButton(              
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFcf6123),
                  foregroundColor: Color(0xFFffffff),
                  minimumSize: Size(double.infinity, 45),                  
                ),
                onPressed: () => toReset(), 
                child: Text(
                  'Voltar',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Nunito',
                      )
                  )
                ),
              
            ),

            
          ],

        ),


      ),

    );
  }
}