import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sanchu6i/service.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Firebase_Analystics練習'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    // crate 作成 //
    final c = ElevatedButton(
        onPressed: () {
          final service = FirestoreService();
          service.crate();
        },
        child: const Text('Creat 作成'),
    );

    // read 読出 //
    final r = ElevatedButton(
      onPressed: () {
        final service = FirestoreService();
        service.read();
      },
      child: const Text('Read 読出'),
    );

    // update 変更 //
    final u = ElevatedButton(
      onPressed: () {
        final service = FirestoreService();
        service.update();
      },
      child: const Text('Update 変更'),
    );

    // delete 削除 //
    final d = ElevatedButton(
      onPressed: () {
        final service = FirestoreService();
        service.delete();
      },
      child: const Text('Delete 削除'),
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            c,
            r,
            u,
            d,
            const Text(
              'ボタンを押すとfirebaseにイベント報告されます',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter;
          FirebaseAnalytics.instance.logEvent(
            name: 'ボタンが押されました',
          );
          //_incrementCounter;

          },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
