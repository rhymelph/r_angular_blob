---
title: Flutter自制插件之r_album图片或视频保存到相册
date: 2020/02/22 14:32:07
tag:
 - Flutter
image: images/r_album.png
---

![](images/r_album.png)

## r_album
<a href="https://pub.dartlang.org/packages/r_album"><img src="https://img.shields.io/pub/v/r_album.svg" /></a>

Flutter 图片或者视频保存到相册插件，支持Android和IOS.
<br>.----------------------------------------------
<br>| <span style='margin-left:20px'>github地址:</span>
<br>| <span style='margin-left:20px'>https://github.com/rhymelph/r_album</span>
<br>| <span style='margin-left:20px'>pub地址：</span>
<br>| <span style='margin-left:20px'>https://pub.dev/packages/r_album</span>
<br>`----------------------------------------------

## 如何使用

- 1.在`./pubspec.yaml`文件下添加插件

```dart
dependencies:
  r_album: lastVersion

```

- 2.导入包

```dart
import 'package:r_album/r_album.dart';
```

- 3.创建专辑

```dart
await RAlbum.createAlbum("你的专辑名字");
```

- 4.将图片或视频添加到专辑中（添加后即可在系统相册中找到）

```dart
await RAlbum.saveAlbum("你的专辑名",["文件路径1","文件路径2",...]);
```

## end

- 欢迎关注微信订阅号：`Dart客栈`

- 交流群：29380453