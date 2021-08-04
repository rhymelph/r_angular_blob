


import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:r_angular_blob/src/common/http_service.dart';
import 'package:r_angular_blob/src/entity/article_entity.dart';
import 'package:r_angular_blob/src/router/router_paths.dart';
import 'package:r_angular_blob/src/router/routes.dart';

@Component(
  selector: 'banners',
  templateUrl: 'banners_component.html',
  styleUrls: [
    'banners_component.css'
  ],
  directives: [
    NgFor,
    routerDirectives,
    NgIf,
  ],
  providers: [
    ClassProvider(HttpService),
  ],
)
class BannersComponent implements OnInit{
  final HttpService _service;

  BannersComponent(this._service);

  List<ArticleEntity> links=[
    // LinkEntity('最新Flutter教程收集贴', ''),
    // LinkEntity('AngularDart项目收集贴', ''),
    // LinkEntity('Dart教程收集贴', ''),
  ];

  List<String> tags =[];
  @override
  void ngOnInit() {
    _service.getBanners().then((s){
      links = s;
    });
    _service.getTags().then((s){
      tags = s;
    });

  }
  String navigateTo(ArticleEntity entity){
    return Routes.articleDetailPage.toUrl({
      fileName:entity.url
    });
  }

    String navigateToTag(String tag){
    return Routes.tagPage.toUrl({
      tagName:tag
    });
  }


}