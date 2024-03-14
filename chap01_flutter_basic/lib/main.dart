import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Green-touch'),
          backgroundColor: Colors.green.shade200,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.green.shade100,
                          child: Text(''),
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        Text(
                          '식물 갤러리',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.compost,
                      color: Colors.green,
                      size: 50,
                    ),
                    Image.asset(
                      'assets/images/bo.png',
                    ),
                  ],
                ),
                Image.network(
                  'https://gratisography.com/wp-content/uploads/2023/10/gratisography-cool-cat-800x525.jpg',
                ),
                Image.network(
                    'https://gratisography.com/wp-content/uploads/2023/05/gratisography-colorful-cat-free-stock-photo-800x525.jpg'),
                TextField(
                    decoration: InputDecoration(labelText: 'Input'),
                    //입력폼에 (text)에 값이 변경될경우 작동한다.
                    onChanged: (text) {
                      print(text);
                    },
                    //작성중 엔터를 눌렀을 경우 작동한다.
                    onSubmitted: (text) {
                      print("enter를 눌렀습니다. 입력값 : $text");
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
