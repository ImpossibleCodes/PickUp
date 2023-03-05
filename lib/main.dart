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
      title: 'PickUp',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "PickUp",
            style: (TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              //child: Padding(
              // padding: EdgeInsets.all(8.0),
              child: Card(
                  child: Center(
                child: Text('Insert Pick up Line here',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Colors.black,
                    )),
              )),
            ),

            // Row of tinder like dislike buttons here
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Center(
                      child: InkWell(
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 55,
                        ),
                        onTap: () {
                          print('Dislike');
                          (context as Element).reassemble();
                          //should refresh state with new pickup line
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: InkWell(
                        child: const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 55,
                          // color: Colors.green,
                        ),
                        onTap: () {
                          //should refresh state with new pickup line
                          print('Like');
                          (context as Element).reassemble();
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
