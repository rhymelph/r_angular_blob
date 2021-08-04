--- 
title: Flutter自制插件之r_calendar日历插件
date: 2020/02/08 10:10:10
tag:
 - Flutter
image: images/r_calendar.png
---

![](images/r_calendar.png)
# r_calendar
[![pub package](https://img.shields.io/pub/v/r_calendar.svg)](https://pub.dartlang.org/packages/r_calendar)

📅📆Flutter日历插件，支持自定义日历，月视图/周视图切换、点击拦截、单选（切换月自动选）、多选（散选/聚选）
<br>.----------------------------------------------
<br>| <span style='margin-left:20px'>github地址:</span>
<br>| <span style='margin-left:20px'>https://github.com/rhymelph/r_calendar</span>
<br>| <span style='margin-left:20px'>pub地址:</span>
<br>| <span style='margin-left:20px'>https://pub.dev/packages/r_calendar</span>
<br>| <span style='margin-left:20px'>apk体验：</span>
<br>| <span style='margin-left:20px'>https://fir.im/2aut</span>
<br>`----------------------------------------------

- [✔] 月视图/周视图切换
- [✔] 自定义日历
- [✔] 点击拦截
- [✔] 单选，切换月/周自动选
- [✔] 多选,散选/聚选

## 1.如何使用.

- `pubspec.yaml`文件添加依赖

```yaml
dependencies:
    r_calendar: last version
```
- 导入包

```dart
import 'package:r_calendar/r_calendar.dart';

```
- 单选控制器初始化
```dart
///
/// [selectedDate] 默认选中的那天
/// [isAutoSelect] 当月份改变时，是否自动选中对应的月份的同一天

    RCalendarController controller= RCalendarController.single(
                    selectedDate: DateTime.now(),
                    isAutoSelect: true,);
```
- 多选控制器初始化
```dart
///
/// [selectedDates] 默认选中的日期数组
/// [isDispersion] 是否散选，否则为连续选中

    RCalendarController controller = RCalendarController.multiple(
                    selectedDates: [
                        DateTime(2019, 12, 1),
                        DateTime(2019, 12, 2),
                        DateTime(2019, 12, 3),
                    ],
                    isDispersion: true);
```
- 周视图/月视图（默认月视图）
```dart
///
/// [mode] 模式
/// -   RCalendarMode.week 周视图模式
/// -   RCalendarMode.month 月视图模式

    RCalendarController controller = RCalendarController.single(
                    mode:RCalendarMode.week);
```
- 数据变化监听
```dart
/// 添加监听器观察值的变化
    RCalendarController controller = RCalendarController.multiple(...)
    ..addListener((){
    // 是否为多选
    // controller.isMultiple

    // 单选下
    // 当月份改变时，是否自动选中对应的月份的同一天
    // controller.isAutoSelect
    // 当前选中的日期
    // controller.selectedDate;

    // 多选
    // 是否散选，否则为连续选中
    // controller.isDispersion;
    // 当前选中的日期列表
    // controller.selectedDates;

    // 周视图/月视图
    // controller.mode
    });
```
- 自定义日历
```dart

class MyRCalendarCustomWidget extends RCalendarCustomWidget {
  // 如果你想设置第一天是星期一，请更改MaterialLocalizations 的firstDayOfWeekIndex
  // 日 一 二 三 四 五 六
  //构建头部
  @override
  List<Widget> buildWeekListWidget(BuildContext context,MaterialLocalizations localizations){...};

  // 1 2 3 4 5 6 7
  //构建普通的日期
  @override
  Widget buildDateTime(BuildContext context,DateTime time, List<RCalendarType> types){...};

  //   <  2019年 11月 >
  //构建年份和月份 左指示器、右指示器，返回null就没有
  @override
  Widget buildTopWidget(BuildContext context,RCalendarController controller){...};

  //是否不可用,不可用时，无点击事件
  @override
  bool isUnable(DateTime time, bool isSameMonth){...};

  //点击拦截，当返回true时进行拦截，就不会改变选中日期
  @override
  FutureOr<bool> clickInterceptor(BuildContext context,DateTime dateTime){...};

  //子view的高度
  @override
  double get childHeight=>{...};
}
```

## 2.使用它.

```dart
import 'package:flutter/material.dart';
import 'package:r_calendar/r_calendar.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  RCalendarController controller;

  @override
  void initState() {
    super.initState();
    controller = RCalendarController.multiple(selectedDates: [
      DateTime(2019, 12, 1),
      DateTime(2019, 12, 2),
      DateTime(2019, 12, 3),
    ]);
//    controller = RCalendarController.single(selectedDate: DateTime.now(),isAutoSelect: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RCalendarWidget(
               controller: controller,
               customWidget: DefaultRCalendarCustomWidget(),
               firstDate: DateTime(1970, 1, 1), //当前日历的最小日期
               lastDate: DateTime(2055, 12, 31),//当前日历的最大日期
             ),
    );
  }
}

```
## 3.自定义数据(请更新版本到 v0.1.6)
用户可以通过将数据设置到controller里面，然后再从`RCalendarCustomWidget`里获取
```dart
/// 初始化控制器，我这里是设置自定义数据的类型为List<DateTime>，当然，你可以设置成自己需要的类型
/// 在构造方法中新增了一个`initialData`参数，用于初始化你的自定义数据
    RCalendarController<List<DateTime>> controller =  RCalendarController.single(
    initialData: [
            DateTime.now(),
            DateTime.now().add(Duration(days: 1)),
            DateTime.now().add(Duration(days: 2)),
          ]
    );

/// 如果你想更改自定义数据，请使用下面的例子，无需setState
    controller.data = [....];

/// 你可以在RCalendarCustomWidget自定义类中通过context获取对应的controller.然后根据自定义数据进行显示判断

class MyRCalendarCustomWidget extends RCalendarCustomWidget {
///...
  @override
  Widget buildDateTime(
      BuildContext context, DateTime time, List<RCalendarType> types) {

    // new
    RCalendarController<List<DateTime>> controller =RCalendarMarker.of(context).notifier;
    // new

    //...
   }
///...
```
