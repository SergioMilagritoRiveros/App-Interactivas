import 'package:flutter/material.dart';
import 'package:pet_house/forum_detail.dart';
import 'package:pet_house/forum_model.dart';
import 'package:pet_house/forum_new_post.dart';
import 'package:pet_house/inputwidget.dart';

class Forum extends StatefulWidget {
  final String title;
  Forum({Key key, @required this.title}) : super(key: key);

  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width / 20),
        child: Column(
          children: [
            InputWidget(labelText: 'Buscar', icon: Icons.search),
            SizedBox(height: size.height / 25),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: forumPost.length,
                itemBuilder: (context, index) {
                  var post = forumPost[index];
                  return ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ForumDetail(title: widget.title, forum: post),
                      ),
                    ),
                    leading:
                        Image.network(post.imageURL, width: size.width / 5),
                    title: Text(post.title),
                    subtitle: Text("Autor: ${post.author}"),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.favorite_border),
                        Text('${post.reactions}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellowAccent[100],
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForumNewPost(title: widget.title),
          ),
        ),
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
