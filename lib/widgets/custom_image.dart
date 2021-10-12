import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatefulWidget {
  final String urlRote;

  const CustomImage({required this.urlRote});

  @override
  _CustomImageState createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _aligmnentAnimation;

  late NetworkImage _image;

  @override
  void initState() {
    _image = NetworkImage(widget.urlRote);

    _image
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((_, card) {
      //se cargo la imagen
      _animationController.forward();
    }));

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));

    _aligmnentAnimation = Tween<double>(begin: -1, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, child) {
          return FadeInImage(
              fit: BoxFit.cover,
              alignment: Alignment(_aligmnentAnimation.value, 0),
              width: 300,
              height: 300,
              placeholder: AssetImage('assets/images/load.jpg'),
              image: _image);
        },
      ),
    );
  }
}
