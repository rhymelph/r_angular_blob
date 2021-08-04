import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';

import 'src/entity/drawer_entity.dart';
import 'src/entity/link_entity.dart';
import 'src/router/router_paths.dart';
import 'src/router/routes.dart';

// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components
// icon https://material.io/resources/icons/?style=baseline
@Component(
  selector: 'my-app',
  styleUrls: [
    'app_component.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'app_component.html',
  directives: [
    NgFor,
    NgIf,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialTemporaryDrawerComponent,
    MaterialListComponent,
    MaterialListItemComponent,
    MaterialSelectItemComponent,
    MaterialChipComponent,
    routerDirectives,
  ],
  exports: [RouterPaths, Routes],
)
class AppComponent implements OnInit, AfterViewInit, OnDestroy {
  bool customWidth = false;
  bool end = false;
  bool removable = false;
  bool isTempoary = false;

  final Router _router;

  final NgZone _ngZone;

  AppComponent(this._router, this._ngZone);

  SelectionModel<DrawerEntity> drawerSelection;
  StreamSubscription<RouterState> _routeChanged;

  String title = 'Rhyme的博客';

  String avatar =
      'https://upload.jianshu.io/users/upload_avatars/12805100/167c0cd2-e801-4232-ad70-fe829e8e8267?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240';

  List<String> chips = [
    'Dart布道师',
    'Flutter开发工程师',
    'Android开发工程师',
  ];

//右侧抽屉按钮
  List<DrawerEntity> drawerItems = [
    DrawerEntity(title: '主页', icon: 'home', router: RouterPaths.homePage),
    // DrawerEntity(
    //     title: '视频', icon: 'ondemand_video', router: RouterPaths.videoPage),
    DrawerEntity(
        title: '归档', icon: 'local_library', router: RouterPaths.filePage),
    DrawerEntity(title: '关于', icon: 'info', router: RouterPaths.aboutPage),
    DrawerEntity(
        title: 'Dart相关资源', icon: 'inbox', router: RouterPaths.coursePage),
  ];

//bar按钮
  List<LinkEntity> links = [
    // LinkEntity('简书', 'https://www.jianshu.com/u/0c89c7e04e7a'),
    LinkEntity('Github', 'https://github.com/rhymelph')
  ];

  String defaultItemRenderer(Object value) => value?.toString();

  @override
  void ngOnInit() {
    drawerSelection = SelectionModel<DrawerEntity>.radio(drawerItems.first);
    handleResize();
    window.onResize.listen((_) {
      _ngZone.runGuarded(handleResize);
    });
  }

  void toggleItem(DrawerEntity entity) {
    if (drawerSelection.selectedValues.first == entity) {
      return;
    }
    drawerSelection.select(entity);
    _router.navigate(entity.router.toUrl());
  }

  @override
  void ngOnDestroy() {
    _routeChanged.cancel();
  }

  void handleResize() {
    if (window.screen.width < 1265) {
      isTempoary = true;
    } else {
      isTempoary = false;
    }
  }

  @override
  void ngAfterViewInit() {
    _routeChanged = _router.stream.listen(_update);
    _update(_router.current);
  }

  void _update(RouterState routerState) {
    if (routerState != null) {
      try {
        final entity = drawerItems
            .firstWhere((s) => s.router.toUrl() == routerState.toUrl());
        drawerSelection.select(entity);
      } catch (e) {
        drawerSelection.select(null);
      }
    }
  }
}
