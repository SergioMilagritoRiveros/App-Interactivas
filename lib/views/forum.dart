import 'package:animapp/views/forum_detail.dart';
import 'package:animapp/views/forum_model.dart';
import 'package:animapp/views/forum_new_post.dart';
import 'package:animapp/widgets/InputWidget.dart';
import 'package:animapp/widgets/showMenu.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:animapp/extensions/hover_extensions.dart';

class Forum extends StatefulWidget {
  final String title;
  Forum({Key key, this.title}) : super(key: key);

  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
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
                    return PostPreview(
                      onTap: () {
                        setState(() {
                          _selected = post;
                        });
                      },
                      post: post,
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
                return PostPreview(
                  onTap: () {
                    setState(
                      () {
                        _selected = post;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForumDetail(forum: post),
                          ),
                        );
                      },
                    );
                  },
                  post: post,
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
        backgroundColor: Colors.amber[700],
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
          backgroundColor: Colors.amber[700],
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

class PostPreview extends StatefulWidget {
  final Function onTap;
  final ForumModel post;
  PostPreview({Key key, this.onTap, this.post}) : super(key: key);

  @override
  _PostPreviewState createState() => _PostPreviewState();
}

class _PostPreviewState extends State<PostPreview> {
  final BorderRadius b20 = BorderRadius.circular(20);
  final BorderRadius b20top = BorderRadius.vertical(top: Radius.circular(20));

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: b20),
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: b20,
          splashColor: Colors.amber[200],
          onTap: widget.onTap,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: b20top,
                child: Container(
                  child: Image.network(
                    widget.post.imageURL,
                    width: size.width,
                  ),
                ),
              ),
              ListTile(
                title: Text(widget.post.title),
                subtitle: Text("Autor: ${widget.post.author}"),
                trailing: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      child: LikeButton(
                        size: 20,
                      ),
                    ),
                    Text('${widget.post.reactions}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).moveUpOnHover;
  }
}
