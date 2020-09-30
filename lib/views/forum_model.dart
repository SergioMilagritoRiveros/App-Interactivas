import 'package:flutter/material.dart';

class ForumModel {
  String imageURL;
  List<ForumMessageModel> messages;
  String author;
  String title;
  int reactions;

  ForumModel({
    this.messages,
    this.imageURL =
        'https://abhipraay.org/assets/Themes/default/images/album-default.png',
    @required this.author,
    @required this.title,
    this.reactions = 0,
  });
}

class ForumMessageModel {
  String author;
  String message;

  ForumMessageModel({
    @required this.author,
    @required this.message,
  });
}

var forumPost = [
  ForumModel(
    title: '¿Cómo puedo cuidar adecuadamente un perro?',
    author: 'Camila',
    reactions: 15,
    messages: [
      ForumMessageModel(
        author: 'Pablo',
        message: 'Me gusta que los animales sean libres donde viven',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
    ],
  ),
];
