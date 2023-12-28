import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'main.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';

class callList extends StatefulWidget {
  const callList({super.key});

  @override
  State<callList> createState() => _callListState();
}

class _callListState extends State<callList> {
  bool _isLoading = true;
  var jsonList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  final dio = Dio();

  void getHttp() async {
    try {
      final response = await dio
          .get('https://my-json-server.typicode.com/imkhan334/demo-1/call');
      print(response);
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data as List;
          _isLoading = false;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Call List'),
          actions: [
            IconButton(
              onPressed: () {
               },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
        body: Center(
          child: _isLoading
              ? SizedBox(
                child: CircularProgressIndicator(backgroundColor: Colors.blue,))
              : ListView.builder(
                  // scrollDirection: Axis.vertical,
                  // shrinkWrap: true, // new line
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: jsonList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Name : '),
                              Text(jsonList[index]['name']),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Number : ',
                                style: TextStyle(height: 3),
                              ),
                              Text(jsonList[index]['number']),
                            ],
                          ),
                          const Divider(
                            height: 5,
                            thickness: 1,
                            indent: 1,
                            endIndent: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ));
  }
}
