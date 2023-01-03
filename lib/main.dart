import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonNameOne = 'click';
  String buttonNameTwo = 'click';
  int currenctIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'settings',
              icon: Icon(Icons.settings),
            ),
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.home),
            ),
          ],
          currentIndex: currenctIndex,
          onTap: (int index) {
            setState(() {
              currenctIndex = index;
            });
          },
        ),
        appBar: AppBar(
          title: const Text('app title'),
        ),
        body: Center(
          child: currenctIndex == 0
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.red[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                        onPressed: () {
                          setState(() {
                            buttonNameOne = 'button clicked';
                          });
                        },
                        child: Text(buttonNameOne),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            buttonNameTwo = 'another button clicked';
                            buttonNameOne = buttonNameOne;
                          });
                        },
                        child: Text(buttonNameTwo),
                      ),
                    ],
                  ),
                )
              : Image.asset(
                  'assets/images/aurora-borealis-above-snowy-island-vestvagoya-lofoten_swen-stroop.jpg'),
        ),
      ),
    );
  }
}
