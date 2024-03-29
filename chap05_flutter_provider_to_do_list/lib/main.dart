import 'package:chap05_flutter_provider_to_do_list/to_do_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ToDoService()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// ToDo 클래스
class ToDo {
  String job; // 할 일
  bool isDone; // 완료 여부

  ToDo(this.job, this.isDone); // 생성자
}

/// 홈 페이지
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoService>(
      builder: (context, toDoService, child) {
        // toDoService로 부터 toDoList 가져오기
        List<ToDo> toDoList = toDoService.toDoList;

        return Scaffold(
          appBar: AppBar(
            title: Text("ToDo 리스트"),
          ),
          body: toDoList.isEmpty
              ? Center(
                  child: Text("To Do List를 작성해주세요"),
                )
              : ListView.builder(
                  itemCount: toDoList.length,
                  itemBuilder: (context, index) {
                    ToDo toDo = toDoList[index];
                    return ListTile(
                      title: Text(
                        toDo.job,
                        style: TextStyle(
                          fontSize: 20,
                          color: toDo.isDone ? Colors.grey : Colors.black,
                          decoration: toDo.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          CupertinoIcons.delete,
                        ),
                        onPressed: () {
                          //삭제 버튼이 눌렸을 때 작동
                          toDoService.deleteToDo(index);
                        },
                      ),
                      onTap: () {
                        //아이템 클릭시
                        toDo.isDone = !toDo.isDone;
                        toDoService.updateToDo(toDo, index);
                      },
                    );
                  }),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // + 버튼 클릭시 ToDo 생성 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CreatePage()),
              );
            },
          ),
        );
      },
    );
  }
}

/// ToDo 생성 페이지
class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  // TextField의 값을 가져올 때 사용
  TextEditingController textController = TextEditingController();

  // 경고 메세지
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo리스트 작성"),
        // 뒤로가기 버튼
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 텍스트 입력창
            TextField(
              controller: textController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "To Do List를 작성해주세요",
                errorText: error,
              ),
            ),
            SizedBox(height: 20),
            // 추가하기 버튼
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                child: Text(
                  "추가하기",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  // 추가하기 버튼 클릭시
                  String job = textController.text;
                  if (job.isEmpty) {
                    setState(() {
                      // 내용이 없는 경우 에러 메세지
                      error = "내용을 입력해주세요.";
                    });
                  } else {
                    setState(() {
                      // 내용이 있는 경우 에러 메세지 숨김
                      error = null;
                    });
                    //ToDoService 인스턴스 생성
                    ToDoService todoService = context.read<ToDoService>();
                    //ToDoService에 있는 createToDo 메소드 사용
                    todoService.createToDo(job);
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
