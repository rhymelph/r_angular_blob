import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'package:r_angular_blob/src/entity/course_entity.dart';

@Component(
    selector: 'course-page',
    templateUrl: 'course_page_component.html',
    directives: [
      MaterialButtonComponent,
      MaterialIconComponent,
      NgFor,
      HostListener,
      MaterialChipComponent,
    ],
    styleUrls: [
      'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
      'course_page_component.scss.css',
    ])
class CoursePageComponent {
  Router _router;
  CoursePageComponent(this._router);

  List<CourseEntity> courseList = [
    CourseEntity(
      'r_upgrade',
      'Rhyme',
      'Flutter应用升级更新插件，支持全量更新，增量更新，热更新，通知栏显示',
      'http://github.com/rhymelph/r_upgrade',
      '作者开源的插件',
    ),
    CourseEntity(
      'r_scan',
      'Rhyme',
      'Flutter二维码、条形码扫描插件，支持自定义扫描Camera,文件、链接、Uint8List类型扫描',
      'http://github.com/rhymelph/r_scan',
      '作者开源的插件',
    ),
    CourseEntity(
      'r_router',
      'Rhyme',
      'Flutter路由跳转插件，无需Context，支持路由拦截，Dialog',
      'http://github.com/rhymelph/r_router',
      '作者开源的插件',
    ),
    CourseEntity(
      'r_dotted_line_border',
      'Rhyme',
      'Flutter关于虚线边框的插件包',
      'http://github.com/rhymelph/r_dotted_line_border',
      '作者开源的插件',
    ),
    CourseEntity(
      'r_calendar',
      'Rhyme',
      'Flutter关于日历的插件包，支持自定义日历，月视图/周视图切换，点击拦截、单选、多选',
      'http://github.com/rhymelph/r_calendar',
      '作者开源的插件',
    ),
    CourseEntity(
      'r_logger',
      'Rhyme',
      'Flutter日志打印的插件，突破长文本限制',
      'http://github.com/rhymelph/r_upgrade',
      '作者开源的插件',
    ),
    CourseEntity(
      'r_album',
      'Rhyme',
      'Flutter保存图片或者视频到相册，支持Android和IOS平台',
      'http://github.com/rhymelph/r_upgrade',
      '作者开源的插件',
    ),
    CourseEntity(
      'fluct',
      'Rhyme',
      'Dart开发的脚本包，能帮助开发者快速开发应用',
      'http://github.com/rhymelph/fluct',
      '作者开源的插件',
    ),
    CourseEntity(
      'dartis',
      'Dart团队',
      'Dart中的Redis',
      'https://pub.dev/packages/dartis',
      'Dart服务端',
    ),
    CourseEntity(
      'gRPC',
      'Dart团队',
      'Dart中的gRPC',
      'https://grpc.io/docs/quickstart/dart/',
      'Dart服务端',
    ),
    CourseEntity(
      'Redstone',
      'Luiz Mineo',
      '基于元数据的微服务框架',
      'http://redstonedart.org/',
      'Dart服务端',
    ),
    CourseEntity(
      'Jagular',
      'Ravi Teja Gudapati & Ravi Teja Gudapati',
      '完整的可用于生产环境的HTTP服务器框架',
      'https://jaguar-dart.com/',
      'Dart服务端',
    ),
    CourseEntity(
      'Angel',
      'Tobe Osakwe',
      '高性能，可立即投入生产的后端框架',
      'https://angel-dart.dev/',
      'Dart服务端',
    ),
    CourseEntity(
      'Aqueduct',
      'Stablekernel公司',
      'HTTP服务器框架,用于构建多线程的REST API服务',
      'https://aqueduct.io/',
      'Dart服务端',
    ),
    CourseEntity(
      'angular_ui',
      'akserg',
      '基于Angular的Bootstrap UI 实现',
      'https://github.com/akserg/angular.dart.ui',
      'AngularDart',
    ),
    CourseEntity(
      'AngularDart组件库',
      'Dart团队',
      '基于Material Desigin风格设计的组件库',
      'https://dart-lang.github.io/angular_components/',
      'AngularDart',
    ),
    CourseEntity(
      'AngularDart官网',
      'Dart团队',
      '一个专注于生产力，性能和稳定性的Web应用程序框架。',
      'https://angulardart.dev/',
      'AngularDart',
    ),

    /// Flutter
    CourseEntity(
      'Flutter 开发社区',
      'Null',
      'Flutter开发社区是学习Flutter框架的中文社区',
      'http://www.flutter123.net/',
      'Flutter',
    ),
    CourseEntity(
      'Cocoa China',
      '北京触控科技有限公司',
      '全球最大苹果开发者中文社区',
      'http://www.cocoachina.com/cms/tags.php?/Flutter/',
      'Flutter',
    ),
    CourseEntity(
      '简书',
      '上海佰集信息科技有限公司',
      '国内最优质的创作社区。',
      'https://www.jianshu.com/search?q=Flutter&page=1&type=note',
      'Flutter',
    ),
    CourseEntity(
      '掘金',
      '掘金企业',
      '一个帮助开发者成长的社区',
      'https://juejin.im/tag/Flutter',
      'Flutter',
    ),
    CourseEntity(
      '玩Android',
      'hongyang',
      '玩Android',
      'https://www.wanandroid.com/article/query?k=Flutter',
      'Flutter',
    ),
    CourseEntity(
      'Flutter教程网',
      'ahyang',
      '代码分享 实用教程',
      'http://www.flutterj.com/',
      'Flutter',
    ),
    CourseEntity(
      'FlUI',
      'Hanran Liu',
      '一个 Google Flutter 的组件扩展集',
      'https://www.flui.xin/',
      'Flutter',
    ),
    CourseEntity(
      'Flutter社区中文资源',
      'Yihui Miao',
      'Flutter社区中文资源',
      'https://flutter.cn/',
      'Flutter',
    ),
    CourseEntity(
      'Flutter中文网',
      'wendux',
      'Flutter中文网',
      'https://flutterchina.club/',
      'Flutter',
    ),
    CourseEntity(
      'Flutter官网',
      'Flutter团队',
      'Flutter官网',
      'https://flutter.dev/',
      'Flutter',
    ),
    CourseEntity(
      'Flutter | 老孟',
      '老孟',
      '全网最全组件介绍,目前收录将近200个Widget的用法和介绍',
      'http://laomengit.com/',
      'Flutter',
    ),

  ];

  //标签
  List<String> get tagList {
    List<String> tags = [];
    for (final entity in courseList) {
      if (!tags.contains(entity.tag)) {
        tags.add(entity.tag);
      }
    }
    return tags;
  }

  //根据标签获取对应的课程
  List<CourseEntity> getEntityByTag(String tag) =>
      courseList.where((s) => s.tag == tag).toList();

//查看教程
  void onWatch(CourseEntity entity) {
    window.open(entity.link, entity.title);
  }

  String defaultItemRenderer(Object value) => value?.toString();
  bool removable = false;

}
