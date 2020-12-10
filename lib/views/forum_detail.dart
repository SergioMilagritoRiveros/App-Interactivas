import 'package:animapp/views/comment_view.dart';
import 'package:animapp/views/forum_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../widgets/InputWidget.dart';
import 'forum_comments.dart';
import 'forum_model.dart';
import 'package:like_button/like_button.dart';

class ForumDetail extends StatefulWidget {
  final ForumModel forum;
  final bool isWidget;
  ForumDetail({Key key, @required this.forum, this.isWidget = false})
      : super(key: key);

  @override
  _ForumDetailState createState() => _ForumDetailState();
}

class _ForumDetailState extends State<ForumDetail> {
  @override
  Widget build(BuildContext context) {
    if (widget.isWidget) {
      return Expanded(
        child: ForumViewModel(
          forum: widget.forum,
          isMobile: true,
        ),
      );
    }
    return ResponsiveBuilder(
      builder: (context, sizing) => Scaffold(
        appBar: AppBar(
          title: Text('AnimaApp'),
          backgroundColor: Colors.amber[700],
        ),
        backgroundColor: Colors.amberAccent[50],
        body: SizedBox.expand(
          child: ForumViewModel(
            forum: widget.forum,
            isMobile: sizing.isMobile || sizing.isTablet,
          ),
        ),
      ),
    );
  }
}

class AnimatedHearthButton extends StatefulWidget {
  final double iconSize;
  AnimatedHearthButton({Key key, this.iconSize: 30}) : super(key: key);

  @override
  _AnimatedHearthButtonState createState() => _AnimatedHearthButtonState();
}

class _AnimatedHearthButtonState extends State<AnimatedHearthButton> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.red[100],
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            setState(() {
              if (opacity == 0) {
                opacity = 1;
              } else {
                opacity = 0;
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Stack(
              children: [
                Icon(Icons.favorite_border, size: widget.iconSize),
                AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: widget.iconSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SplashNetworkImage extends StatefulWidget {
  final String src;
  SplashNetworkImage({Key key, this.src}) : super(key: key);

  @override
  _SplashNetworkImageState createState() => _SplashNetworkImageState();
}

class _SplashNetworkImageState extends State<SplashNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 1000,
            maxWidth: 700,
          ),
          child: Stack(
            children: [
              Image.network(
                widget.src,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.transparent,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.amber.withOpacity(0.2),
                    onTap: () {},
                    child: Image.network(
                      widget.src,
                      fit: BoxFit.cover,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimappLikeButton extends StatefulWidget {
  const AnimappLikeButton({
    Key key,
  }) : super(key: key);

  @override
  _AnimappLikeButtonState createState() => _AnimappLikeButtonState();
}

class _AnimappLikeButtonState extends State<AnimappLikeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: LikeButton(
        circleColor: CircleColor(
          end: Colors.amber,
          start: Colors.amberAccent,
        ),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Colors.amber,
          dotSecondaryColor: Colors.amberAccent,
        ),
      ),
    );
  }
}
