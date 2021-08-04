


import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';
import 'package:r_angular_blob/src/common/http_service.dart';
import 'package:r_angular_blob/src/entity/article_entity.dart';
import 'package:r_angular_blob/src/router/router_paths.dart';
import 'package:r_angular_blob/src/router/routes.dart';

@Component(
  selector: 'tag-tag',
  templateUrl: '../../component/articles/articles_component.html',
  styleUrls: [
    '../../component/articles/articles_component.css'
  ],
  providers: [
    ClassProvider(HttpService),
  ],
  directives: [
    NgFor,
    routerDirectives,
    MaterialIconComponent,
    MaterialExpansionPanel,
  ],
)
class TagPageComponent implements OnInit, OnActivate {
  HttpService _httpService;

  bool isMobel = false;

  final NgZone _ngZone;
  final Router _router;

  TagPageComponent(this._httpService, this._ngZone,this._router);

  List<ArticleEntity> articles = [];

  @override
  void ngOnInit(){
    handleResize();
    window.onResize.listen((_) {
      _ngZone.runGuarded(handleResize);
    });
  }

  String navigateTo(ArticleEntity entity) {
    return Routes.articleDetailPage.toUrl({fileName: entity.url});
  }

  void handleResize() {
    if (window.screen.width < 725) {
      isMobel = true;
    } else {
      isMobel = false;
    }
  }

  String currentTag;

  @override
  void onActivate(RouterState previous, RouterState current) async {
    try {
      currentTag = current.parameters[tagName];
      articles = await _httpService.getArticles(currentTag);
    } catch (e) {
      articles = [];
    }
  }

}
