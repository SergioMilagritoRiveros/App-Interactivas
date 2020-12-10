import 'package:animapp/views/forum_detail.dart';
import 'package:animapp/views/forum_model.dart';
import 'package:flutter/material.dart';

class CommentView extends StatelessWidget {
  const CommentView({
    Key key,
    @required this.message,
  }) : super(key: key);

  final ForumMessageModel message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Card(
          child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Autor: ${message.author}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(message.message),
                    ),
                  ],
                ),
              ),
            ),
            AnimappLikeButton(),
          ],
        ),
      )),
    );
  }
}
