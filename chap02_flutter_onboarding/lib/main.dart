import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

//SharedPreferences 인스턴스를 어디서든 접근 가능하도록 전역 변수로 선언
//late: 나중에 꼭 값을 할당해준다는 의미.
late SharedPreferences prefs;

void main() async {
  //main()함수에서 async를 쓰려면 필요
  WidgetsFlutterBinding.ensureInitialized();

  //Shared_preferences 인스턴스 생성
  prefs = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SharedPreferences 에서 온보딩 완료 여부 조회
    // isOnboarded에 해당하는 값에서 null을 반환하는 경우 false를 기본값으로 지정
    bool isOnboarded = prefs.getBool('isOnboarded') ?? false;

    return MaterialApp(
      title: 'Flutter Demo',
      // isOnboarded 값에 따라 Homepage로 열지 TestScreen으로 열지 결정됨.
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // backgroundColor: Color.fromARGB(255, 36, 34, 34),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isOnboarded ? HomePage() : TestScreen(),
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
        // 마지막 페이지가 나오거나 skip을 해서 Homepage로 가기전에 isOnboarded를 true로 바꿔준다.
        prefs.setBool('isOnboarded', true);
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
        actions: [
          IconButton(
            onPressed: () {
              prefs.clear();
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Center(
        child: Text(
          '여기서 넌 어디에도 못 간다!',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
