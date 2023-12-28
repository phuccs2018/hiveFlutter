import 'dart:js_interop_unsafe';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project2/buyList.dart';
import 'package:hive/hive.dart';
import 'package:project2/main.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:project2/buyList.dart';
import 'package:project2/phone.dart';
import 'callList.dart';
import 'package:hive/hive.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class sellList extends StatefulWidget {
  const sellList({super.key});

  @override
  State<sellList> createState() => _sellListState();
}

class _sellListState extends State<sellList> {
  late Box phoneBox;

  @override
  void initState() {
    super.initState();
    phoneBox = Hive.box('phones');
    // phoneBox.put('1', 'Iphone X');
    // phoneBox.put('2', 'XiaoMi');
  var phone1 = Phone(name: "Iphone", price: 1000, quantitive: 2);
  var phone2 = Phone(name: "Xiaomi", price: 800, quantitive: 3);
  var phone3 = Phone(name: "Tablet", price: 500, quantitive: 1);
  phoneBox.put('iphone', phone1);
  phoneBox.put('xiaomi', phone2 );
  phoneBox.put('tablet', phone3);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Sell List',style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text(phoneBox.get('iphone')),
      ),
    );
  }
}
// ListView.builder(
// itemCount: phoneBox.length,
// itemBuilder: (context, index) {
// Card(
// child: Column(
// children: [
// Text((phoneBox.getAt(index) as Phone).name),
// ],
// ),
// );
// },),

