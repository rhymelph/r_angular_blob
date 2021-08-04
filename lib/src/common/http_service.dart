


import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';
import 'package:r_angular_blob/src/entity/article_entity.dart';

@Injectable()
class HttpService{
  final Client _client;

  HttpService(this._client);

  Future<List<ArticleEntity>> getArticles([String tag])async{
    List<dynamic>  decodeJson=json.decode(await get('articles/all.json'));
    final articles =decodeJson.map((m)=>ArticleEntity.fromJson(m)).toList();
    return tag!=null?articles.where((s)=>s.tag.split(',').contains(tag)).toList():articles;
  }
  Future<ArticleEntity> getArticleByUrl(String url,String path)async{
    List<dynamic>  decodeJson=json.decode(await get('$path/all.json'));
    final articles =decodeJson.map((m)=>ArticleEntity.fromJson(m)).toList();
    return articles.firstWhere((a)=>a.url == url);
  }

  Future<List<ArticleEntity>> getBanners()async{
    List<dynamic>  decodeJson=json.decode(await get('banners/all.json'));
    final articles =decodeJson.map((m)=>ArticleEntity.fromJson(m)).toList();
    return articles;
  }

  Future<List<String>> getTags()async{
    List<dynamic> decodeJson = await json.decode(await get('articles/tags.json'));
    return decodeJson.map((s)=>s as String).toList();
  }
  Future<int> getGithubStars()async{
    // stargazers_count
    var count=0;

    List<dynamic>  decodeJson=json.decode(await get('https://api.github.com/users/rhymelph/repos'));
    for(final dy in decodeJson){
      try{
      count +=dy['stargazers_count'];
      }catch(e){

      }
    }
    return count;
  }
  Future<String> get(String path)async{
    final response = await _client.get(path);
    return utf8.decode(response.bodyBytes);
  }
}