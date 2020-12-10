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
        'https://static3.teletica.com/Files/Sizes/2020/3/6/1346659218_760x520.jpg',
    @required this.author,
    @required this.title,
    this.reactions = 0,
  });

  ForumModel fromJSON(string) {}
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
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
    ],
  ),
  ForumModel(
    title: '¿Cómo puedo cuidar adecuadamente un gato?',
    author: 'Juan',
    reactions: 125,
    messages: [
      ForumMessageModel(
        author: 'Arnoldo',
        message: 'asdasdasda sd',
      ),
      ForumMessageModel(
        author: 'Maria',
        message: 'asdasdasd',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
    ],
  ),
  ForumModel(
    title: '¿Cómo puedo cuidar adecuadamente un gato?',
    author: 'Juan',
    reactions: 125,
    messages: [
      ForumMessageModel(
        author: 'Arnoldo',
        message: 'asdasdasda sd',
      ),
      ForumMessageModel(
        author: 'Maria',
        message: 'asdasdasd',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
    ],
  ),
  ForumModel(
    title: '¿Cómo puedo cuidar adecuadamente un gato?',
    author: 'Juan',
    reactions: 125,
    messages: [
      ForumMessageModel(
        author: 'Arnoldo',
        message: 'asdasdasda sd',
      ),
      ForumMessageModel(
        author: 'Maria',
        message: 'asdasdasd',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
      ForumMessageModel(
        author: 'Maria',
        message:
            'La verdad, me gusta bañarlo cada semana, el olor a perro lavado me encanta!',
      ),
    ],
  ),
];
