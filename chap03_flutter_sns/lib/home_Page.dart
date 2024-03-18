import 'package:chap03_flutter_sns/feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/10/gratisography-cool-cat-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/10/gratisography-witch-cat-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/09/gratisography-duck-doctor-free-stock-photo-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/06/gratisography-boxing-boxer-free-stock-photo-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/06/gratisography-dj-gorilla-free-stock-photo-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/06/gratisography-panda-ice-cream-free-stock-photo-1170x780.jpg",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // AppBar의 음영을 조절하여 붕 떠있는 것 같은 효과를 준다.
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.camera,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.paperplane,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        title: Image.asset(
          'assets/og_logo (1).png',
          height: 32,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return Feed(
            imageUrl: image,
          );
        },
      ),
    );
  }
}
