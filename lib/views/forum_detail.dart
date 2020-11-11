import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../widgets/InputWidget.dart';
import 'forum_model.dart';

class ForumDetail extends StatefulWidget {
  final String title;
  final ForumModel forum;
  final bool isWidget;
  ForumDetail(
      {Key key,
      @required this.title,
      @required this.forum,
      this.isWidget = false})
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
          child: Image.network(widget.forum.imageURL),
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
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: () => null),
                  Text('${widget.forum.reactions}'),
                ],
              )
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: widget.forum.messages.length,
          itemBuilder: (contex, index) {
            var message = widget.forum.messages[index];
            return Card(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width / 50,
                  vertical: size.height / 45,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Autor: ${message.author}'),
                    SizedBox(height: size.height / 45),
                    Text(message.message),
                  ],
                ),
              ),
            );
          },
        ),
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
          child: Image.network(widget.forum.imageURL),
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
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: () => null),
                  Text('${widget.forum.reactions}'),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.forum.messages.length,
            itemBuilder: (contex, index) {
              var message = widget.forum.messages[index];
              return Card(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width / 10,
                    vertical: size.height / 45,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Autor: ${message.author}'),
                      SizedBox(height: size.height / 45),
                      Text(message.message),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
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
                child: Image.network(widget.forum.imageURL),
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
                        IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () => null),
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
              Expanded(
                child: ListView.builder(
                  itemCount: widget.forum.messages.length,
                  itemBuilder: (contex, index) {
                    var message = widget.forum.messages[index];
                    return Card(
                      child: Container(
                        width: size.width / 2,
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width / 30,
                          vertical: size.height / 45,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Autor: ${message.author}'),
                            SizedBox(height: size.height / 45),
                            Text(message.message),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
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
