import 'package:flutter/material.dart';

import '../Data/DbHelper.dart';
import '../models/word.dart';

class WordDetailPage extends StatefulWidget {
  final Word word;

  WordDetailPage(this.word);

  @override
  _WordDetailPage createState() => _WordDetailPage(word);
}

class _WordDetailPage extends State<WordDetailPage> {
  TextEditingController _wordController = TextEditingController();
  TextEditingController _meaningController = TextEditingController();
  TextEditingController _sampleSentenceController = TextEditingController();
  TextEditingController _wordTypeController = TextEditingController();
  Word word;
  _WordDetailPage(this.word);
  @override
  void initState() {
    super.initState();
    _wordController.text = widget.word.word;
    _meaningController.text = widget.word.meaning;
    _sampleSentenceController.text = widget.word.sampleSentence;
    _wordTypeController.text = widget.word.wordType;
  }

  @override
  void dispose() {
    _wordController.dispose();
    _meaningController.dispose();
    _sampleSentenceController.dispose();
    _wordTypeController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Kelime Detayları' ,style: TextStyle(
            color: Colors.teal
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _wordController,
              decoration: InputDecoration(labelText: 'Kelime',),
            ),
            TextField(
              controller: _meaningController,
              decoration: InputDecoration(labelText: 'Anlam'),
            ),
            TextField(
              controller: _sampleSentenceController,
              decoration: InputDecoration(labelText: 'Örnek Cümle'),
            ),
            TextField(
              controller: _wordTypeController,
              decoration: InputDecoration(labelText: 'Kelime Türü'),
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: ElevatedButton(
                    onPressed: _updateWord,
                    child: Text('Güncelle'),
                  ),
                ),
                SizedBox(width: 40,),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: _deletedWord,
                    child: Text('Sil'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 void _deletedWord( ) async{
       var result=await DbHelper.deleteWord((word.id));
       Navigator.pop(context,true);
    }
  void _updateWord() async {
    Word updatedWord = Word.withId(
        id: widget.word.id,
        word: _wordController.text,
        meaning: _meaningController.text,
        sampleSentence: _sampleSentenceController.text,
        wordType: _wordTypeController.text,
        againNum: 0
    );
    await DbHelper.updateWord(updatedWord);
    Navigator.pop(
        context, true);
  }
}