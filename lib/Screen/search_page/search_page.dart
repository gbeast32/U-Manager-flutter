
import 'package:flutter/material.dart';
class SearchPage extends StatefulWidget{
  @override 
  _SearchPageState createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {
  final TextEditingController JJ =new TextEditingController();
  @override
  Widget build(BuildContext context){
  return SafeArea(child:Scaffold(
    body: Center(
      child: Column(
        children: <Widget>[
          TextField(
            controller: JJ ,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              hintText:'enter something'), 
        ),
        RaisedButton (
          child: Text('print'),
          onPressed:btnEvent,
          )
        ],
      ),
    )
  )
  );
  }
  void btnEvent(){
    print(JJ.text);
  }
 }
