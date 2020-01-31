import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_annotation/json_annotation.dart';


void main(){
runApp(MaterialApp(title: 'listview horizontal',theme: ThemeData(primarySwatch: Colors.yellow,),
home:HomePage()));
} 

class HomePage extends StatefulWidget{
  _HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This widget is the root of your application.
  List data;
Future<String> loadJsonDate() async {
  var jsonText = await rootBundle.loadString('assets/articles.json');

  setState(() {
      data = json.decode(jsonText);
    });
 
  print(jsonText);
  }

  @override
  void initState(){
    this.loadJsonDate();
  }

/*
Container MyArticles(String imageVal,String heading, String subheading){
  return Container(
    width:  160.0,
    child: Card(
      child: Wrap(
        children: <Widget>[
          Image.network(imageVal),
          ListTile(
            title:Text(heading),
            subtitle: Text(subheading),
          )
        ],
      ),
      ),
  );
}
*/
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Scroll View-Horizontal",
          style: TextStyle(
            color: Colors.black
          ),
          ),
        ),
  body: Container(
    margin: EdgeInsets.symmetric(vertical: 20.0),
    height: 190,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (BuildContext context,int index){

        return  Container(
    width:  160.0,
    child: Card(
      child: Wrap(
        children: <Widget>[
          Image.network(data[index]['imagelink']),
          ListTile(
            title:Text(data[index]['titull']),
            subtitle: Text(data[index]['subtitle']),
          )
        ],
      ),
      ),
  );
      },

    ),
    ),
  );
  }
}


