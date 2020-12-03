import 'package:flutter/material.dart';
import '../widgets/InputWidget.dart';
import 'forum_model.dart';
import 'package:like_button/like_button.dart';
import 'package:animapp/extensions/hover_extensions.dart';

class ForumDetail extends StatefulWidget {
  final ForumModel forum;
  final bool isWidget;
  ForumDetail({Key key, @required this.forum, this.isWidget = false})
      : super(key: key);

  @override
  _ForumDetailState createState() => _ForumDetailState();
}

class _ForumDetailState extends State<ForumDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (widget.isWidget) {
      return _forumDetailWidget(size);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimaApp'),
        backgroundColor: Colors.amber[700],
      ),
      backgroundColor: Colors.amberAccent[50],
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (Orientation.portrait == orientation) {
            return _forumDetailBody(size);
          } else {
            return _forumdetailLandscapeBody(size);
          }
        },
      ),
    );
  }

  Widget _forumDetailWidget(Size size) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: size.height / 40),
        Text(
          '${widget.forum.title}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Container(
          margin: EdgeInsets.only(top: size.height / 30),
          height: size.height / 2,
          child: SplashNetworkImage(
            src: widget.forum.imageURL,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: size.height / 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Autor: ${widget.forum.author}'),
              SizedBox(width: size.width / 10),
              Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: LikeButton(
                      circleColor: CircleColor(
                        end: Colors.amber,
                        start: Colors.amberAccent,
                      ),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.amber,
                        dotSecondaryColor: Colors.amberAccent,
                      ),
                    ),
                  ),
                  Text('${widget.forum.reactions}'),
                ],
              )
            ],
          ),
        ),
        ForumComents(messages: widget.forum.messages),
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.width / 15),
          child: InputWidget(labelText: 'Comentar', icon: Icons.forum),
        )
      ],
    );
  }

  Widget _forumDetailBody(size) {
    return Column(
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
        Container(
          height: size.height / 5,
          child: SplashNetworkImage(
            src: widget.forum.imageURL,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: size.height / 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Autor: ${widget.forum.author}'),
              SizedBox(width: size.width / 15),
              Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: LikeButton(
                      circleColor: CircleColor(
                        end: Colors.amber,
                        start: Colors.amberAccent,
                      ),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.amber,
                        dotSecondaryColor: Colors.amberAccent,
                      ),
                    ),
                  ),
                  Text('${widget.forum.reactions}'),
                ],
              )
            ],
          ),
        ),
        ForumComents(messages: widget.forum.messages),
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.width / 15),
          child: InputWidget(labelText: 'Comentar', icon: Icons.forum),
        )
      ],
    );
  }

  Widget _forumdetailLandscapeBody(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width / 30),
          width: size.width / 3,
          child: ListView(
            children: [
              SizedBox(height: size.height / 40),
              Text(
                '${widget.forum.title}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: size.height / 50),
                height: size.height / 3,
                child: SplashNetworkImage(
                  src: widget.forum.imageURL,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: size.height / 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Autor: ${widget.forum.author}'),
                    SizedBox(width: size.width / 15),
                    Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          child: LikeButton(
                            circleColor: CircleColor(
                              end: Colors.amber,
                              start: Colors.amberAccent,
                            ),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Colors.amber,
                              dotSecondaryColor: Colors.amberAccent,
                            ),
                          ),
                        ),
                        Text('${widget.forum.reactions}'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: size.width / 2,
          child: Column(
            children: [
              ForumComents(messages: widget.forum.messages),
              Container(
                child: InputWidget(labelText: 'Comentar', icon: Icons.forum),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AnimatedHearthButton extends StatefulWidget {
  final double iconSize;
  AnimatedHearthButton({Key key, this.iconSize: 30}) : super(key: key);

  @override
  _AnimatedHearthButtonState createState() => _AnimatedHearthButtonState();
}

class _AnimatedHearthButtonState extends State<AnimatedHearthButton> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.red[100],
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            setState(() {
              if (opacity == 0) {
                opacity = 1;
              } else {
                opacity = 0;
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Stack(
              children: [
                Icon(Icons.favorite_border, size: widget.iconSize),
                AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: widget.iconSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SplashNetworkImage extends StatefulWidget {
  final String src;
  SplashNetworkImage({Key key, this.src}) : super(key: key);

  @override
  _SplashNetworkImageState createState() => _SplashNetworkImageState();
}

class _SplashNetworkImageState extends State<SplashNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          widget.src,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.transparent,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.amber.withOpacity(0.2),
              onTap: () {},
              child: Image.network(
                widget.src,
                fit: BoxFit.cover,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ForumComents extends StatelessWidget {
  final List<ForumMessageModel> messages;
  const ForumComents({Key key, @required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (contex, index) {
        var message = messages[index];
        return Padding(
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
                Container(
                  width: 40,
                  height: 40,
                  child: LikeButton(
                    circleColor: CircleColor(
                      end: Colors.amber,
                      start: Colors.amberAccent,
                    ),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Colors.amber,
                      dotSecondaryColor: Colors.amberAccent,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ).moveUpOnHover;
      },
    );
  }
}
