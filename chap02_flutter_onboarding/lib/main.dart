import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // backgroundColor: Color.fromARGB(255, 36, 34, 34),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: '현재의 나',
      subTitle: '만족하진 못하지만 어쩌 해 나가는 모습이 자랑스러운 따봉',
      imageUrl: 'assets/images/bo.png',
    ),
    Introduction(
      title: '수료 후의 나',
      subTitle: '수료 후 어려운 과정을 무사히 마쳤다는 기분의 따봉',
      subTitleTextStyle: ,
      imageUrl: 'assets/images/bo.png',
    ),
    Introduction(
      title: '10년 뒤에 나',
      subTitle: '좋은 취업자리에 무사히 취직해 안정적인 자리에서 열심히 일하는 따봉',
      imageUrl: 'assets/images/bo.png',
    ),
    Introduction(
      title: '18년 뒤에 나',
      subTitle: '프로그램 개발중인 모습의 따봉',
      imageUrl: 'assets/images/bo.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ), //MaterialPageRoute
        );
      },
      // foregroundColor: Colors.red,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to Home Page!',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
