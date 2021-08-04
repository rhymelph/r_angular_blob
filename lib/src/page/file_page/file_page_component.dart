import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'package:r_angular_blob/src/common/http_service.dart';
import 'package:r_angular_blob/src/entity/article_entity.dart';
import 'package:r_angular_blob/src/router/router_paths.dart';
import 'package:r_angular_blob/src/router/routes.dart';

@Component(
    selector: 'file-page',
    templateUrl: 'file_page_component.html',
    directives: [
      MaterialListComponent,
      MaterialListItemComponent,
      NgFor,
      routerDirectives,
    ],
    styleUrls: [
      'file_page_component.scss.css'
    ],
    providers: [
      ClassProvider(HttpService),
    ])
class FilePageComponent implements OnInit {
  HttpService _service;
  Router _router;
  FilePageComponent(this._service,this._router);

  List<ArticleEntity> entities;

  List<MapEntry<String, List<ArticleEntity>>> get fileMap {
    Map<String, List<ArticleEntity>> result = {};
    if (entities == null) return result.entries.toList();
    for (final entity in entities) {
      String year =entity.date.substring(0, entity.date.indexOf('/'));
      if(result.containsKey(year)){
        List<ArticleEntity> entityItem = result[year];
          entityItem.add(entity);
      }else{
        result[year]=[entity];
      }
    }
    return result.entries.toList();
  }


  @override
  void ngOnInit() async {
    entities = await _service.getArticles();

  }

  void onSelect(ArticleEntity entity){
    _router.navigateByUrl(Routes.articleDetailPage.toUrl({fileName: entity.url}));
  }
}
