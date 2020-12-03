import 'package:flutter/material.dart';

class ScaleOnHover extends StatefulWidget {
  ScaleOnHover({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  _ScaleOnHoverState createState() => _ScaleOnHoverState();
}

class _ScaleOnHoverState extends State<ScaleOnHover> {
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..scale(1.1, 1.1, 1.1);

  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (e) => _mouseEnter(e),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }
}
