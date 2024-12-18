import 'package:doit_flutter/widgets/radio_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_size/window_size.dart';
import 'dart:io';

import 'widgets/text_field.dart';
import 'widgets/tab_bar.dart';
import 'widgets/list_view.dart';

void main() async {
  if (kIsWeb) {
    // 웹에서만 동작하는 코드를 삽입하시오. 삽입?? ㅋㅋㅋ
  } else { // 웹 빌드시에 네이티브 코드들이 에러를 일으킴킴
    WidgetsFlutterBinding
        .ensureInitialized(); //Flutter 애플리케이션이 시작되기 전에 필요한 모든 시스템 및 바인딩을 초기화하는 역할을 합니다
    if (Platform.isLinux | Platform.isWindows) {
      // Platform.localeName == ko_KR, Platform.localHostname == sixtick_sub3
      setWindowTitle("${Platform.operatingSystem} application"); // windows
      setWindowMinSize(const Size(400, 800));
      setWindowMaxSize(const Size(1920, 1080));
      setWindowFrame(const Rect.fromLTWH(800, 100, 450, 900)); // 창 위치와 크기 설정
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope( // 최상위 위젯에 감싸줘야 됨.
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,  // 뭘 그럴싸하게 보여준다는거냐? ㅋㅋ
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: MyWidget(),
      ),
    );
  }
}



// 상태를 관리하는 Notifier
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() => state++;
}

// Provider 생성
final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

// Consumer에서 상태 사용
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    // return Text('Count: $count');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page', style: TextStyle(fontFamily: 'ConsolaMono', fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView( // 세로로 확장하여 스크롤 가능하다. 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  
            children: <Widget>[
              const Text(
                'You have pushed the button this many times: 한글될껄?', style: TextStyle(fontFamily: 'ConsolaMono', color: Colors.blueAccent),
              ),
              Text(
                '$count',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Image.asset('lib/images/hanni.jpg', width: 300, fit: BoxFit.contain,), // 내장이미지에 접근하려면 pubspec.yaml 에 assets 에 등록해야함
              // 외부이미지는 file
              //  문자열 형태의 이미지는 memory
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            ref.read(counterProvider.notifier).increment();
          },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // 상단 패딩 제거
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('text field'),
              onTap: () {
                Navigator.pop(context); // Drawer 닫기
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> TextFieldEx()));
                showModalBottomSheet(context: context, builder: (context)=> TextFieldEx());
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('tab bar'),
              onTap: () {
                Navigator.pop(context); // Drawer 닫기
                showModalBottomSheet(context: context, builder: (context)=> TabBarEx());
              },
            ),
            ListTile(
              leading: const Icon(Icons.circle),
              title: const Text('list view'),
              onTap: () {
                Navigator.pop(context); // Drawer 닫기
                showModalBottomSheet(context: context, builder: (context)=> ListViewEx());
              },
            ),
            ListTile(
              leading: const Icon(Icons.circle),
              title: const Text('radio button'),
              onTap: () {
                Navigator.pop(context); // Drawer 닫기
                showModalBottomSheet(context: context, builder: (context)=> RadioButtonEx());
              },
            ),
          ],
        ),
      ),
    );

  }
}
























































class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
