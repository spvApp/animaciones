import 'dart:math' as Math;
import 'package:flutter/material.dart';

class BoxPage extends StatefulWidget {
  static const String ROUTE = "/box";

  @override
  _BoxPageState createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation, _rotationAnimation, _opacityAnimation;
  late Animation<Offset> _translateAnimation;
  late Animatable<Color?> _backgroundAnimate;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _sizeAnimation = Tween<double>(begin: 1, end: 6).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.decelerate));
    _opacityAnimation =
        Tween<double>(begin: 1, end: 0.5).animate(_animationController);
    _rotationAnimation = Tween<double>(begin: 0, end: 0.5 * Math.pi)
        .animate(_animationController);
    _translateAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(20, 50))
        .animate(_animationController);

    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _backgroundAnimate = TweenSequence<Color?>([
      TweenSequenceItem(
          weight: 1, tween: ColorTween(begin: Colors.red, end: Colors.blue)),
      TweenSequenceItem(
          weight: 1, tween: ColorTween(begin: Colors.blue, end: Colors.green)),
      TweenSequenceItem(
          weight: 1, tween: ColorTween(begin: Colors.green, end: Colors.yellow))
    ]);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    return Scaffold(
        appBar: AppBar(
          title: Text("Cuadrado"),
        ),
        body: AnimatedBuilder(
          animation: _animationController,
          child: Center(
            child: Container(
              width: 60,
              height: 60,
              //decoration: BoxDecoration(color: Colors.lightGreenAccent),
              color: _backgroundAnimate.evaluate(_animationController),
            ),
          ),
          builder: (_, Widget? widget) {
            //todo lo que tenga que ver con la animacion.
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.translate(
                offset: _translateAnimation.value,
                child: Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: Transform.scale(
                      scale: _sizeAnimation.value,
                      child: Container(
                        width: 60,
                        height: 60,
                        //decoration: BoxDecoration(color: Colors.lightGreenAccent),
                        color:
                            _backgroundAnimate.evaluate(_animationController),
                      ),
                    )),
              ),
            );
          },
        ));
  }
}
