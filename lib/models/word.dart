import 'dart:ui';

import 'package:flutter/material.dart';

class Word {
  int id;
  String word;
  String meaning;
  String sampleSentence;
  int againNum;
  String wordType;

  Word({
    this.id=0,
    required this.word,
    required this.meaning,
    required this.sampleSentence,
    required this.againNum,
    required this.wordType
  });

  Word.withId({required this.id, required this.word, required this.meaning, required this.sampleSentence,
    required this.againNum, required this.wordType});

  Color getColor() {
    Color color;
    switch (againNum) {
      case 0:
        color=Colors.black45;
        break;
      case 1:
        color=Colors.red;
        break;
      case 2:
        color=Colors.orange;
        break;
      case 3:
        color=Colors.yellow;
        break;
      case 4:
        color=Colors.blue;
        break;
      default:
        color=Colors.green;
        break;
    }
    return color;
  }











  // Map verisini Word nesnesine dönüştürme metodu
  factory Word.fromMap(Map<String, dynamic> map) {
    return Word.withId(
      id: map['id'],
      word: map['word'],
      meaning: map['meaning'],
      sampleSentence: map['sampleSentence'],
      againNum: map['againNum'],
      wordType: map['wordType'],
    );
  }

  // Word nesnesini Map verisine dönüştürme metodu
  Map<String, dynamic> toMap() {
    return  {
      'word': word,
      'meaning': meaning,
      'sampleSentence': sampleSentence,
      'againNum': againNum,
      'wordType': wordType,
    };
  }

}
