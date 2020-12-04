import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../widgets/InputWidget.dart';

class ForumNewPost extends StatefulWidget {
  ForumNewPost({Key key}) : super(key: key);

  @override
  _ForumNewPostState createState() => _ForumNewPostState();
}

class _ForumNewPostState extends State<ForumNewPost> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimaApp'),
        backgroundColor: Colors.amber[700],
      ),
      backgroundColor: Colors.amberAccent[50],
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width / 25, vertical: size.height / 50),
        child: ListView(
          children: [
            Text(
              'Crear nueva publicación',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            InputWidget(labelText: 'Ingrese su pregunta', icon: Icons.forum),
            InputWidget(
              labelText: 'Ingrese una descripción',
              icon: Icons.description,
              maxLines: 5,
              maxLength: 240,
            ),
            SizedBox(height: size.height / 30),
            RaisedButton(
              onPressed: () => null,
              color: Colors.transparent,
              elevation: 0,
              child: Image.network(
                'https://abhipraay.org/assets/Themes/default/images/album-default.png',
                height: size.height / 5,
              ),
            ),
            SizedBox(height: size.height / 30),
            RaisedButton(
              color: Colors.amber[700],
              onPressed: () => Navigator.pop(context, PageTransition(type: PageTransitionType.fade, child: null)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: size.height / 50),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Publicar',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: size.width / 25),
                    Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
