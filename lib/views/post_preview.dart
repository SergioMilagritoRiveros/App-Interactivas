import 'package:animapp/views/forum_model.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:animapp/extensions/hover_extensions.dart';
import '../global.dart';

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

  final BorderRadius b10 = BorderRadius.circular(10);
  final BorderRadius b10top = BorderRadius.vertical(top: Radius.circular(10));
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var postPreviewMobile = Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: b10),
      color: isDarkMode ? Colors.grey.shade800 : Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: b10,
          splashColor: Colors.amber[200],
          onTap: widget.onTap,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: b10top,
                child: Container(
                  child: Image.network(
                    widget.post.imageURL,
                    width: size.width,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  widget.post.title,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                subtitle: Text(
                  "Autor: ${widget.post.author}",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
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
    );
    var postPreviewDesktop = Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: b20),
      color: isDarkMode ? Colors.grey.shade800 : Colors.white,
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
                title: Text(
                  widget.post.title,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                subtitle: Text(
                  "Autor: ${widget.post.author}",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
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
    );

    return ResponsiveBuilder(builder: (context, sizing) {
      return sizing.isDesktop
          ? postPreviewDesktop.moveUpOnHover
          : postPreviewMobile.squishOnLongPress;
    });
  }
}
