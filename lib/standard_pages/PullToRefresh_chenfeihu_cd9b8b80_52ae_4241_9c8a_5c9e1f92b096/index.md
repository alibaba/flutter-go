# PullToRefresh

> 下拉刷新 上拉加载

PullToRefresh 是一个刷新列表组件，借助于pull_to_refresh库实现，感觉这是目前最好的一款三方刷新库，它的可定制性比较好，刷新样式多样化，已经满足大部分的开发需求。

### **基本用法**

*  添加依赖 pull_to_refresh: ^1.5.6
*  ListView包裹一层SmartRefresher 



### **SmartRefresher常用属性说明**

* **enablePullDown**   允许下拉刷新
* **enablePullUp**   允许上拉加载
* **header**   下拉刷新头部样式
* **footer**   上拉加载底部样式
* **onRefresh**   下拉刷新的回调
* **onLoading**   上拉加载的回调
* **controller**  刷新控件的控制器，用来处理回调状态等


### **国际化显示**
 
 ```
 需要添加语言本地化SDK，不然刷新库头部与底部显示加载提示内容为英文
 
 添加依赖  flutter_localizations:
               sdk: flutter
                                        
 main.dart中MateriaApp里面添加以下内容
 
 localizationsDelegates: [
           // 这行是关键
           RefreshLocalizations.delegate,
           GlobalWidgetsLocalizations.delegate,
           GlobalMaterialLocalizations.delegate
         ],
         supportedLocales: [
           const Locale('en'),
           const Locale('zh'),
         ],
         localeResolutionCallback:
             (Locale locale, Iterable<Locale> supportedLocales) {
           //print("change language");
           return locale;
         },
 
 ```
 
 
### **全局配置**
 全局配置RefreshConfiguration,配置子树下的所有SmartRefresher表现,一般存放于MaterialApp的根部
 
 ```
 RefreshConfiguration(
          headerBuilder: () => WaterDropHeader(),        // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
          footerBuilder:  () => ClassicFooter(),        // 配置默认底部指示器
          headerTriggerDistance: 80.0,        // 头部触发刷新的越界距离
          springDescription:SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // 自定义回弹动画,三个属性值意义请查询flutter api
          maxOverScrollExtent :100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
          maxUnderScrollExtent:0, // 底部最大可以拖动的范围
          enableScrollWhenRefreshCompleted: true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
          enableLoadingWhenFailed : true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
          hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
          enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
         child: MaterialApp(
             ........
         )
     );

 ```
 
 
### 实例展示
  
[demo:5553db80_52ae_4241_9c8a_5c9e1f92b096]
 

  