import 'package:animapp/views/forum_model.dart';
import 'package:animapp/widgets/InputWidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'forum_comments.dart';
import 'forum_detail.dart';

class ForumViewModel extends StatefulWidget {
  final ForumModel forum;
  final bool isMobile;
  ForumViewModel({Key key, @required this.forum, @required this.isMobile})
      : super(key: key);

  @override
  _ForumViewModelState createState() => _ForumViewModelState();
}

class _ForumViewModelState extends State<ForumViewModel> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var verticalView = ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: size.height / 40),
        Text(
          '${widget.forum.title}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: size.height / 40,
        ),
        SplashNetworkImage(
          src: widget.forum.imageURL,
        ),
        ForumAuthor(
            author: widget.forum.author,
            reactions: widget.forum.reactions.toStringAsFixed(0)),
        ForumComents(messages: widget.forum.messages),
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.width / 15),
          child: InputWidget(labelText: 'Comentar', icon: Icons.forum),
        ),
      ],
    );
    var horizontalView = Row(
      children: [
        Expanded(
          flex: 1,
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: size.height / 40),
              Text(
                '${widget.forum.title}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height / 40,
              ),
              SplashNetworkImage(
                src: widget.forum.imageURL,
              ),
              ForumAuthor(
                author: widget.forum.author,
                reactions: widget.forum.reactions.toStringAsFixed(0),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView(
            shrinkWrap: true,
            children: [
              ForumComents(messages: widget.forum.messages),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width / 15),
                child: InputWidget(labelText: 'Comentar', icon: Icons.forum),
              ),
            ],
          ),
        )
      ],
    );

    return widget.isMobile ? verticalView : horizontalView;
  }
}

class ForumAuthor extends StatelessWidget {
  final String author;
  final String reactions;

  const ForumAuthor({
    Key key,
    @required this.author,
    @required this.reactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: size.height / 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Autor: $author'),
          SizedBox(width: size.width / 15),
          Column(
            children: [
              AnimappLikeButton(),
              Text('$reactions'),
            ],
          )
        ],
      ),
    );
  }
}
