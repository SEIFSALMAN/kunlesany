import 'package:flutter/material.dart';
import 'package:kunlesany/models/arabic_languague_education_model.dart';

class BookmarkLettersProvider extends ChangeNotifier
{
  List<ArabicLettersModel> _arabicLettersVideo = [];
  List<ArabicLettersModel> get arabicLettersVideo => _arabicLettersVideo;

  void toggleFavorite(ArabicLettersModel video){
    final isExist = _arabicLettersVideo.contains(video);
    if(isExist) {
      _arabicLettersVideo.remove(video);
    }
    else {
      _arabicLettersVideo.add(video);
    }
    notifyListeners();
  }

  bool isExist(ArabicLettersModel video){
    final isExist = _arabicLettersVideo.contains(video);
    return isExist;
  }

  void clearFavorite()
  {
    _arabicLettersVideo = [];
    notifyListeners();
  }
}

class BookmarkNumbersProvider extends ChangeNotifier
{
  List<ArabicNumbersModel> _arabicNumberVideo = [];
  List<ArabicNumbersModel> get arabicNumberVideo => _arabicNumberVideo;

  void toggleFavorite(ArabicNumbersModel video){
    final isExist = _arabicNumberVideo.contains(video);
    if(isExist) {
      _arabicNumberVideo.remove(video);
    }
    else {
      _arabicNumberVideo.add(video);
    }
    notifyListeners();
  }

  bool isExist(ArabicNumbersModel video){
    final isExist = _arabicNumberVideo.contains(video);
    return isExist;
  }

  void clearFavorite()
  {
    _arabicNumberVideo = [];
    notifyListeners();
  }
}

class BookmarkWordsProvider extends ChangeNotifier
{
  List<ArabicWordsModel> _arabicWordsVideo = [];
  List<ArabicWordsModel> get arabicWordsVideo => _arabicWordsVideo;

  void toggleFavorite(ArabicWordsModel video){
    final isExist = _arabicWordsVideo.contains(video);
    if(isExist) {
      _arabicWordsVideo.remove(video);
    }
    else {
      _arabicWordsVideo.add(video);
    }
    notifyListeners();
  }

  bool isExist(ArabicWordsModel video){
    final isExist = _arabicWordsVideo.contains(video);
    return isExist;
  }

  void clearFavorite()
  {
    _arabicWordsVideo = [];
    notifyListeners();
  }
}