import 'package:flutter/material.dart';

import '../Data/DbHelper.dart';
import '../models/word.dart';

class AddWordPage extends StatefulWidget {
  @override
  _AddWordPageState createState() => _AddWordPageState();
}
class _AddWordPageState extends State<AddWordPage> {
  String _word = '';
  String _meaning = '';
  String _sampleSentence = '';
  int _againNum = 0;
  String _wordType = '';

  void _addWord() async {
    if (_word.isNotEmpty &&
        _meaning.isNotEmpty &&
        _sampleSentence.isNotEmpty &&
        _wordType.isNotEmpty) {
      Word word = Word(
        word: _word,
        meaning: _meaning,
        sampleSentence: _sampleSentence,
        againNum: _againNum,
        wordType: _wordType,
      );
      var result = await DbHelper.insertWord(word);
      Navigator.pop(context, true);

    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Eksik bilgi hata mesajını gösterme
          return AlertDialog(
            title: Text('Hata'),
            content: Text('Lütfen tüm alanları doldurun.'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Tamam'),
                onPressed: () {

                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelime Ekle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  _word = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Kelime',
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _meaning = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Anlam',
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _sampleSentence = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Örnek Cümle',
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _wordType = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Kelime Türü',
              ),
            ),
            ElevatedButton(
              onPressed: _addWord,
              child: Text('Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
