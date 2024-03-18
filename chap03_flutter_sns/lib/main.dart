import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/og_logo (1).png',
            height: 25,
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.camera,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.paperplane,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-1170x780.jpg',
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.heart),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.chat_bubble),
                  color: Colors.black,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.bookmark),
                  color: Colors.black,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '3 likes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('네온과 고양이, 초고의 조합 🐬 \n#CatLife #NeonVibes'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('March 6', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
