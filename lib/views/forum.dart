import 'package:animapp/views/forum_detail.dart';
import 'package:animapp/views/forum_model.dart';
import 'package:animapp/views/forum_new_post.dart';
import 'package:animapp/views/post_preview.dart';
import 'package:animapp/widgets/InputWidget.dart';
import 'package:animapp/widgets/showMenu.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Forum extends StatefulWidget {
  Forum({Key key}) : super(key: key);

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
      return ForumDetail(
        forum: _selected,
        isWidget: true,
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
                PageTransition(
                  type: PageTransitionType.fade,
                  child: ForumNewPost(),
                ),
              ),
          child: Icon(Icons.add, color: Colors.black)),
    );
  }
}
