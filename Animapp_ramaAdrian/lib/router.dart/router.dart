import 'package:animapp/views/ScheduledAppointment.dart';
import 'package:animapp/views/forum.dart';
import 'package:animapp/views/forum_new_post.dart';
import 'package:animapp/views/loginPage.dart';
import 'package:animapp/views/map.dart';
import 'package:animapp/views/signup.dart';
import 'package:animapp/views/welcomePage.dart';
import 'package:animapp/views/whatAreYouSearchingFor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'route_names.dart';
import 'routing_data.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  RoutingData routingData = settings.name.getRoutingData;

  var route = routingData.route;

  switch (route) {
    case WelcomePageRoute:
      return _getPageRoute(WelcomePage(), settings);
    case HomeRoute:
      return _getPageRoute(WhatAreYouSearchingFor(), settings);
    case InicioRoute:
      return _getPageRoute(WhatAreYouSearchingFor(), settings);
    case LoginRoute:
      return _getPageRoute(LoginPage(), settings);

    case RegisterRoute:
      return _getPageRoute(SignUpPage(), settings);
    case MapPageRoute:
      return _getPageRoute(MapPage(), settings);
    case NewForumRoute:
      return _getPageRoute(ForumNewPost(title: "Animapp"), settings);
    case ForumsRoute:
      return _getPageRoute(Forum(title: "Animapp"), settings);
    case ScheduledAppointmentRoute:
      return _getPageRoute(ScheduledAppointment(), settings);
    default:
      return _getPageRoute(WelcomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
