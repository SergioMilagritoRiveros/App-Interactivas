import 'package:animapp/views/forum_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:animapp/extensions/hover_extensions.dart';
import 'comment_view.dart';

class ForumComents extends StatelessWidget {
  final List<ForumMessageModel> messages;
  const ForumComents({Key key, @required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        ...messages.map((e) => CommentView(message: e).squishOnLongPress),
      ],
    );
  }
}
