---
title: 用AngularDart写一个博客网站
date: 2020/02/19 16:15:42
tag:
 - AngularDart
image: images/angular_blog.png
---

## 1. 先图为敬
![](images/angular_blog.png)

## 2.访问地址：https://rhyme95-d3405.web.app/
页面使用的`firebase`进行托管，如果访问过程发现比较卡顿，FQ可食用流畅模式

## 3.介绍&解惑
关于`AngularDart`个人是从今年春节开始学习`AngularDart`,以下对于学习`AngularDart`的个人观点
- 1.为什么是`AngularDart`呢，`vue`、`ReactNative`等的前端框架技术不香吗？

    作为`Dart`技术栈，觉得很用必要学习一番`AngularDart`，这样代码逻辑不管是`Flutter`、`AngularDart`、`Dart`服务端都可以共用，这样不是更香？

- 2.`AngularDart`的生态环境有了吗？

    至于生态环境，目前国内资源比较缺乏，如果大家都能学习和食用`AngularDart`，那么资源和生态只是迟早的问题

- 3.为什么不使用`Flutter web`?

    `Flutter web`目前使用的话还算过早，很多兼容性和稳定性都不足，并且以`Flutter`开发的模式，前端转型到`Flutter web`可以说还比较困难，而`AngularDart`目前是使用`html+css+dart`的开发模式，避免了使用`JavaScript`这一种不严谨的语言，而`Dart`是一种强类型语言，并且面向对象，如果后续维护，可以看到使用`Dart`作为脚本语言的优势会越来越突出
- 4. `AngularDart`这个项目还继续维护吗？我看最后提交代码在4个月之前
    
    目前的话，`AngularDart`并不是停止更新，而是对于`Flutter web`需求量增多，部分开发团队转移到该项目中维护了，如果`AngularDart`使用者也同样增多，相信会引起`AngularDart`团队的关注，并且`AngularDart`版本号已经迭代到`^6.0.0`，相信经过这么长时间的迭代，不会轻易放弃该项目的，并且`AngularDart`是一个强大的框架

- 5.学习`AngularDart`有哪些资源？

    学习`AngularDart`我们可以到[`AngularDart官网`](https://angulardart.dev/)查看，官网的内容虽然对于最新版本还比较旧，但还是能学习到`hero小demo`、如何显示数据、响应用户输入，路由、http请求等，相对来说还是比较齐全，如果在官网上面发现部分内容过期，而又不知道解决时，我们可以到[stackoverflow](http://stackoverflow.com/)查找，实在不行，可以加入到`Dart客栈Q群:129380453`，如果想了解更多关于`AngularDart`开发相关知识，可以在微信中查找`Dart客栈`订阅号，后续将会推出更多的教程，期待您的关注

- 6.学习`AngularDart`容易吗？

    对于前端，可以绑定`html+css`，对于Dart语法，其中有很多关于`JavaScript`的身影，学习起来是比较容易的，百度一查，有很多关于Dart的基本语法，基本上2-3天就可以熟悉大致的语法，如果你骨骼精奇，一天就能学习完

    对于移动端，就需要学习`html+css`，而`Dart`本身是面向对象语言，基本上了解以下大概即可，如果你不想学习`html+css`，那么网上有很多模版，我们直接可以直接引用，我经常去的网站是 [模版之家](http://www.cssmoban.com/)里面大部分模版免费下载，各种网站一键弄好

## 4.最后
目前博客部分代码尚未稳定，暂时不做开源，如果小伙伴对该篇文章点赞数量比较多，就会加紧时间完善，并构建好`dart-cli`，对代码开源，后续我会出一系列教程，分享给大家！