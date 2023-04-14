import 'package:flutter/material.dart';
import 'package:kelime_defteri/screens/word_added.dart';
import 'package:kelime_defteri/screens/word_detail.dart';
import '../Data/DbHelper.dart';
import '../models/word.dart';

class WordListPage extends StatefulWidget {
  @override
  _WordListPageState createState() => _WordListPageState();
}

class _WordListPageState extends State<WordListPage> {
  List<Word> _words = [];
  int wordCount = 0;

  @override
  void initState() {
    _loadWordList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        title: Text('Kelime Listesi' ,style:TextStyle(
            color: Colors.teal
        )),
      ),
      body: buildWordList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToWordAdd();
        },
        child: Icon(Icons.add),
        tooltip: "Yeni Ürün Ekle",
      ),
    );
  }

  void goToWordAdd() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddWordPage()));
    if (result != null) {
      if (result) {
        setState(() {
          _loadWordList();
        });
      }
    }
  }
  void _loadWordList() async {
    var productsFuture = DbHelper.getAllWords();
    productsFuture.then((data) {
      wordCount = data.length;
      this._words = data;
    });
  }
  void GoToDetail(Word word) async {
    var result= await Navigator.push(context,MaterialPageRoute(builder: (context)=>WordDetailPage(word)));
    if (result != null) {
      if (result) {
        setState(() {
          _loadWordList();
        });
      }
    }
  }

  ListView buildWordList() {
    return ListView.builder(
        itemCount: wordCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: this._words[position].getColor(),
                        width: 10.0
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(this._words[position].word.toString(),style:
                      TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),),
                    subtitle: Text(this._words[position].id.toString(),style: TextStyle(
                        color: Colors.brown,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic
                    ),),
                    onTap: () {
                      GoToDetail(this._words[position]);
                    },

                  )));
        });
  }
}
