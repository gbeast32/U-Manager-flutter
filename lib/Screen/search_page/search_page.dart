import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TypeAheadField(
                  suggestionsBoxController:SuggestionsBoxController(),
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          // back page
                        },
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  
                    
                  
                  suggestionsCallback: (pattern) async {
                    return await BackendService.getSuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion['name']),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Text(suggestion)));
                  },
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
      ),
    );
  }
}

class BackendService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(Duration(milliseconds: 1));
    return List.generate(5, (index) {
      return {'name': query};
      
    });
  }
}
 
   

