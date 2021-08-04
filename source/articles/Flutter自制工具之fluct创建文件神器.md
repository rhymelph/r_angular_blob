---
title: Flutter自制工具之fluct助力Flutter快速开发神器
date: 2020/02/29 08:40:44
tag:
 - Dart
image: images/fluct.png
---


![](images/fluct.png)
## fluct
<a href="https://pub.dartlang.org/packages/fluct"><img src="https://img.shields.io/pub/v/fluct.svg" /></a>

一个帮助开发Flutter应用程序的工具
<br>.----------------------------------------------
<br>| <span style='margin-left:20px'>github地址:</span>
<br>| <span style='margin-left:20px'>https://github.com/rhymelph/fluct</span>
<br>| <span style='margin-left:20px'>pub地址：</span>
<br>| <span style='margin-left:20px'>https://pub.dev/packages/fluct</span>
<br>`----------------------------------------------

## 安装
该工具无需添加到依赖项中，我们只需要[激活](https://dart.dev/tools/pub/cmd/pub-global)即可,使用如下命令：
```
$ pub global activate fluct
# 或者
$ flutter pub global activate fluct
```

## 使用
`fluct` 目前只有两个命令`create`和`gen-assets`
- `create`用于创建文件及`widget`,文件名按`Dart`文件命名规则指定的单词与单词之间添加下划线，并无需指定`.dart`后缀，例如:`index_page`
- `gen-assets` 用于自动生成Flutter的资源文件绑定
### `fluct create`
在`Flutter`开发过程中，我们创建文件是必须的，而AS自带的创建文件，并没有自动的生成相关的内容，这会让开发者非常的苦恼，类名还需要自己手动敲的话，而该命令，直接可以一步到位。

当运行此命令后，命令行会输出以下内容
```
Help Flutter application create a new file

Usage: fluct create [arguments] <path>
-h, --help            Print this usage information.
-t, --type            
          [custom]    Create a new file about custom widget in 'fluct.yaml'
                      创建自定义widget的文件，-a 为 指定你在‘fluct.yaml’文件声明的指令
          [stful]     Create a new file about StatefulWidget
                      创建StatefulWidget文件
          [stless]    Create a new file about StatelessWidget
                      创建StatelessWidget文件

-a, --arg             create a new file about your custom widget use arg in 'fluct.yaml'
                      使用你在'fluct.yaml'声明的指令

Run "fluct help" to see global options.
```
可以看到，该命令输出的内容是简单易懂的，我们来简单使用一下吧。

#### 简单使用
创建`IndexPage`页面，继承自`StatefulWidget`,可以使用如下命令:
```
$ fluct create -t stful ./index_page
Create a new file about StatefulWidget
create class IndexPage
create success
exit 0
```
运行成功之后，我们会在项目下找到`index_page.dart`文件，内容为:
```dart
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```
当然，你也可以指定哪个文件夹，例如，我要在./lib/src/page 文件夹下创建`IndexPage`，使用如下命令
```
$ fluct create -t stful ./lib/src/page/index_page
```
#### 自定义内容的文件
在开始之前，我们需要在项目根目录下新建一个`fluct.yaml`文件,因为`fluct create -t custom`命令会找到它，内容如下：
```yaml
inh: |
  import 'package:flutter/material.dart';

  class $NAME$ extends InheritedWidget {
    const $NAME$({
      Key key,
      @required Widget child,
    })  : assert(child != null),
          super(key: key, child: child);

    static $NAME$ of(BuildContext context) {
      return context.dependOnInheritedWidgetOfExactType(aspect: $NAME$) as $NAME$;
    }

    @override
    bool updateShouldNotify($NAME$ old) {
      return false;
    }
  }
```
这里，我声明了`inh`命令，然后运行这个命令之后会在生成文件的时候添加`inh`对应的内容，内容中我们值得注意的是`$NAME$`占位符，该字符串会被替换成根据文件名生成的内容，例如：`index_page` 会插入`IndexPage`到`$NAME$`占位符中，最后，我们运行以下命令:
```
$ fluct create -t custom -a inh ./index_inherited
```
运行成功之后，我们能够在根目录下找到`index_inherited.dart`文件，内容也是对应的自定义内容
```dart
import 'package:flutter/material.dart';

class IndexInherited extends InheritedWidget {
  const IndexInherited({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static IndexInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: IndexInherited) as IndexInherited;
  }

  @override
  bool updateShouldNotify(IndexInherited old) {
    return false;
  }
}
```
### <span style="color:#f00">(NEW)<span>`fluct gen-assets`
我们在使用资源文件时，需要在`pubspec.yaml`文件声明资源文件的路径
<br>
例如：我在`./assets/images`文件夹下添加`a.png`图片，需要在`pubspec.yaml`文件下声明
```yaml
flutter:
  assets:
    - assets/images/a.png
```
或者使用文件夹路径
```yaml
flutter:
  assets:
    - assets/images/
```
这一步如果文件多起来，很容易出现混乱，导致声明麻烦，引用麻烦，并随着项目的迭代，资源文件有些不用了，也不知道哪个是哪个，这个时候，`fluct gen-assets`命令帮到你

当运行`fluct gen-assets -h`会输出以下内容
```
Auto generate assets to dart file

Usage: fluct gen-assets [arguments] <path>
-h, --help      Print this usage information.
-a, --assets    your asset directory path -- default ./assets
                你的资源文件夹路径，默认为当前目录下的`assets`文件夹
-o, --output    your output directory path -- default ./lib/generated
                你要输出的`a.dart`文件的路径
Run "fluct help" to see global options.
```
到此，你已经拥有了自动资源绑定的功能了，输入`fluct gen-assets`即可

![](https://user-gold-cdn.xitu.io/2020/2/29/1709033384d3d9bc?w=1016&h=558&f=png&s=57552)
你可以看到，输出的内容也是非常的友好！然后我们来看以下`a.dart`文件
```dart

// fluct gen-assets command generated.
// author:  rhyme_lph
// github:  https://github.com/rhymelph
// version: 1.0.3
class A {
  static final String  assetsVillageMyMsg = 'assets/village/my_msg.png';
  static final String  assetsVillageVRepair = 'assets/village/v_repair.png';
  static final String  assetsVillageVPropertyFee = 'assets/village/v_property_fee.png';
  static final String  assetsVillageVVoting = 'assets/village/v_voting.png';
  static final String  assetsVillageIcCompany = 'assets/village/ic_company.png';
  static final String  assetsVillageIcRightArrow = 'assets/village/ic_right_arrow.png';
  static final String  assetsVillageVComplain = 'assets/village/v_complain.png';
  static final String  assetsVillageIcLaw = 'assets/village/ic_law.png';
  static final String  assetsVillageIcSearch = 'assets/village/ic_search.png';
  static final String  assetsVillageIvFamilyNorepair = 'assets/village/iv_family_norepair.png';
  static final String  assetsVillageIcUploadPic = 'assets/village/ic_upload_pic.png';
  static final String  assetsVillageIvFamilyNocomplaint = 'assets/village/iv_family_nocomplaint.png';
  static final String  assetsVillageIvFamilyNoad = 'assets/village/iv_family_noad.png';
  static final String  assetsVillageIcGovernment = 'assets/village/ic_government.png';
  static final String  assetsVillageVHouse = 'assets/village/v_house.png';

  static final String  assetsPayPayTypeWx = 'assets/pay/pay_type_wx.png';
  static final String  assetsPayPayTypeAbc = 'assets/pay/pay_type_abc.jpg';
  static final String  assetsPayPayTypeAli = 'assets/pay/pay_type_ali.png';

  static final String  assetsMessageArticle4 = 'assets/message/article_4.jpg';
  static final String  assetsMessageArticle1 = 'assets/message/article_1.jpg';
  static final String  assetsMessageArticle3 = 'assets/message/article_3.jpg';
  static final String  assetsMessageArticle2 = 'assets/message/article_2.jpg';
  static final String  assetsMessageMReturn = 'assets/message/m_return.png';

  static final String  assetsMineDefaultAvatar = 'assets/mine/default_avatar.png';
  static final String  assetsMineMyMsg = 'assets/mine/my_msg.png';
  static final String  assetsMineHwpushIcToolbarRefresh = 'assets/mine/hwpush_ic_toolbar_refresh.png';
  static final String  assetsMineArrowRight = 'assets/mine/arrow_right.png';
  static final String  assetsMineWhiteRight = 'assets/mine/white_right.png';
  static final String  assetsMineIvCardEmblem = 'assets/mine/iv_card_emblem.png';
  static final String  assetsMineHomeCenterNormal = 'assets/mine/home_center_normal.png';
  static final String  assetsMineUserCenterNormal = 'assets/mine/user_center_normal.png';
  static final String  assetsMineVideoCamera = 'assets/mine/video_camera.png';
  static final String  assetsMineShare = 'assets/mine/share.png';
  static final String  assetsMineIconCamera = 'assets/mine/icon_camera.png';
  static final String  assetsMineIvCardFace = 'assets/mine/iv_card_face.png';
  static final String  assetsMineMySetting = 'assets/mine/my_setting.png';
  static final String  assetsMineUmiIdentity = 'assets/mine/umi_identity.png';
  static final String  assetsMineUmiModfiyPwd = 'assets/mine/umi_modfiy_pwd.png';
  static final String  assetsMineMyBill = 'assets/mine/my_bill.png';

  static final String  assetsLoginIcClose = 'assets/login/ic_close.png';
  static final String  assetsLoginIcLauncher = 'assets/login/ic_launcher.png';
  static final String  assetsLoginIcLoginBg = 'assets/login/ic_login_bg.png';
  static final String  assetsLoginIcEyesClose = 'assets/login/ic_eyes_close.png';
  static final String  assetsLoginIcEyesOpen = 'assets/login/ic_eyes_open.png';
}
```
所有的内容都声明好了，`very good ~`

## Flutter中运行命令
有小伙伴可能会疑惑，`fluct create`运行之后会发现未找到命令，可能你使用了`flutter pub global activate fluct`命令激活，这个时候，我们可以使用`flutter pub run fluct create`运行


> 最后，希望大家喜欢这个工具，并关注我，了解更多关于`Flutter/Dart开发`