import 'package:dio/dio.dart';
import 'package:project2/phone.dart';
import 'sellList.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project2/buyList.dart';
import 'callList.dart';
import 'package:path_provider/path_provider.dart' as path;



Future<void> main() async {
  await Hive.initFlutter();

  await Hive.openBox('home');
  await Hive.openBox('phones');

  Hive.registerAdapter(PhoneAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phuc Flutter2',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => callList()));
              },
              child: Container(
                height: 32,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF00ACFF),
                ),
                child: Center(
                  child: Text(
                    'Call List',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => buyList()));
                },
                child: Container(
                  height: 32,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFF00ACFF),
                  ),
                  child: Center(
                    child: Text(
                      'Buy List',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => sellList()));
              },
              child: Container(
                height: 32,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF00ACFF),
                ),
                child: Center(
                  child: Text(
                    'Sell List',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        //
        ),
      ),
    );
  }
}
