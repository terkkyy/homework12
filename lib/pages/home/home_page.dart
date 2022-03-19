import 'dart:convert';

import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> Menus = [];

  get http => null;

  void _handClickButton() async {
    var CallApi = await http.get(Uri.parse('https://cpsu-test-api.herokuapp.com/foods'));
    var json= jsonDecode(CallApi.body);
    setState(() {
      Menus=json['data'];

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FLUTTER FOOD'),
        ),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: _handClickButton,
                  child: const Text('LOAD FOODS DATA'),
                )),
            Expanded(
              child: ListView.builder(
                  itemCount: Menus.length,
                  itemBuilder: (_, int index) => Card(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.network(
                          Menus[index]["image"],
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                width: 300.0,
                                child: Text(
                                  Menus[index]["name"],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Container(
                                width: 300.0,
                                child: Text(
                                  Menus[index]["price"].toString() + " บาท",
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}