--- 
title: Flutter自制插件之r_upgrade应用升级下载
date: 2020/02/08 10:10:10
tag:
 - Flutter
image: images/r_upgrade.png
---
![](images/r_upgrade.png)

## 介绍
在移动开发过程中，应用升级是必不可少的一个环节，所以，[r_upgrade](https://github.com/rhymelph/r_upgrade)应用升级插件就出现了，这里先鼓掌欢迎👏👏，下面是使用介绍
## r_upgrade
![版本号](https://img.shields.io/pub/v/r_upgrade.svg)

Android和IOS的升级应用插件==Flutter应用升级插件

## 开始吧
- 使用插件:

在`pubspec.yaml`文件添加下面代码
```yaml
dependencies:
  r_upgrade: last version
```
- 添加升级监听
```dart
RUpgrade.stream.listen((info){
  ///...
});
```
info 里面包含的信息如下:

`total` 应用总大小,bytes值

`status` 应用的下载状态：

    `STATUS_PAUSED`下载被暂停
    
    `STATUS_PENDING`等待下载
    
    `STATUS_RUNNING`下载中
    
    `STATUS_SUCCESSFUL`下载成功
    
    `STATUS_FAILED`下载失败
    
`progress` 已下载的大小bytes值

`planTime` 计划下载完成所需时间/秒

`address` 下载到本地的地址路径

`percent` 下载进度 范围`0-100`

`id` 当前下载任务的id

`speed` 当前下载速度kb/s

-  立即升级你的应用
```dart
    void upgrade() async {
      int id = await RUpgrade.upgrade(
                 'https://raw.githubusercontent.com/rhymelph/r_upgrade/master/apk/app-release.apk',
                 apkName: 'app-release.apk');
    }
```
- 你可以使用升级返回的`id`进行取消下载
```dart
    void cancel() async {
      bool isSuccess=await RUpgrade.cancel(id);
    }
```
- 你可以使用升级返回的`id`进行安装
```dart
    void install() async {
      bool isSuccess=await RUpgrade.install(id);
    }
```
- 如果你的应用为IOS，使用此方法跳转到appStore进行下载更新
```dart
    void iosUpgrade(String url)async{
      RUpgrade.appStore(url);
    }
```

> 注意，在Android应用中，请确保`AndroidManifest.xml`中声明以下权限，并在6.0系统上进行动态授权，不然会调用升级方法将抛出权限异常

```xml
    <uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
```

## 未来计划
- Android平台添加热更新
- 添加暂停，继续功能
- 未想好。。。（欢迎评论）