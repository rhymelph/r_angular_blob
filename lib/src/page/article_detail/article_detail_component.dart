
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'package:r_angular_blob/src/common/http_service.dart';
import 'package:r_angular_blob/src/common/my_safe_html_directive.dart';
import 'package:r_angular_blob/src/entity/article_entity.dart';
import 'package:r_angular_blob/src/router/router_paths.dart';
@Component(
  selector: 'article-detail',
  templateUrl: 'article_detail_component.html',
  directives: [
    MySafeInnerHtmlDirective,
    MaterialIconComponent,
    NgIf,
    MaterialSpinnerComponent,
  ],
  providers: [
    ClassProvider(HttpService),
  ],
  styleUrls: [
    'article_detail_component.css',
  ],
)
class ArticleDetailComponent implements OnActivate,OnInit{
  final HttpService _service;
  final NgZone _ngZone;
  bool isMobel = false;
  ArticleEntity articleEntity;

  ArticleDetailComponent(this._service,this._ngZone);

  String path;
  String contentValue;

  @override
  void onActivate(RouterState previous, RouterState current) async{
    path= current.parameters[fileName];
    articleEntity =await _service.getArticleByUrl(path,path.substring(0,path.indexOf('/')));
    contentValue =await _service.get(path);
  }

  @override
  void ngOnInit() {
    handleResize();
        window.onResize.listen((_) {
      _ngZone.runGuarded(handleResize);
    });
  }

    void handleResize() {
    if(window.screen.width <750){
       isMobel = true;
    }else {
       isMobel = false;
    }
  }
}