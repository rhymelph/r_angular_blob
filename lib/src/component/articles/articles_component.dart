import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'package:r_angular_blob/src/common/http_service.dart';
import 'package:r_angular_blob/src/entity/article_entity.dart';
import 'package:r_angular_blob/src/router/router_paths.dart';
import 'package:r_angular_blob/src/router/routes.dart';

@Component(
  selector: 'articles',
  templateUrl: 'articles_component.html',
  styleUrls: [
    'articles_component.css',
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
class ArticlesComponent implements OnInit {
  final HttpService _httpService;

  bool isMobel = false;

  final NgZone _ngZone;
  final Router _router;

  ArticlesComponent(this._httpService, this._ngZone,this._router);

  List<ArticleEntity> articles = [];

  @override
  void ngOnInit() async{
    articles = await _httpService.getArticles();
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
}
