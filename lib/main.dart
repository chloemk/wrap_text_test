import 'package:flutter/material.dart';
import 'package:wrapped_korean_text/wrapped_korean_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Text Wrap Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Text Wrap Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _longText = '안녕하세요. 이것은 플러터 테스트를 하기 위한 데모 프로젝트입니다. 긴 글자를 입력하려고 하는데 위젯이 업데이트가 제대로 되는지 확인하려고 합니다.';

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '일반 텍스트 위젯 : $_counter',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.blue),
                ),
                WrappedKoreanText(
                  'WrappedKoreanText 텍스트 위젯 : $_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  '일반 텍스트 위젯 : $_longText',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.blue),
                ),
                WrappedKoreanText(
                  'WrappedKoreanText Long Text : $_longText',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(onPressed: () {
                  setState(() => _longText = '$_longText더하기$_counter');
                },
                child: const Text('long text 더 길게 만들기'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
