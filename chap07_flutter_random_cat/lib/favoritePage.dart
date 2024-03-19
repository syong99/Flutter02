import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

void saveData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList('favoriteCatImages', CatService().favoriteCatImages);
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key, required List<String> favoriteCatImages});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CatService>(
      builder: (context, catService, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '랜덤 고양이',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.indigo,
            actions: [
              IconButton(
                  onPressed: () {
                    // 아이콘 버튼 눌렀을 때 동작
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ))
            ],
          ),
          body: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: EdgeInsets.all(8),
            children:
                List.generate(catService.favoriteCatImages.length, (index) {
              String catImage = catService.favoriteCatImages[index];
              return GestureDetector(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        catImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        bottom: 8,
                        right: 8,
                        child: Icon(
                          Icons.favorite,
                          color: catService.favoriteCatImages.contains(catImage)
                              ? Colors.red
                              : Colors.transparent,
                        ))
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
