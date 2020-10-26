import 'package:flutter/material.dart';
import '../widgets/InputWidget.dart';
import 'forum_model.dart';

class ForumDetail extends StatefulWidget {
  final String title;
  final ForumModel forum;
  ForumDetail({Key key, @required this.title, @required this.forum})
      : super(key: key);

  @override
  _ForumDetailState createState() => _ForumDetailState();
}

class _ForumDetailState extends State<ForumDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimaApp'),
        backgroundColor: Colors.amber[700],
      ),
      backgroundColor: Colors.amberAccent[50],
      body: Column(
        children: [
          SizedBox(height: size.height / 40),
          Text(
            '${widget.forum.title}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
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
                        icon: Icon(Icons.favorite_border),
                        onPressed: () => null),
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
      ),
    );
  }
}
