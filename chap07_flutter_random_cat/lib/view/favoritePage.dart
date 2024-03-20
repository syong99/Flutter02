import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<String> favoriteCatImages;

  const FavoritePage({Key? key, required this.favoriteCatImages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '좋아요한 고양이',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: favoriteCatImages.length,
        itemBuilder: (context, index) {
          String catImage = favoriteCatImages[index];
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
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            onTap: () {
              // 이미지 탭 이벤트
            },
          );
        },
      ),
    );
  }
}
