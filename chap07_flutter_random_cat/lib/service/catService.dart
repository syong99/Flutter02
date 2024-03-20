import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatService extends ChangeNotifier {
  SharedPreferences prefs;
  List<String> catImages = [];

  // 좋아요 한 사진들
  List<String> favoriteCatImages = [];

  //CatService 생성자
  CatService(this.prefs) {
    getRandomCatImages();

    favoriteCatImages = prefs.getStringList("favorite") ?? [];
  }

//고양이 이미지 10개 가져오는 메소드
  void getRandomCatImages() async {
    String path =
        "https://api.thecatapi.com/v1/images/search?limit=10&mime_types=jpg";
    var result = await Dio().get(path);
    print(result.data);
    for (int i = 0; i < result.data.length; i++) {
      var map = result.data[i];
      print(map);
      print(map['url']);
      //catImage에 이미지 url 추가
      catImages.add(map['url']);
    }
    notifyListeners();
  }

  //좋아요 기능
  void toggleFavoriteImage(String catImage) {
    if (favoriteCatImages.contains(catImage)) {
      favoriteCatImages.remove(catImage);
    } else {
      favoriteCatImages.add(catImage);
    }
    // 변경 사항을 모든 리스너 에게 알림
    notifyListeners();

    prefs.setStringList("favorite", favoriteCatImages);
  }
}
