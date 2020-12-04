import 'dart:async';
import 'package:flutter/material.dart';

class SquishOnLongPress extends StatefulWidget {
  SquishOnLongPress({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  _SquishOnLongPressState createState() => _SquishOnLongPressState();
}

class _SquishOnLongPressState extends State<SquishOnLongPress>
    with SingleTickerProviderStateMixin {
  Color a = Colors.transparent;
  Color b = Colors.transparent;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(seconds: 200), vsync: this);
  }

  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..scale(1.0, 0.98, 1.0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: _longPress,
      onTap: () {},
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _longPress() {
    setState(() {
      _hovering = true;
      Timer.periodic(Duration(milliseconds: 200), (timer) {
        setState(() {
          _hovering = false;
          timer.cancel();
        });
      });
    });
  }
}
