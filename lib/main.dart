import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async{
  List _data= await getJson();
  String data=_data[0]['title'];
  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("My Json"),
        centerTitle:true,
      ),
      
      body: new Center(
            child: new ListView.builder(
                itemCount: _data.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (BuildContext context, int position){
                  if(position.isEven){return new Divider();}
                  return new ListTile(
                    title: new Text(_data[position]['title'],style: new TextStyle(fontSize: 12.9),),
                    leading: new CircleAvatar(
                      backgroundColor: Colors.green,
                      child: new Text(_data[position]['title'][0].toString().toUpperCase(),
                        style:new TextStyle(color: Colors.deepOrange,fontSize: 15.9),),

                    ),

                  );
                }),
        

      ) ,
    ),
  ));
}
 Future<List> getJson() async{
  String Url='https://jsonplaceholder.typicode.com/posts';
  http.Response response=await http.get(Url);
  return json.decode(response.body);
 }