import 'package:flutter/material.dart';
import 'dart:math' as Math;

class Box2Page extends StatefulWidget {
  static const String ROUTE = "/box2";

  @override
  _Box2PageState createState() => _Box2PageState();
}

class _Box2PageState extends State<Box2Page> {
  double _width = 50, _height = 50;
  Color _color = Colors.purple;
  BorderRadius _borderRadius = BorderRadius.circular(8);
  Offset _offset = Offset(1.5, 2);

  @override
  Widget build(BuildContext context) {
    final random = Math.Random();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.update),
        onPressed: () {
          this._height = random.nextInt(300).toDouble();
          this._width = random.nextInt(300).toDouble();

          this._color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
              random.nextInt(256), random.nextDouble());

          this._offset = Offset(
              random.nextInt(15).toDouble(), random.nextInt(15).toDouble());
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
              boxShadow: [
                BoxShadow(
                    offset: _offset,
                    color: Colors.black12,
                    blurRadius: random.nextInt(50).toDouble())
              ]),
          width: this._width,
          height: this._height,
          child: Text("${this._width} ${this._height}"),
        ),
      ),
    );
  }
}
