import 'package:flutter/material.dart';
import 'package:kelime_defteri/screens/quiz_game.dart';
import 'package:path/path.dart';

class GamesScreen extends StatelessWidget {
  // Oyun listesi
  final List<Map<String, dynamic>> games = [
    {
      'title': 'Çoktan Seçmeli',
      'description': 'Seçenekler arasında doğru kelimeyi bul en az 10 kelime',
    },
    {
      'title': 'Oyun 2',
      'description': 'Oyun 2 Açıklaması',
    },
    // Diğer oyunlar
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Oyunlar', style: TextStyle(
            color: Colors.teal
        )),
      ),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              child: ListTile(
                title: Text(game['title']),
                subtitle: Text(game['description']),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizGameScreen()));
                },
              ),
            ),
          );
        },
      ),
    );
  }



  }




