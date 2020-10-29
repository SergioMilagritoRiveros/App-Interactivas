
import 'package:animapp/views/ScheduleForm.dart';
import 'package:animapp/views/ScheduledAppointment.dart';
import 'package:animapp/views/placeDetail.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
  ForumModel selectedPost;

  List<Widget> recentsPosts(SizingInformation sizing) {
    List<Widget> posts = List<Widget>();
    for (int i = 0; i < forumPost.length; i++) {
      posts.add(
        ForumPostCard(
          post: forumPost[i],
          onTap: () {
            setState(() {
              selectedPost = forumPost[i];
              if (sizing.isMobile) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ForumDetail(
                      title: "animap",
                      forum: selectedPost,
                    ),
                  ),
                );
              }
            });
          },
        ),
      );
    }
    return posts;
  }

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
              child: ResponsiveBuilder(
                builder: (context, sizing) => Row(
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        controller: ScrollController(),
                        physics: AlwaysScrollableScrollPhysics(),
                        children: [
                          ...recentsPosts(sizing),
                        ],
                      ),
                    ),
                    if (selectedPost != null && !sizing.isMobile)
                      Expanded(
                        child: ForumDetail(
                          title: "Animap",
                          forum: selectedPost,
                        ),
                      ),
                  ],
                ),
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

class ForumPostCard extends StatelessWidget {
  const ForumPostCard({
    Key key,
    @required this.post,
    this.onTap,
  }) : super(key: key);

  final ForumModel post;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizing) {
        var webCard = Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            child: Material(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onTap,
                child: Row(
                  children: [
                    Image.network(post.imageURL),
                    Expanded(
                      child: ListTile(
                        title: Text(post.title),
                        subtitle: Text("Autor: ${post.author}"),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(Icons.favorite_border),
                              Text('${post.reactions}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        var mobileCard = Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            child: Material(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onTap,
                child: Column(
                  children: [
                    Image.network(post.imageURL),
                    Expanded(
                      child: ListTile(
                        title: Text(post.title),
                        subtitle: Text("Autor: ${post.author}"),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(Icons.favorite_border),
                              Text('${post.reactions}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        return sizing.isMobile ? mobileCard : webCard;
      },
    );
  }
}
