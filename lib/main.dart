import 'dart:math';
import 'package:flutter/material.dart';

void main() {

  runApp(HatayArcheologyApp());
}

class HatayArcheologyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hatay Archeology Museum'),
        ),
        body: HatayArcheologyWidget(),
      ),
    );
  }
}

class HatayArcheologyWidget extends StatefulWidget {
  @override
  _HatayArcheologyWidgetState createState() => _HatayArcheologyWidgetState();
}

class _HatayArcheologyWidgetState extends State<HatayArcheologyWidget> {
  int currentArtifact = 0;
  Map<int, List<String>> artifactsAndQuestions = {
    0: ['What is this artifact made of?', 'When was this artifact created?'],
    1: ['What is the function of this artifact?', 'Where was this artifact found?'],
    2: ['Who made this artifact?', 'How old is this artifact?'],
    3: ['What is the symbol on this artifact?', 'Why was this artifact made?'],
    4: ['Where is this artifact displayed?', 'How many visitors see this artifact every year?'],
  };

  Map<int, List<String>?> artifactsAndAnswers = {
    0: ['Gold', 'Bronze', '12th century'],
    1: ['Cooking tool', 'Toilet', '1 km north of Hatay'],
    2: ['The god of love', 'A skilled craftsman', 'About 2000 years old'],
    3: ['Heart', 'Winged love', 'The symbol represents the power of love'],
    4: ['Gallery 2', '5000', 'Each visitor sees at least one artifact'],
  };

  @override
  Widget build(BuildContext context) {
    if (currentArtifact == 5) {
      return Center(
        child: Text(
          'Thank you for visiting Hatay Archeology Museum!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
    }

    List<String> questions = artifactsAndQuestions[currentArtifact]!;
    return Column(
      children: [
        Text(
          'Artifact ${currentArtifact + 1}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'This artifact is fascinating! Let\'s find out more.',
          style: TextStyle(fontSize: 18),
        ),
        ...questions.map((question) {
          return TextButton(
            onPressed: () {
              setState(() {
                int randomAnswerIndex = Random().nextInt(artifactsAndAnswers[currentArtifact]!.length);
                String answer = artifactsAndAnswers[currentArtifact]![randomAnswerIndex];
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Answer'),
                      content: Text(answer),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              });
            },
            child: Text(question),
          );
        }).toList(),
        TextButton(
          onPressed: () {
            setState(() {
              currentArtifact++;
            });
          },
          child: Text('Next Artifact'),
        ),
      ],
    );
  }
}