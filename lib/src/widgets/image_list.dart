import '../models/image_model.dart';
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  
  ImageList(this.images);
  
  @override
  Widget build(BuildContext context) {

    return ListView.builder(itemCount: images.length,
      itemBuilder: (context, int index) {
        return buiildImage(images[index]);
      }
    );
  }

  Widget buiildImage(ImageModel image) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1, 
          color: Color.fromRGBO(232, 20, 20, 1)
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(child: Image.network(image.url), padding: EdgeInsets.only(bottom: 8.0)),
          
          Text(image.title)
        ]
      ),
    );
  }
}
