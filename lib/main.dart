import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void aFunction() {
    print('button is pressed');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Billionaire App'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.blueGrey[700],
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bank Balance: '),
                    SizedBox(
                      height: 20,
                    ),
                    Text('0'),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        minimumSize: Size(double.infinity, 0),
                      ),
                      onPressed: aFunction,
                      child: Text('Click Here')))
            ],
          ),
        ),
      ),
    );
  }
}
