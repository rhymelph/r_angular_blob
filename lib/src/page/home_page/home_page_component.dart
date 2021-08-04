


import 'dart:html';

import 'package:angular/angular.dart';
import 'package:r_angular_blob/src/component/articles/articles_component.dart';
import 'package:r_angular_blob/src/component/banners/banners_component.dart';

@Component(
  selector: 'home-page',
  templateUrl: 'home_page_component.html',
  directives: [
    BannersComponent,
    ArticlesComponent,
    NgIf,
  ],
  styleUrls: [
    'home_page_component.css'
  ]
)
class HomePageComponent implements OnInit{

  final NgZone _ngZone;

  bool isHideBanner = false;


  HomePageComponent(this._ngZone);

  @override
  void ngOnInit() {
    handleResize();
        window.onResize.listen((_) {
      _ngZone.runGuarded(handleResize);
    });
  }

    void handleResize() {
    if(window.screen.width <1005){
       isHideBanner = true;
    }else {
       isHideBanner = false;
    }
  }
}