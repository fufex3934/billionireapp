import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0;

  Future<void> addMoney() async {
    setState(() {
      balance += 500;
    });

    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an double value to 'decimal' key.
    await prefs.setDouble('balance', balance);
  }

  Future<void> loadBalance() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

setState(() {
  // Save an double value to 'decimal' key.
    final double? balance=  prefs.getDouble('balance');
});
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
                    Text('$balance\$'),
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
                      onPressed: addMoney,
                      child: Text('Click Here')))
            ],
          ),
        ),
      ),
    );
  }
}
