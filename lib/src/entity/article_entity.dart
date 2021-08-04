import 'dart:convert';

class ArticleEntity{
  final String title;
  final String image;
  final String url;
  final String date;
  final String tag;
  final String introduce;
  final bool hot;
  ArticleEntity({this.tag,this.title, this.image, this.url,this.date,this.introduce,this.hot});


  factory ArticleEntity.fromJson(Map json){
    return ArticleEntity(
      title:json['title'],
      image:json['image'],
      url:json['url'],
      date:json['createTime'],
      tag: json['tag'],
      introduce: json['introduce'],
      hot: json['hot'],
    );
  }
  
  Map toJson(){
    return {
      'title':title,
      'image':image,
      'url':url,
      'createTime':date,
      'tag':tag,
      'introduce':introduce,
      'hot':hot,
    };
  }
}