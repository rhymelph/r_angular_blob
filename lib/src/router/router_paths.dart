


import 'package:angular_router/angular_router.dart';

const fileName = 'fileName';
const tagName = 'tagName';

class RouterPaths{
  static final homePage =RoutePath(path: 'home');
  static final tagPage = RoutePath(path: 'tag/:$tagName');
  static final filePage =RoutePath(path: 'file');
  static final videoPage =RoutePath(path: 'video');
  static final aboutPage =RoutePath(path: 'about');
  static final coursePage =RoutePath(path: 'course');
  static final articleDetailPage =RoutePath(path: 'articles/detail/:$fileName');
}