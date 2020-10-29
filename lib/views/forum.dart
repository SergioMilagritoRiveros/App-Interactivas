import 'package:flutter/material.dart';

import '../widgets/InputWidget.dart';
import '../widgets/NavDrawer.dart';
import 'forum_detail.dart';
import 'forum_model.dart';
import 'forum_new_post.dart';

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
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('AnimaApp'),
        backgroundColor: Colors.amber[700],
      ),
      backgroundColor: Colors.amberAccent[50],
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
                  return RaisedButton(
                    elevation: 0,
                    color: Colors.transparent,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ForumDetail(title: widget.title, forum: post),
                      ),
                    ),
                    child: Card(
                      child: Column(
                        children: [
                          Image.network(post.imageURL, width: size.width),
                          ListTile(
                            title: Text(post.title),
                            subtitle: Text("Autor: ${post.author}"),
                            trailing: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(Icons.favorite_border),
                                Text('${post.reactions}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[700],
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForumNewPost(title: widget.title),
          ),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
