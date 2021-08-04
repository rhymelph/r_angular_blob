---
title: Flutter黑科技一键打开资源文件
date: 2020/04/22 15:43:01
image: images/heikeji_1.png
tag:
 - Flutter
---

![](https://user-gold-cdn.xitu.io/2020/4/18/17188edf83da3508?w=1948&h=1350&f=gif&s=2328893)

## 1.简介
在Flutter开发过程中，使用资源文件是必不可少的，当项目的结构越来越复杂，引入的资源文件越来越多，大家有没有遇到这样的一个问题，如果我在代码中写了这样的一个文件路径`assets/image/xxx/xxx.png`的时候，当需要查看这个文件时，就会发现我们要一步一步的在自己的项目下找到`assets`文件夹，然后找到`image`，然后找到xxx...，这一个步骤浪费了大量的时间，并且每次查看就得浪费一次，**如果有这样的一个能根据字符串一键打开这个图片该多好啊！**，不用如果，现在就有了，只需要在Android Studio 查找插件`FlutterQuickLocateAsset`安装即可，so easy! 欢迎体验和评分！并且谢谢您的支持！

# 2.使用
- 1.打开`Android Studio` 选择`Preferences`
![](https://user-gold-cdn.xitu.io/2020/4/18/17188edf89299585?w=914&h=530&f=png&s=330373)
- 2.在弹出的对话框中找到`Plugins`
![](https://user-gold-cdn.xitu.io/2020/4/18/17188edf899c55cb?w=1240&h=1032&f=png&s=73613)
- 3.在搜索输入框中输入`Flutter`，找到`FlutterQuickLocateAsset`
![](https://user-gold-cdn.xitu.io/2020/4/18/17188edf8af47efc?w=1240&h=526&f=png&s=109416)
- 4.点击右上角`Install`即可，这边已经安装了，所以安装按钮为灰色
- 5.如果你搜索不出来？没关系，可以到[Idea Plugin](https://plugins.jetbrains.com/plugin/14134-flutterquicklocateasset)下载，什么？网站打不开？没关系，关注微信公众号:`Dart客栈`，发送`0416`获取jar下载地址
- 6.jar包形式安装，`Plugins`下找到设置样式的图标，点击后选择`Install Plugin from Disk...`，然后找到你刚刚下载完成的jar包，选中它即可
![](https://user-gold-cdn.xitu.io/2020/4/18/17188edf8d670ca0?w=1240&h=239&f=png&s=109039)
- 7.重启`Android Studio`
- 8. 找到你要打开的资源文件路径，把光标放到上面，点击右键`JumpToAsset`即可打开资源文件
![](https://user-gold-cdn.xitu.io/2020/4/18/17188edf8fd88e08?w=1134&h=484&f=png&s=122533)
- 9.设置快捷键，一键秒打开在设置面板中打开`keymap`
![](https://user-gold-cdn.xitu.io/2020/4/18/17188edfb56adf4b?w=1240&h=482&f=png&s=91216)
找到`Plug-ins - FlutterQuickLocateAsset - JumpToAsset`
![](https://user-gold-cdn.xitu.io/2020/4/18/17188edfb57be09a?w=1240&h=427&f=png&s=84781)
双击，选中`Add Keyboard Shortcut`
![](https://user-gold-cdn.xitu.io/2020/4/18/17188edfb848c44f?w=1240&h=198&f=png&s=67643)
在弹出的界面中在输入框输入你要设置的快捷键即可！
![](https://user-gold-cdn.xitu.io/2020/4/18/17188edfbad0abae?w=600&h=334&f=png&s=30659)

> 以上就是这一节的所有内容，如果小伙伴们觉得有收获，不妨点一下点个赞，给予我写作和开源的一种肯定吧！

![Dart客栈](https://user-gold-cdn.xitu.io/2020/4/18/17188edfc0066153?w=1240&h=1240&f=jpeg&s=81835)
