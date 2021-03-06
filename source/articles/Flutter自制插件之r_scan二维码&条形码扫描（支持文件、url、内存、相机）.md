--- 
title: Flutter自制插件之r_scan二维码&条形码扫描（支持文件、url、内存、相机）
date: 2019/12/08 10:10:10
tag:
 - Flutter
image: images/r_scan.png
---

![](images/r_scan.png)

# 介绍
二维码作为信息的载体，广泛应用于我们生活的方方面面，例如：使用支付宝支付，二维码加好友，二维码推广等等，能举例的例子多不胜数，而如果你的应用支持二维码的扫描，用户和体验将会翻倍的增长，如果你是应用的开发者，欢迎来使用此二维码扫描插件！并希望能给予项目一个star，谢谢！项目地址：https://github.com/rhymelph/r_scan

## 使用
你可以在pub.dev网站上面搜索`r_scan`即可找到该插件，添加下面代码到`pubspec.yaml`文件
```yaml
dependencies:
    r_scan: last version
```
- last version 可以在pub.dev网站搜索`r_scan`得到

## 各设备注意事项
- Android平台下

android6.0系统以上请动态授权，可以结合`permission_handler`插件使用，代码如下：
```dart
import 'package:permission_handler/permission_handler.dart';

Future<bool> canReadStorage() async {
    if(Platform.isIOS) return true;
    var status = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (status != PermissionStatus.granted) {
      var future = await PermissionHandler()
          .requestPermissions([PermissionGroup.storage]);
      for (final item in future.entries) {
        if (item.value != PermissionStatus.granted) {
          return false;
        }
      }
    } else {
      return true;
    }
    return true;
  }

Future<bool> canOpenCamera() async {
    var status =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (status != PermissionStatus.granted) {
      var future = await PermissionHandler()
          .requestPermissions([PermissionGroup.camera]);
      for (final item in future.entries) {
        if (item.value != PermissionStatus.granted) {
          return false;
        }
      }
    } else {
      return true;
    }
    return true;
  }
```
- IOS平台下

需要在`info.plist`文件下添加如下代码：
```dart
    <key>NSCameraUsageDescription</key>
	<string>扫描二维码时需要使用您的相机</string>
	<key>NSPhotoLibraryUsageDescription</key>
	<string>扫描二维码时需要访问您的相册</string>
	<key>io.flutter.embedded_views_preview</key>
    <true/>
```

## 导包
```dart
import 'package:r_scan/r_scan.dart';
```

## 1.扫描文件图片二维码
```dart
final result=await RScan.scanImagePath('你的文件路径');
if(result.isNotEmpty){
    //result 为二维码内容
}
```
## 2.扫描图片链接二维码
```dart
final result=await RScan.scanImagePath('你的图片链接');
if(result.isNotEmpty){
    //result 为二维码内容
}
```
## 3.扫描内存图片二维码
```dart
ByteData data=await rootBundle.load('images/qrCode.png');
final result=await RScan.scanImageMemory(data.buffer.asUint8List());
if(result.isNotEmpty){
    //result 为二维码内容
}
```
## 4.使用相机扫描二维码/条形码
```dart
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:r_scan/r_scan.dart';

class RScanDialog extends StatefulWidget {
  @override
  _RScanDialogState createState() => _RScanDialogState();
}

class _RScanDialogState extends State<RScanDialog> {
  RScanController _controller;

  @override
  void initState() {
    super.initState();
    initController();
  }
  bool isFirst=true;


  Future<void> initController() async {
    _controller = RScanController();
    _controller.addListener(() {//监听扫描到的二维码
      final result = _controller.result;
      if (result != null) {
        if(isFirst){
          Navigator.of(context).pop(result);
          isFirst=false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder<bool>(
          future: canOpenCameraView(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return ScanImageView(//这个为自己写的前景
                child: RScanView(
                  controller: _controller,
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Future<bool> canOpenCameraView() async {
    var status =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (status != PermissionStatus.granted) {
      var future = await PermissionHandler()
          .requestPermissions([PermissionGroup.camera]);
      for (final item in future.entries) {
        if (item.value != PermissionStatus.granted) {
          return false;
        }
      }
    } else {
      return true;
    }
    return true;
  }
}
```
5. 打开闪光灯/获取闪光灯状态

使用`RScanController`类的实例直接调用
```dart
//关闭闪光灯
await _controller.setFlashMode(false);

//打开闪光灯
await _controller.setFlashMode(true);

// 获取闪光灯状态
bool isOpen = await _controller.getFlashMode();
```

6.RScanResult(二维码扫描结果)
当扫描到二维码&条形码将返回该对象，包含如下内容
```dart
class RScanResult {
  /// 条形码类型
  final RScanBarType type;

  ///附带的信息
  final String message;

  ///条形码对应的区域 包含 [x , y] 坐标
  final List<RScanPoint> points;
}
```
## 后续开发

1. 支持自定义区域触发扫描
2. 还有更多...