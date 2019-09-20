import 'dart:math';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _myController = TextEditingController();
  List<String> data = [
    'chip1',
    'chip2',
    'chip3',
    'chip4',
    'chip5',
    'chip6',
  ];

  Color _randomColor() {
    var red = Random.secure().nextInt(255);
    var green = Random.secure().nextInt(255);
    var blue = Random.secure().nextInt(255);
    return Color.fromARGB(160, red, green, blue);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(12),
                        bottomLeft: const Radius.circular(12),
                        topRight: const Radius.circular(12),
                        bottomRight: const Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  prefixIcon: Icon(Icons.arrow_back),
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: 'enter something',
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                ),
                autofocus: false,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
              Wrap(
                spacing: 5,
                children: data
                    .map(
                      (chip) => Chip(
                        label: Text(chip),
                        backgroundColor: _randomColor(),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
