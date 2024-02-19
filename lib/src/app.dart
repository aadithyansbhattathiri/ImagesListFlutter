import 'dart:io';
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart'; // syntax to import 3rd party

class App extends StatefulWidget {
  @override
  createState() {
    return AppState();
  }
}

// widget state class
class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter += 1;
    var client = http.Client();
    //client.get(Uri.http('jsonplaceholder.typicode.com', 'photos/$counter')).then((response) {
    //  print('Response status: ${response.statusCode}');
    //  print('Response body: ${response.body}');
    // });

    var response = await client.get(Uri.http('jsonplaceholder.typicode.com', 'photos/$counter'));
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);  
    });
  }

  Widget build(context) {
    var app = MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lets see some images'),
          backgroundColor: Color.fromRGBO(99, 120, 236, 1)
        ),
        floatingActionButton: 
            FloatingActionButton(
              backgroundColor: Color.fromRGBO(2, 158, 205, 1),
              onPressed: fetchImage,
              child: Icon(Icons.add),
            ),
            
        body: ImageList(images),
      ));
    return app;
  }
}
