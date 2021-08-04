


import 'package:angular/angular.dart';
import 'package:r_angular_blob/src/common/http_service.dart';

@Component(
  selector: 'about-page',
  templateUrl: 'about_page_component.html',
  styleUrls: [
    'about_page_component.scss.css',
    'bootstrap.css',
  ],
  providers: [
    ClassProvider(HttpService),
  ]
)
class AboutComponent implements OnInit{
  int developerDay;
  HttpService _service;

  AboutComponent(this._service);
  DateTime developerStartTime=DateTime(2017,2,26);

  List<String> flutterPlugins =[
    'r_router',
    'fluct',
    'r_calendar',
    'r_scan',
    'r_upgrade',
    'r_logger',
    'r_album',
    'nim_plugin',
  ];

  List<String> projects= [
    'Dana Pintar',
    'Kredit Online',
    '胜利东营',
    '拌拌',
    '趣跟单',
    '掌通宝宝',
    '掌通宝宝刷卡机平板',
    '掌通宝宝刷卡机手持',
    'Flutter教程',
    '知晴天气',
    'i2少儿英语秀',
  ];
  int githubStarCount;

  @override
  void ngOnInit() async{
    Duration time = DateTime.now().difference(developerStartTime);
    developerDay =time.inDays;
    githubStarCount = await _service.getGithubStars();

  }

}