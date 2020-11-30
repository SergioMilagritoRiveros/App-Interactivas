import 'package:animapp/blocs/darkThemeProvider.dart';
import 'package:animapp/views/forum_detail.dart';
import 'package:animapp/views/forum_model.dart';
import 'package:animapp/views/forum_new_post.dart';
import 'package:animapp/widgets/InputWidget.dart';
import 'package:animapp/widgets/showMenu.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  final String title;
  Forum({Key key, this.title}) : super(key: key);

  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  DarkThemeProvider darkTheme = new DarkThemeProvider();
  ForumModel _selected;

  Widget _landscape(Size size) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: size.width / 50),
          width: size.width / 3,
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
                      onPressed: () => setState(() => _selected = post),
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
        _buildSelected(size),
      ],
    );
  }

  Widget _buildSelected(Size size) {
    if (_selected != null) {
      return Container(
        padding: EdgeInsets.only(left: size.width / 50),
        width: 2 * size.width / 3,
        child: ForumDetail(
          title: widget.title,
          forum: _selected,
          isWidget: true,
        ),
      );
    }
    return Container();
  }

  Widget _portrait(size) {
    return Container(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimaApp'),
        backgroundColor: darkTheme.darkTheme ? Colors.blue : Color(0xffe46b10),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => showPopupMenu(context),
          )
        ],
      ),
      backgroundColor: Colors.amberAccent[50],
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.portrait) {
            return _portrait(size);
          }
          return _landscape(size);
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: darkTheme.darkTheme ? Colors.blue : Colors.amber[700],
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForumNewPost(title: widget.title),
                ),
              ),
          child: Icon(Icons.add, color: Colors.black)),
    );
  }
}
