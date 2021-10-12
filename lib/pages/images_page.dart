import 'package:animaciones/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class ImagesPage extends StatefulWidget {
  static const String ROUTE = "/images";

  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imagenes"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            CustomImage(
                urlRote:
                    "https://images.freeimages.com/images/large-previews/bf4/the-road-through-the-woods-1449194.jpg"),
            SizedBox(
              height: 8,
            ),
            CustomImage(
                urlRote:
                    "https://images.freeimages.com/images/large-previews/5b7/on-the-road-7-1384791.jpg")
          ],
        ),
      ),
    );
  }
}
