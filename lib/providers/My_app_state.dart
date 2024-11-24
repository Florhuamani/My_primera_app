import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState with ChangeNotifier{
var current= WordPair.random();
var history = <WordPair>[];
GlobalKey? historyListKey;

void getNext() {
  history.insert(0, current);
  var animatedList = historyListKey?.currentState as AnimatedListState;
  animatedList.insertItem(0);
  current = WordPair.random();
  notifyListeners();
  }

  var favorite=<WordPair>[];

  void toggleFavorite(WordPair? pair) {
    pair = pair ?? current;
    if(favorite.contains(pair)){
      favorite.remove(pair);
    }else{
      favorite.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(WordPair? pair){
    favorite.remove(pair);
    notifyListeners();
  }
  }