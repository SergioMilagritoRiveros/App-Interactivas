import 'package:flutter/material.dart';

class TranslateOnHover extends StatefulWidget {
  TranslateOnHover({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0, -3, 0);

  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (e) => _mouseEnter(e),
      onTap: () {},
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
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
