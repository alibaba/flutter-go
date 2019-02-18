/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/1
/// Time: 下午4:11
/// email: zhu.yan@alibaba-inc.com
/// target: SliverAppBar 的示例

import 'package:flutter/material.dart';

/*
* 默认 SliverAppBar 的实例
* */
class SliverAppBarFullDefault extends StatefulWidget {
  const SliverAppBarFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _SliverAppBarFullDefault();
}

/*
* SliverAppBar 默认的实例,有状态
* */
class _SliverAppBarFullDefault extends State {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // ...  // 如果没有,就是不需要有状态的 StatefulWidget
    );
  }
}

/*
* SliverAppBar 默认的实例,无状态
* */
class SliverAppBarLessDefault extends StatelessWidget {
//  final widget;
//  final parent;
//  const SliverAppBarLessDefault([this.widget, this.parent])
//      : super();

  final List<ListItem> listData = [];
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 20; i++) {
      listData.add( ListItem("我是测试标题$i", Icons.cake));
    }
    return  SizedBox(
        height: 500.0,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                //leading, // 在标题前面显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮
                //title, // Toolbar 中主要内容，通常显示为当前界面的标题文字
                //actions, // 一个 Widget 列表，代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单
                //flexibleSpace,
                //bottom,         //底部内容区域
                //elevation, //阴影,纸墨设计中控件的 z 坐标顺序，默认值为 4，对于可滚动的 SliverAppBar，当 SliverAppBar 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值
                //flexibleSpace：一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
                //backgroundColor,  // 背景色,APP bar 的颜色，默认值为 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
                //brightness,   // 主题明亮,App bar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
                //iconTheme,  // 图标主题,App bar 上图标的颜色、透明度、和尺寸信息。默认值为 ThemeData.primaryIconTheme
                //textTheme,    //文字主题, App bar 上的文字样式。默认值为 ThemeData.primaryTextTheme
                //centerTitle,     //标题是否居中, 标题是否居中显示，默认值根据不同的操作系统，显示方式不一样
                primary: true,  //是否预留高度
                forceElevated:false,
                automaticallyImplyLeading:true,
                titleSpacing: NavigationToolbar.kMiddleSpacing,
                snap:false,   //与floating结合使用
                expandedHeight: 200.0,//展开高度
                floating: false,//是否随着滑动隐藏标题
                pinned: true,//是否固定在顶部
                flexibleSpace: FlexibleSpaceBar( //可以展开区域，通常是一个FlexibleSpaceBar
                    centerTitle: true,
                    title: Text("我是一个帅气的标题",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      //"http://h.hiphotos.baidu.com/image/pic/item/342ac65c103853434cc02dda9f13b07eca80883a.jpg",
                      "http://b.zol-img.com.cn/desk/bizhi/image/6/960x600/1432800027589.jpg",
                      //"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg",
                      fit: BoxFit.fill,
                    )),
              ),
  //            SliverPersistentHeader(
  //                delegate: _SliverAppBarDelegate(
  //                  TabBar(
  //                    controller:  TabController(length: 2, vsync: this),
  //                    labelColor: Colors.black87,
  //                    unselectedLabelColor: Colors.grey,
  //                    tabs: [
  //                      Tab(icon: Icon(Icons.security), text: "security"),
  //                      Tab(icon: Icon(Icons.cake), text: "cake"),
  //                    ],
  //                  ),
  //                ))
            ];
        },
      body: Center(
        child:  ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return  ListItemWidget(listData[index]);
          },
          itemCount: listData.length,
        ),
      ),
    ));
  }
}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child:  ListTile(
        leading:  Icon(listItem.iconData),
        title:  Text(listItem.title),
      ),
      onTap: () {},
    );
  }
}

