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
        title: 'App타이틀',
        //App의 전반적인 테마를 설정한다.
        theme: ThemeData(
          //텍스트의 style을 미리 설정하고 호출해 사용 가능하다.
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Appbar'),
            backgroundColor: Colors.blue,
          ),
          body: Center(
            child: Text('iphone 22'),
          ),
          // BottomNavigationBar
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'school',
              ),
            ],
          ),
          // FloatingActionButton
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.access_alarm),
              onPressed: () => {
                    print('hello'),
                  }),
        ));
  }
}
