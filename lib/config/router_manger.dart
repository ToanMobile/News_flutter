import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news/ui/screen/bookmark/bookmark_page.dart';
import 'package:news/ui/screen/home/home_page.dart';
import 'package:news/ui/screen/home/tab_navigator.dart';
import 'package:news/ui/screen/login/login_page.dart';
import 'package:news/ui/screen/profile/profile_page.dart';
import 'package:news/ui/widget/page_route_anim.dart';

class RouteName {
  static const String welcome = 'welcome';
  static const String home = '/';
  static const String login = 'login';
  static const String register = 'register';
  static const String register_success = 'register_success';
  static const String setting = 'setting';
  static const String tab_home = 'tab_home';
  static const String tab_review = 'tab_review';
  static const String tab_challenge = 'tab_challenge';
  static const String tab_profile = 'tab_profile';
  static const String tab_more = 'tab_more';
}

//SlideTopRouteBuilder
//CupertinoPageRoute

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.welcome:
        return NoAnimRouteBuilder(BookmarkPage());
      case RouteName.login:
        return NoAnimRouteBuilder(LoginPage());
      case RouteName.register:
        return NoAnimRouteBuilder(LoginPage());
      case RouteName.register_success:
        return NoAnimRouteBuilder(LoginPage());
      case RouteName.home:
        return NoAnimRouteBuilder(TabNavigator());
      case RouteName.tab_home:
        return NoAnimRouteBuilder(HomePage());
      case RouteName.tab_review:
        return NoAnimRouteBuilder(LoginPage());
      case RouteName.tab_challenge:
        return NoAnimRouteBuilder(LoginPage());
      case RouteName.tab_profile:
        return NoAnimRouteBuilder(ProfilePage());
      case RouteName.tab_more:
        return NoAnimRouteBuilder(LoginPage());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
