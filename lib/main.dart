import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rizzz',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Rizzz'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                    child: Center(
                  child: Text(
                    'Insert Pick up Line here',
                    style: TextStyle(fontSize: 24),
                  ),
                )),
              ),
            ),
            // Row of tinder like dislike buttons here
            Padding(
              padding: const EdgeInsets.all(48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Center(
                      child: InkWell(
                        child: const Icon(
                            Icons.close,
                            size: 48,
                            // color: Colors.red,
                          ),
                        onTap: () {
                          print('Dislike');
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: InkWell(
                        child: const Icon(
                          Icons.favorite,
                          size: 48,
                          // color: Colors.green,
                        ),
                        onTap: () {
                          print('Like');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
