

import 'package:angular_router/angular_router.dart';
import 'package:r_angular_blob/src/router/router_paths.dart';
import 'package:r_angular_blob/src/page/home_page/home_page_component.template.dart' as home_page_template;
import 'package:r_angular_blob/src/page/course_page/course_page_component.template.dart' as course_page_template;
import 'package:r_angular_blob/src/page/video_page/video_page_component.template.dart' as video_page_template;
import 'package:r_angular_blob/src/page/file_page/file_page_component.template.dart' as file_page_template;
import 'package:r_angular_blob/src/page/about_page/about_page_component.template.dart' as about_page_template;
import 'package:r_angular_blob/src/page/article_detail/article_detail_component.template.dart' as article_detail_page_template;
import 'package:r_angular_blob/src/page/tag_page/tag_page_component.template.dart' as tag_page_template;

class Routes{

static final homePage = RouteDefinition(
    routePath: RouterPaths.homePage,
    component: home_page_template.HomePageComponentNgFactory,
    useAsDefault: true
  );
static final coursePage = RouteDefinition(
    routePath: RouterPaths.coursePage,
    component: course_page_template.CoursePageComponentNgFactory,
  );
static final videoPage = RouteDefinition(
    routePath: RouterPaths.videoPage,
    component: video_page_template.VideoPageComponentNgFactory,
  );

  static final filePage = RouteDefinition(
    routePath: RouterPaths.filePage,
    component: file_page_template.FilePageComponentNgFactory,
  );

  static final aboutPage = RouteDefinition(
    routePath: RouterPaths.aboutPage,
    component: about_page_template.AboutComponentNgFactory,
  );
    static final tagPage = RouteDefinition(
    routePath: RouterPaths.tagPage,
    component: tag_page_template.TagPageComponentNgFactory,
  );
static final articleDetailPage = RouteDefinition(
    routePath: RouterPaths.articleDetailPage,
    component: article_detail_page_template.ArticleDetailComponentNgFactory,
  );
  static final all  = <RouteDefinition>[
    homePage,
    articleDetailPage,
    coursePage,
    videoPage,
    filePage,
    aboutPage,
    tagPage,
  ];
}