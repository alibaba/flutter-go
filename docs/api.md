## widget库
### 扑组件框架

使用方法：进口 package:flutter/widgets.dart

### 类

#### AbsorbPointer
> 在命中测试期间吸收指针的widget。[...]

#### align
一个widget，用于将其子项与其自身对齐，并根据子级的大小自行调整大小。[...]

对准
矩形内的一个点。[...]

AlignmentDirectional
偏移量，表示为“ 大小”的一部分，但其水平分量取决于书写方向。[...]

AlignmentGeometry
Alignment的 基类，允许文本方向感知分辨率。[...]

AlignmentGeometryTween
两个AlignmentGeometry之间的插值。[...]

AlignmentTween
两个对齐之间的插值。[...]

AlignTransition
Align的 动画版本，可以为其Align.alignment属性设置动画。

AlwaysScrollableScrollPhysics
滚动物理总是让用户滚动。[...]

AlwaysStoppedAnimation < T >
在给定值停止的动画[...]

Animate< T >
一个通过输入动画来生成类型为T的值的对象。[...]

AnimatedAlign
Align的 动画版本，只要给定的对齐发生变化，就会在给定的持续时间内自动转换child的位置。[...]

AnimatedBuilder
用于构建动画的通用widget。[...]

AnimatedContainer
在一段时间内逐渐更改其值的容器。[...]

AnimatedCrossFade
一个widget，它在两个给定的子节点之间交叉淡化，并在它们的大小之间设置动画。[...]

AnimatedDefaultTextStyle

DefaultTextStyle的 动画版本，无论何时给定的样式发生更改，都会在给定的持续时间内自动转换默认文本样式（文本样式以应用于没有显式样式的后代Text widget）。[...]

AnimatedList
一个滚动容器，可在插入或移除项目时为其设置动画。[...]

AnimatedListState
滚动容器的状态，在插入或移除项目时为其设置动画。[...]

AnimatedModalBarrier
一个widget，可以防止用户与自身后面的widget交互，并且可以使用动画颜色值进行配置。[...]

AnimatedOpacity
不透明度的 动画版本，只要给定的不透明度发生变化，就会自动转换child在给定持续时间内的不透明度。[...]

AnimatedPadding
Padding的 动画版本，无论何时给定的插入更改，它都会在给定的持续时间内自动转换缩进。[...]

AnimatedPhysicalModel
PhysicalModel的 动画版本。[...]

AnimatedPositioned
定位的 动画版本，可在给定位置发生变化时自动转换child在给定持续时间内的位置。[...]

AnimatedPositionedDirectional
PositionedDirectional的 动画版本，可在给定位置发生变化时自动转换child在给定持续时间内的位置。[...]

AnimatedSize
动画窗口widget，只要给定子项的大小发生更改，就会在给定的持续时间内自动转换其大小。

AnimatedSwitcher
默认情况下，窗口widget在新窗口widget和先前在AnimatedSwitcher上设置为窗口widget的窗口widget之间执行FadeTransition。[...]

AnimatedWidget
在给定的Listenable更改值时重建的窗口widget。[...]

AnimatedWidgetBaseState < T扩展了ImplicitlyAnimatedWidget >
具有隐式动画的widget的基类。[...]

Animate< T >
值为type的动画T。[...]

AnimationController
动画控制器。[...]

AnimationEagerListenerMixin
一个mixin用dispose契约替换didRegisterListener / didUnregisterListener契约。

AnimationLazyListenerMixin
mixin仅在此对象已注册侦听器时帮助侦听另一个对象。

AnimationLocalListenersMixin
一个mixin，它实现addListener / removeListener协议，并在调用notifyListeners时通知所有已注册的侦听器。

AnimationLocalStatusListenersMixin
一个mixin，它实现addStatusListener / removeStatusListener协议，并在调用notifyStatusListeners时通知所有已注册的侦听器。

AnimationMax < T extends num >
跟踪最多两个其他动画的动画。[...]

AnimationMean
双 s 的动画，跟踪其他两个动画的平均值。[...]

AnimationMin < T extends num >
跟踪最少两个其他动画的动画。[...]

AnimationWithParentMixin < T >
通过将其行为推迟到给定的父动画来 实现大多数动画界面。[...]

ASPECTRATIO
尝试将子项调整为特定宽高比的widget。[...]

AssetBundleImageKey
由AssetImage或ExactAssetImage获取的图像的键。[...]

AssetBundleImageProvider
ImageProvider的 一个子类，它知道AssetBundle。[...]

AssetImage
从AssetBundle获取图像，根据上下文确定要使用的确切图像。[...]

AsyncSnapshot < T >
与异步计算的最新交互的不可变表示。[...]

AutomaticKeepAlive
允许子树请求在惰性列表中保持活动状态。[...]

AutomaticKeepAliveClientMixin < T扩展StatefulWidget >
为AutomaticKeepAlive的客户提供方便的方法。[...]

BackdropFilter
一个widget，它将过滤器应用于现有的绘制内容，然后绘制子项。[...]

BallisticScrollActivity
基于物理模拟动画滚动视图的活动。[...]

旗帜
在另一个widget的角落上方显示对角线消息。[...]

BannerPainter
画横幅。
底线
根据child的基线定位child的widget。[...]

BeveledRectangleBorder
带有扁平或“斜角”角的矩形边框。[...]

BlockSemantics
一个窗口widget，它删除在同一个语义容器中绘制在其之前的所有窗口widget的语义。[...]

边境
盒子的边框，由四个边组成：顶部，右侧，底部，左侧。[...]

BorderDirectional
盒子的边框，由四个边组成，其侧面基于读取方向翻转。[...]

BorderRadius
矩形每个角的一组不可变半径。[...]

BorderRadiusDirectional
矩形的每个角的一组不可变半径，但是角的指定方式取决于书写方向。[...]

BorderRadiusGeometry
BorderRadius的 基类，允许文本方向感知解析。[...]

BorderRadiusTween
两个BorderRadius之间的插值。[...]

BorderSide
盒子边框的一面。[...]

BottomNavigationBarItem
材质的BottomNavigationBar 或带有图标和标题的iOS主题CupertinoTabBar中的交互式按钮。[...]

BouncingScrollPhysics
滚动物理环境允许滚动偏移超出内容范围，但随后将内容反弹回这些边界的边缘。[...]

BouncingScrollSimulation
与iOS匹配的滚动物理实现。[...]

BoxBorder
框边框的基类，可以绘制为矩形，圆形或圆角矩形。[...]

BoxConstraints
不可变的布局约束RenderBox布局。[...]

BoxConstraintsTween
两个BoxConstraints之间的插值。[...]

BoxDecoration
关于如何绘制框的不可变描述。[...]

BoxPainter
一个有状态的类，可以绘制一个特定的装饰。[...]

BoxScrollView
一个滚动型采用单个子布局的模型。[...]

BoxShadow
由盒子投下的阴影。[...]

BuildContext
窗口widget树中窗口widget位置的句柄。[...]

生成器
一个柏拉图窗口widget，它调用闭包来获取其子窗口widget。[...]

BuildOwner
窗口widget框架的管理器类。[...]

帆布
用于记录图形操作的界面。[...]

中央
一个小孩，它将child置于其中心。[...]

ChangeNotifier
可以扩展或混合的类，使用VoidCallback为通知提供更改通知API 。[...]

CheckedModeBanner
在已检查模式下运行时 显示标有“DEBUG” 的横幅。 MaterialApp默认构建其中一个。在发布模式下无效。

CircleBorder
适合可用空间内圆圈的边框。[...]

ClampingScrollPhysics
滚动物理场以防止滚动偏移超出内容边界的环境。[...]

ClampingScrollSimulation
与Android匹配的滚动物理实现。[...]

ClipOval
使用椭圆剪辑其子项的widget。[...]

ClipPath
使用路径剪辑其子项的窗口widget。[...]

ClipRect
使用矩形剪辑其子项的widget。[...]

ClipRRect
使用圆角矩形剪辑其子项的窗口widget。[...]

颜色
ARGB格式的不可变32位颜色值。[...]

ColorFilter
描述在绘制形状或使用特定Paint合成图层时应用的滤镜。滤色器是一种采用两种颜色并输出一种颜色的功能。在合成期间应用时，在整个图层与目标合并之前，它将独立应用于正在绘制的图层的每个像素。[...]

ColorSwatch < T >
一种颜色，有一个相关颜色的小表称为“样本”。[...]

ColorTween
两种颜色之间的插值。[...]

柱
在垂直方向排列布局子控件的控件[...]

ComponentElement
一个元素是组成其他要素秒。[...]

CompositedTransformFollower
一个遵循CompositedTransformTarget的widget。[...]

CompositedTransformTarget
CompositedTransformFollower 可以定位的widget。[...]

CompoundAnimation < T >
用于组合多个动画的界面。子类只需要实现valuegetter来控制子动画的组合方式。可以链接组合2个以上的动画。[...]

ConstrainedBox
一个widget，对其子级施加其他约束。[...]

容器
一个结合了常用的绘图组件，定位组件和尺寸组件的便捷组件。[...]

立方体
单位区间的三次多项式映射。[...]

曲线
单位间隔到单位间隔的映射。[...]

CurvedAnimation
将曲线应用于另一个动画的动画。[...]

曲线
常见动画曲线的集合。[...]

CurveTween
通过给定曲线转换给定动画的值。[...]

CustomClipper < T >
用于提供自定义剪辑的界面。[...]

CustomMultiChildLayout
一个widget，它使用委托来调整和定位多个子节点。[...]

CustomPaint的
一个widget，提供在绘制阶段绘制的画布。[...]

CustomPainter
所用的接口CustomPaint的（在部件库）和 RenderCustomPaint（在绘制库）。[...]

CustomPainterSemantics
包含描述由CustomPaint使用的Canvas包含的矩形中绘制的信息的属性。[...]

CustomScrollView
一个滚动型创建使用棉条自定义滚动效果。[...]

CustomSingleChildLayout
一个widget，将其单个子级的布局推迟到委托。[...]

DecoratedBox
在儿童绘画之前或之后 绘制装饰的widget。[...]

DecoratedBoxTransition
动画版的DecoratedBox是其动画的不同属性装饰。[...]

装饰
盒子装饰（应用于Rect的装饰）的描述。[...]

DecorationImage
箱子装饰的图象。[...]

DecorationImagePainter
装饰图像 的画家。[...]

DecorationTween
两个装饰之间的插值。[...]

DefaultAssetBundle
一个widget，用于确定其后代的默认资产包。[...]

DefaultTextStyle
要应用于后代Text widget而没有显式样式的文本样式。

DefaultWidgetsLocalizations
widget库的美国英语本地化版本。[...]

方向性
用于确定文本和文本方向敏感渲染对象的环境方向性的窗口widget。[...]

可取消
可以通过在指示的方向上拖动来解除的widget。[...]

DragDownDetails
使用GestureDragDownCallback的回调的详细信息对象。[...]

DragEndDetails
使用GestureDragEndCallback的回调的详细信息对象。[...]

可拖动< T >
可以拖动到DragTarget的窗口widget。[...]

DragScrollActivity
滚动视图在用户在屏幕上拖动手指时执行的活动。[...]

DragStartDetails
使用GestureDragStartCallback的回调的详细信息对象。[...]

DragTarget < T >
删除Draggable widget 时接收数据的widget。[...]

DragUpdateDetails
使用GestureDragUpdateCallback的回调的详细信息对象。[...]

DrivenScrollActivity
基于动画参数设置动画滚动视图的活动。[...]

EdgeInsets
四个基本方向中每个方向的一组不可变的偏移量。[...]

EdgeInsetsDirectional
四个基本方向中的每个方向上的不可变的偏移集，但其水平分量取决于书写方向。[...]

EdgeInsetsGeometry
EdgeInsets的 基类，允许文本方向感知分辨率。[...]

EdgeInsetsGeometryTween
两个EdgeInsetsGeometry之间的插值。[...]

EdgeInsetsTween
两个EdgeInsets之间的插值。[...]

EditableText
基本文本输入字段。[...]

EditableTextState
声明EditableText的状态。

ElasticInCurve
振荡曲线，在超出其范围的同时增大幅度。[...]

ElasticInOutCurve
一条振荡曲线，在超出其范围时会增大然后收缩。[...]

ElasticOutCurve
一条振荡曲线，在超出其范围时会缩小幅度。[...]

元件
树中特定位置 的Widget实例化。[...]

ErrorWidget
呈现异常消息的widget。[...]

ExactAssetImage
从AssetBundle获取图像，将其与给定比例相关联。[...]

ExcludeSemantics
删除其后代的所有语义的widget。[...]

扩展
一个使Row，Column或Flex的子控件扩展尺寸的控件。[...]

FadeInImage
在加载目标图像时显示占位符图像的图像，然后在加载时淡入新图像。[...]

FadeTransition
动画widget的不透明度。[...]

FileImage
将给定的File对象解码为图像，将其与给定的比例相关联。[...]

FittedBox
秤，并根据自身内部定位其子契合。[...]

FittedSizes
applyBoxFit 返回的这对大小。

FixedColumnWidth
将列的大小调整为特定数量的像素。[...]

FixedExtentMetrics
ScrollPosition到具有固定项目大小的滚动视图的 度量标准。[...]

FixedExtentScrollController
用于滚动视图的控制器，其项目具有相同的大小。[...]

FixedExtentScrollPhysics
一种捕捉物理，它总是直接落在物品上而不是滚动范围内的任何地方。[...]

FixedScrollMetrics
与Scrollable视口关联的值的不可变快照。[...]

柔性
在一维数组中显示其子项的窗口widget。[...]

FlexColumnWidth
在布置了所有其他列之后，通过占用剩余空间的一部分来确定列的大小。[...]

灵活
控制行，列或Flex的子项如何弯曲的widget。[...]

FlippedCurve
曲线是其给定曲线的反转。[...]

流
根据FlowDelegate中的逻辑，可以有效地调整和定位子项的widget。[...]

FlowDelegate
一个控制流布局外观的委托。[...]

FlowPaintingContext
FlowDelegate绘制的 上下文。[...]

FlutterErrorDetails
提供给FlutterExceptionHandler回调的信息的类。[...]

FlutterLogoDecoration
关于如何绘制Flutter徽标的不可变描述。
的FocusManager
管理焦点树。[...]

FocusNode
焦点树中可以接收焦点的叶节点。[...]

FocusScope
建立一个widget可以获得焦点的范围。[...]

FocusScopeNode
焦点树中的内部节点。[...]

fontWeight设置
用于绘制文本的字形的粗细
形成
用于将多个表单字段widget（例如TextField widget）分组在一起的可选容器。[...]

FormField < T >
单个表单字段。[...]

FormFieldState < T >
FormField 的当前状态。传递给FormFieldBuilder方法，用于构造表单字段的widget。

FormState
与窗口widget关联的状态。[...]

FractionallySizedBox
一个widget，可将其子级调整为总可用空间的一小部分。有关布局算法的更多详细信息，请参阅 RenderFractionallySizedOverflowBox。[...]

FractionalOffset
偏移量，表示为大小的一部分。[...]

FractionalOffsetTween
两个小数偏移之间的插值。[...]

FractionalTranslation
在绘制其子项之前应用转换转换。[...]

FractionColumnWidth
将列的大小调整为表的约束'maxWidth的一小部分。[...]

FutureBuilder < T >
基于与Future交互的最新快照构建自己的widget。[...]

GestureDetector
检测手势的widget。[...]

GestureRecognizerFactory < T扩展了GestureRecognizer >
用于创建手势识别器的工厂。[...]

GestureRecognizerFactoryWithHandlers < T扩展了GestureRecognizer >
工厂用于创建委托给回调的手势识别器。[...]

GlobalKey < Ť延伸国< StatefulWidget > >
整个应用程序中唯一的密钥。[...]

GlobalObjectKey < Ť延伸国< StatefulWidget > >
一个全局键，从用作其值的对象获取其标识。[...]

GlowingOverscrollIndicator
滚动视图已过度滚动的可视指示。[...]

梯度
2D渐变。[...]

GridPaper
一个widget，用于绘制一个像素宽的直线网格。[...]

网格视图
可滚动的2Dwidget数组。[...]

英雄
一个widget，标记其子级为英雄动画的候选者。[...]

HeroController
一个导航观察者管理英雄的转变。[...]

HoldScrollActivity
滚动活动，除了可以释放以恢复正常的空闲行为之外什么也不做。[...]

HSVColor
使用alpha，hue，饱和度和值表示的颜色。[...]

图标
图形图标插件与来自于所述的字体的字形绘制IconData如材料的预定IconData以s 图标。[...]

IconData
字体标志符号表示的图标说明。[...]

IconTheme
控制窗口widget子树中图标的默认颜色，不透明度和大小。[...]

IconThemeData
定义图标的颜色，不透明度和大小。[...]

IdleScrollActivity
滚动活动，什么都不做。[...]

IgnorePointer
在命中测试期间不可见的widget。[...]

图片
显示图像的widget。[...]

ImageCache
类为imageCache对象。[...]

ImageConfiguration
传递给ImageProvider.resolve方法的配置信息，用于选择特定图像。[...]

的ImageIcon
来自ImageProvider的图标，例如AssetImage。[...]

的imageinfo
一个dart：ui.Image对象及其对应的比例。[...]

ImageProvider < T >
识别图像而不提交精确的最终资产。这允许识别一组图像，并且稍后基于环境（例如，设备像素比）来解析精确图像。[...]

ImageShader
用于平铺图像的着色器（由Paint.shader使用）。

的ImageStream
图像资源的句柄。[...]

ImageStreamCompleter
用于管理dart加载的基类：用于ImageStream的ui.Image对象 。[...]

ImplicitlyAnimatedWidget
用于构建窗口widget的抽象窗口widget，可在一段时间内逐渐更改其值。[...]

IndexedStack
一个堆栈，显示来自子项列表的单个子项。[...]

InheritedElement
使用InheritedWidget作为其配置 的Element。

InheritedWidget
widget的基类，可以有效地在树中传播信息。[...]

InspectorSelection
检查员的可变选择状态。
间隔
曲线直到开始为0.0 ，然后弯曲（根据曲线从0.0到1.0 结束，然后是1.0。[...]

IntrinsicColumnWidth
根据该列中所有单元格的固有尺寸确定列的大小。[...]

IntrinsicHeight
一个widget，可以将其子级调整为子级的内在高度。[...]

IntrinsicWidth
一个widget，可以将其子级调整为子级的内部宽度。[...]

IntTween
两个整数之间的插值。[...]

活着
标记一个child需要保持活着，即使它在一个懒惰的列表中，否则将删除它。[...]

KeepAliveHandle
甲收听其可以手动触发。[...]

KeepAliveNotification
指示此通知气泡必须保持活动的子树，即使它通常会作为优化被丢弃。[...]

键
Key是Widget，Element和SemanticsNode的标识符[...]

KeyedSubtree
构建其子项的widget。[...]

LabeledGlobalKey < Ť延伸国< StatefulWidget > >
带调试标签的全局密钥。[...]

LayerLink
LeaderLayer可以注册 的对象。[...]

LayoutBuilder
构建可依赖于父窗口widget大小的窗口widget树。[...]

LayoutChangedNotification
指示接收此通知的对象的其中一个后代的布局已经以某种方式更改，因此关于该布局的任何假设都不再有效。[...]

LayoutId
用于标识CustomMultiChildLayout中的子项的元数据。[...]

LeafRenderObjectElement
使用LeafRenderObjectWidget作为其配置 的Element。

LeafRenderObjectWidget
RenderObjectWidgets的超类，用于配置没有子项的RenderObject子类。

LimitedBox
只有当它不受约束时才限制其大小的盒子。[...]

的LinearGradient
2D线性渐变。[...]

ListBody
一个widget，它沿着给定的轴顺序排列它的子节点，强制它们到另一个轴的父节点的维度。[...]

可听
维护侦听器列表的对象。

倾听者
一个widget，它响应指针事件调用回调。[...]

列表显示
可线性排列的widget可滚动列表。[...]

ListWheelScrollView
一个盒子，可以滚动轮子上的child。[...]

ListWheelViewport
显示轮子上的子集子集的视口。[...]

语言环境
用于选择用户语言和格式首选项的标识符，由语言和国家/地区组成。这是BCP 47定义的区域设置标识符的子集。[...]

LocalHistoryEntry

LocalHistoryRoute 历史记录中的条目。

LocalHistoryRoute < T >
可以通过弹出列表在内部处理返回导航的路由。[...]

本地化
为其 定义区域设置child以及子项所依赖的本地化资源。[...]

LocalizationsDelegate < T >
用于一组本地化资源类型的工厂，T由Localizationswidget加载 。[...]

LocalKey
不是GlobalKey的关键[...]

LongPressDraggable < T >
从长按开始使其child可以拖拽。

MaskFilter
一个蒙版过滤器，用于在绘制时应用于形状。掩码过滤器是一种采用彩色像素位图的函数，并返回另一个彩色像素位图。[...]

Matrix4
4D矩阵。值以列主要顺序存储。

Matrix4Tween
两个Matrix4之间的插值。[...]

MatrixUtils
用于处理矩阵的实用程序函数。

MaxColumnWidth
确定列的大小，使其大小为两个列宽规范的最大值。[...]

MediaQuery
建立媒体查询解析给定数据的子树。[...]

MediaQueryData
有关介质的信息（例如，窗口）。[...]

MemoryImage
将给定的Uint8List缓冲区解码为图像，将其与给定的比例相关联。[...]

MergeSemantics
一个widget，它合并其后代的语义。[...]

元数据
在渲染树中保存不透明的元数据。[...]

MinColumnWidth
确定列的大小，使其大小为两个列宽规范中的最小值。[...]

ModalBarrier
一个widget，阻止用户与自身后面的widget交互。[...]

ModalRoute < T >
阻止与先前路由交互的路由。[...]

MultiChildLayoutDelegate
一个控制多个子项布局的委托。[...]

MultiChildRenderObjectElement
使用MultiChildRenderObjectWidget作为其配置 的Element。[...]

MultiChildRenderObjectWidget

RenderObjectWidgets的超类，用于配置具有单个子项列表的RenderObject子类。（此超类仅为该子列表提供存储，它实际上不提供更新逻辑。）

MultiFrameImageStreamCompleter
管理图像帧的解码和调度。[...]

NavigationToolbar
NavigationToolbar是一个布局助手，用于沿水平轴定位3个widget或widget组，这对于应用程序的导航栏是合理的，例如在Material Design和iOS中。[...]

航海家
一个widget，用于管理具有堆栈规则的一组子widget。[...]

NavigatorObserver
用于观察导航器行为的界面。

NavigatorState
Navigator widget 的状态。

NestedScrollView
其中的滚动视图可以嵌套其他滚动视图，其滚动位置本质上是链接的。[...]

NestedScrollViewViewport
NestedScrollView使用 的Viewport变体。[...]

NetworkImage
从网络获取给定的URL，将其与给定的比例相关联。[...]

NeverScrollableScrollPhysics
滚动物理，不允许用户滚动。[...]

通知
可以冒泡widget树的通知。[...]
NotificationListener < T extends Notification >
一个widget，用于侦听通知冒泡树。[...]
ObjectKey
从用作其值的对象获取其标识的键。[...]
抵消
不可变的2D浮点偏移量。[...]
台下
一个widget，它将child放在树中，但没有绘制任何东西，没有让child可用于命中测试，也没有占用父母的任何空间。[...]

OneFrameImageStreamCompleter
管理dart：ui.Image对象的加载，用于静态ImageStream（只有一帧）。

不透明度
使子项部分透明的widget。[...]

OrientationBuilder
构建可依赖于父窗口widget方向的窗口widget树（与设备方向不同）。[...]

OverflowBox
一个widget，它对子进程施加的约束不同于从其父进程获得的约束，可能允许子进程溢出父进程。[...]

覆盖
一个堆栈条目可以独立进行管理。[...]

OverlayEntry
在一个地方叠加，可以包含一个widget。[...]

OverlayRoute < T >
在导航器的叠加层中显示窗口widget的路径。

OverlayState
Overlay 的当前状态。[...]

OverscrollIndicatorNotification
GlowingOverscrollIndicator将开始显示过度滚动指示的 通知。[...]

OverscrollNotification
通知Scrollable widget未更改其滚动位置，因为更改会导致其滚动位置超出其滚动边界。[...]

填充
一个widget，通过给定的填充来保护其子级。[...]

的PageController
PageView 的控制器。[...]

PageMetrics
PageView的 度量标准。[...]

PageRoute < T >
替换整个屏幕的模态路线。

PageRouteBuilder < T >
用于根据回调定义一次性页面路由的实用程序类。[...]

PageScrollPhysics
滚动由使用物理浏览量。[...]

PageStorage
为此窗口widget子树建立页面存储桶的窗口widget。

PageStorageBucket
与应用中的页面关联的存储桶。[...]

PageStorageKey < T >
一个ValueKey用于定义PageStorage值将被保存。[...]

页面预览
可逐页工作的可滚动列表。[...]

涂料
在画布上绘制时使用的样式的说明。[...]

PaintingBinding
绑定绘画库。[...]

PaintingContext
一个画画的地方。[...]

ParentDataElement < T扩展RenderObjectWidget >
使用ParentDataWidget作为其配置 的Element。

ParentDataWidget < T扩展RenderObjectWidget >
将ParentData信息挂接到RenderObjectWidget的子 节点的widget的基类。[...]

路径
平面的复杂一维子集。[...]

PerformanceOverlay
显示性能统计信息 [...]

PhysicalModel
表示将其子项剪辑为形状的物理层的窗口widget。[...]

PhysicalShape
一个widget，表示将其子级剪辑为路径的物理层。[...]

占位符
一个widget，用于绘制一个框，表示有一天会添加其他widget的位置。[...]

PointerCancelEvent
指针的输入不再指向此接收器。

PointerDownEvent
指针已与设备联系。

PointerEvent
触摸，手写笔或鼠标事件的基类。[...]

PointerMoveEvent
当指针与设备接触时，指针相对于设备移动。[...]

PointerUpEvent
指针已停止与设备联系。

PopupRoute < T >
在当前路线上覆盖窗口widget的模态路径。

定位
一个控件，用于控制堆栈子项的位置。[...]

PositionedDirectional
一个widget，用于控制堆栈子项的位置，而不需要提交特定的TextDirection。[...]

PositionedTransition
定位的 动画版本，它采用特定的 动画在动画的生命周期内将child的位置从起始位置转换到结束位置。[...]

PREFERREDSIZE
具有首选大小的widget。[...]

PreferredSizeWidget
窗口widget的接口，如果不受约束，则可以返回此窗口widget所希望的大小。[...]

PrimaryScrollController
将ScrollController与子树关联。[...]

ProxyAnimation
作为另一个动画的代理的动画。[...]

ProxyElement
使用ProxyWidget作为其配置 的Element。

ProxyWidget
提供了子窗口widget的窗口widget，而不是构建新窗口widget。[...]

的RadialGradient
2D径向渐变。[...]

半径
圆形或椭圆形的半径。

RawGestureDetector
一个widget，用于检测给定手势工厂描述的手势。[...]

RawGestureDetectorState
国家对RawGestureDetector。

RawImage
一个直接显示dart：ui.Image的widget。[...]

RawKeyboardListener
每当用户按下或释放键盘上的键时调用回调的widget。[...]

RawKeyEvent
原始密钥事件的基类。[...]

矩形
一个不可变的，2D，轴对齐的浮点矩形，其坐标相对于给定的原点。[...]

RectTween
两个矩形之间的插值。[...]

RelativePositionedTransition
Positioned的 动画版本，它根据相对于具有指定大小的边界框的rect值转换子项的位置。[...]

RelativeRect
一个不可变的2D，轴对齐的浮点矩形，其坐标相对于另一个矩形的边缘给出，称为容器。由于矩形的尺寸是相对于容器的尺寸，因此该类没有宽度和高度成员。为了确定矩形的宽度或高度，将其转换为一个矩形使用toRect（） （通过容器本身的矩形），然后检查该对象。[...]

RelativeRectTween
两个相对rects之间的插值。[...]

RenderBox
2D笛卡尔坐标系中的渲染对象。[...]

RenderNestedScrollViewViewport
NestedScrollView使用 的RenderViewport变体。[...]

渲染对象
渲染树中的对象。[...]

RenderObjectElement
使用RenderObjectWidget作为其配置 的Element。[...]

RenderObjectToWidgetAdapter < T扩展RenderObject >
从RenderObject到Element树的桥梁。[...]

RenderObjectToWidgetElement < T扩展RenderObject >
由RenderObject托管的RootRenderObjectElement。[...]

RenderObjectWidget
RenderObjectWidgets提供用于配置RenderObjectElement s，这涡卷渲染对象 s，这提供了应用程序的实际渲染。

RenderSliv​​erOverlapAbsorber
包裹另一个的条子，迫使其布局范围被视为重叠。[...]

RenderSliv​​erOverlapInjector
基于存储在SliverOverlapAbsorberHandle中的值具有条子几何形状的条子 。[...]

RepaintBoundary
一个widget，为其子级创建单独的显示列表。[...]

ReverseAnimation
与另一个动画相反的动画。[...]

ReverseTween < T >
一个Tween，反向评估其父级。

富文本
一段富文本。[...]

RootRenderObjectElement
树根处的元素。[...]

RotatedBox
一个widget，可以将其子项旋转整数个四分之一圈。[...]

RotationTransition
动画widget的旋转。

RoundedRectangleBorder
带圆角的矩形边框。[...]

路线< T >
由导航器管理的条目的抽象。[...]
RouteAware
知道其当前Route的对象的接口。[...]
RouteObserver < R extends Route >
一个导航观察者通知RouteAware变化s到他们的状态路线。[...]
RouteSettings
可能在构建路径时有用的数据。
行
使子控件横向排列显示的控件。[...]
RRect
一个不可变的圆角矩形，具有所有四个角的自定义半径。
RSTransform
由平移，旋转和均匀比例组成的变换。[...]
SafeArea
一个widget，通过足够的填充来保护其子级，以避免操作系统的入侵。[...]
锯齿
锯齿曲线，在单位间隔内重复给定次数。[...]

ScaleEndDetails
有关GestureScaleEndCallback的详细信息。

ScaleStartDetails
有关GestureScaleStartCallback的详细信息。

ScaleTransition
动画转换widget的比例。

ScaleUpdateDetails
有关GestureScaleUpdateCallback的详细信息。

滚动
滚动的widget。[...]

ScrollableState
Scrollable widget的 State对象。[...]

ScrollActivity
用于滚动活动（如拖动和投掷）的基类。[...]

ScrollActivityDelegate
ScrollActivity 的后端。[...]

ScrollbarPainter
用于绘制滚动条 的CustomPainter。[...]

ScrollBehavior
描述可滚动窗口widget的行为方式。[...]

ScrollConfiguration
控制可滚动窗口widget在子树中的行为方式。[...]

ScrollContext
Scrollable widget实现 的接口，以便使用 ScrollPosition。[...]

ScrollController
控制可滚动的widget。[...]

ScrollDragController
当用户在屏幕上拖动手指时滚动滚动视图。[...]

ScrollEndNotification
Scrollable widget已停止滚动的 通知。[...]

ScrollHoldController
用于保持Scrollable静止的接口。[...]

ScrollMetrics
Scrollable内容的 描述，用于建模视口的状态。[...]

ScrollNotification
与滚动相关 的通知。[...]

ScrollPhysics
确定Scrollable widget的物理特性。[...]

的scrollPosition
确定滚动视图中可见的内容部分。[...]

ScrollPositionWithSingleContext
滚动位置，用于管理单个ScrollContext的滚动活动 。[...]

ScrollSpringSimulation
一个SpringSimulation，其中x的值保证在模拟isDone（）时具有完全最终值。

ScrollStartNotification
Scrollable widget已开始滚动的 通知。[...]

ScrollUpdateNotification
Scrollable widget已更改其滚动位置的 通知。[...]

滚动型
滚动的widget。[...]

语义
一个widget，用widget含义的描述来注释widget树。[...]

SemanticsDebugger
一个可视化child语义的widget。[...]

着色器
Gradient和ImageShader 等对象的基类，它们对应于Paint.shader使用的着色器。

ShaderMask
一个widget，它将Shader生成的遮罩应用于其子级。[...]

ShapeBorder
形状轮廓的基类。[...]

ShapeDecoration
关于如何绘制任意形状的不可变描述。[...]

ShrinkWrappingViewport
内部较大的widget，收缩包装在主轴上的子项。[...]

模拟
所有模拟的基类。[...]

SingleChildLayoutDelegate
用于计算具有单个子项的渲染对象的布局的委托。[...]

SingleChildRenderObjectElement
使用SingleChildRenderObjectWidget作为其配置 的Element。[...]

SingleChildRenderObjectWidget
RenderObjectWidgets的超类，用于配置具有单个子槽的RenderObject子类。（此超类仅为该子级提供存储，它实际上不提供更新逻辑。）

SingleChildScrollView
可以滚动单个窗口widget的框。[...]

SingleTickerProviderStateMixin < T扩展StatefulWidget >
提供单个Ticker，配置为仅在启用当前树时打勾，如TickerMode所定义。[...]

尺寸
保持2D浮点大小。[...]

SizeChangedLayoutNotification
指示接收此通知的对象的其中一个后代的大小已更改，因此有关该布局的任何假设都不再有效。[...]

SizeChangedLayoutNotifier
一个widget， 当其子级的布局维度发生更改时自动调度SizeChangedLayoutNotification。[...]
SizedBox

具有指定大小的框。[...]

SizedOverflowBox
一个特定大小的窗口widget，但将其原始约束传递给其子节点，然后可能会溢出。[...]

SizeTransition
动画自己的大小和剪辑并对齐child。[...]

SizeTween
两种尺寸之间的插值。[...]

SlideTransition
动画widget相对于其正常位置的位置。[...]

SliverChildBuilderDelegate
使用构建器回调为子项提供子项的委托。[...]

SliverChildDelegate
为儿童提供条子的代表。[...]

SliverChildListDelegate
使用明确列表为儿童提供儿童的代表。[...]

SliverFillRemaining
包含单个框子项的条子，填充视口中的剩余空间。[...]

SliverFillViewport
包含多个子框的子条，每个子框填充视口。[...]

SliverFixedExtentList
将多个具有相同主轴范围的盒子项放置在线性阵列中的条子。[...]

SliverGrid
将多个盒子儿童放置在二维排列中的条子。[...]

SliverGridDelegate
控制网格中图块的布局。[...]

SliverGridDelegateWithFixedCrossAxisCount
创建横轴中具有固定数量的切片的网格布局。[...]

SliverGridDelegateWithMaxCrossAxisExtent
使用每个都具有最大横轴范围的切片创建网格布局。[...]

SliverList
沿着主轴将多个盒子放置在线性阵列中的条子。[...]

SliverMultiBoxAdaptorElement
一个懒惰地为SliverMultiBoxAdaptorWidget构建子元素的元素。[...]

SliverMultiBoxAdaptorWidget
条子的基类，有多个盒子元素。[...]

SliverOverlapAbsorber
包裹另一个的条子，迫使其布局范围被视为重叠。[...]

SliverOverlapAbsorberHandle
提供给SliverOverlapAbsorber，SliverOverlapInjector和NestedScrollViewViewport的句柄，用于在NestedScrollView中移位重叠。[...]

SliverOverlapInjector
基于存储在SliverOverlapAbsorberHandle中的值具有条子几何形状的条子 。[...]

SliverPadding
在另一条棉条的每一侧都应用衬垫的条子。[...]

SliverPersistentHeader
当条子滚动到视口的前缘时，尺寸​​变化的条子。[...]

SliverPersistentHeaderDelegate
委派配置SliverPersistentHeader。

SliverPrototypeExtentList
将盒子放置在线性阵列中并将它们限制为沿主轴具有与原型项相同程度的条子。[...]

SliverSafeArea
通过足够的填充来插入另一条条子的条子，以避免操作系统的入侵。[...]

SliverToBoxAdapter
包含单个框widget的条子。[...]
堆
一个widget，用于将其子级相对于其框的边缘定位。[...]

StadiumBorder
一个边框，适合体育场形状的边框（两端有半圆形的框），适用于它所应用的widget的矩形。[...]

State < T扩展StatefulWidget >
StatefulWidget 的逻辑和内部状态。[...]

StatefulBuilder
一个柏拉图窗口widget，它们都具有状态并调用闭包来获取其子窗口widget。[...]

StatefulElement
使用StatefulWidget作为其配置 的Element。

StatefulWidget
具有可变状态的widget。[...]

StatelessElement
使用StatelessWidget作为其配置 的Element。

StatelessWidget
一个不需要可变状态的widget。[...]

StatusTransitionWidget
在给定动画更改状态时重建的窗口widget。

StepTween
地板之间的两个整数之间的插值。[...]

StreamBuilder < T >
基于与Stream交互的最新快照构建自身的小组件。[...]

StreamBuilderBase < T，S >
基于与指定Stream的交互构建自己的widget的基类。[...]

表
为其子项使用表布局算法的窗口widget。[...]

表格边框
表格widget的 边框规范。[...]

TableCell的
一个widget，用于控制表的子节点的对齐方式。[...]

TableColumnWidth
用于描述RenderTable中列的宽度的基类。[...]

的TableRow
表 中的一组水平单元格。[...]

TapDownDetails
有关GestureTapDownCallback的详细信息，例如位置。

TapUpDetails
有关GestureTapUpCallback的详细信息，例如位置。

文本
一系列具有单一样式的文本。[...]

文本框
包含一段文本的矩形。[...]

TextDecoration
在文本附近绘制的线性装饰。

TextEditingController
用于可编辑文本字段的控制器。[...]

TextEditingValue
用于编辑文本行的当前文本，选择和撰写状态。

TextInputType
要优化文本输入控件的信息类型。[...]

TextPainter
将TextSpan树绘制到Canvas中的对象。[...]

TextPosition
文本字符串中的视觉位置。

的TextRange
一串文本中的一系列字符。

TextSelection
表示选择的一系列文本。

TextSelectionControls
用于构建选择UI的界面，由工具栏widget的实现者提供。[...]

TextSelectionDelegate
用于操作选择的界面，供工具栏widget的实现者使用。

TextSelectionOverlay
管理一对文本选择句柄的对象。[...]

TextSpan
不可变的文本范围。[...]

文字样式
一种不可变的样式，其中绘制文本。[...]

TextStyleTween
两个TextStyle之间的插值。[...]

质地
一个矩形，后端纹理映射在该矩形上。[...]

阈
曲线为0.0，直到达到阈值，然后跳到1.0。[...]

TickerFuture
表示正在进行的Ticker序列的对象。[...]

TickerMode
启用或禁用窗口widget子树中的代码（以及动画控制器）。[...]

TickerProvider
由可以销售Ticker对象的类实现的接口。[...]

TickerProviderStateMixin < T扩展StatefulWidget >
提供Ticker对象，这些对象配置为仅在启用当前树时打勾，如TickerMode所定义。[...]

标题
在操作系统中描述此应用程序的widget。

公差
指定距离，持续时间和速度差异的最大允许幅度的结构被认为是相等的。

TrackingScrollController
一个ScrollController，其initialScrollOffset跟踪其最近更新的ScrollPosition。[...]

TrainHoppingAnimation
此动画通过代理一个动画开始，但可以给出第二个动画。当他们的时间交叉时（或者因为第二个是相反的方向，或者因为一个超过另一个），动画会跳到代理第二个动画，第二个动画成为新的“第一”动画。[...]

转变
在绘制其子项之前应用转换的窗口widget。[...]

TransformProperty
处理表示变换的Matrix4的属性。

TransitionRoute < T >
具有入口和出口过渡的路线。

Tween < T扩展动态 >
开始值和结束值之间的线性插值。[...]

TypeMatcher < T >
此类是“is”运算符的解决方法，它不接受变量值作为其右操作数

UnconstrainedBox
一个widget，它对子节点没有约束，允许它以“自然”大小呈现。[...]

唯一键
一个只与自己相等的关键。

UniqueWidget < Ť延伸国< StatefulWidget > >
有状态窗口widget的基类，它在树中只有一个膨胀的实例。[...]

UserScrollNotification
用户已更改滚动方向的通知。[...]

ValueKey < T >
使用特定类型的值来标识自身的钥匙。[...]

ValueNotifier < T >
甲ChangeNotifier保存单个值。[...]

速度
二维速度。

视口
内部更大的widget。[...]

ViewportNotificationMixin
Mixin for Notification用于跟踪他们已经通过的RenderAbstractViewport的数量。[...]

窗口widget
用于描述元素的配置[...]

WidgetInspector
一个widget，可以检查子widget的结构。[...]

WidgetInspectorService
GUI工具用于与WidgetInspector交互的服务。[...]

WidgetsApp
一个便利类，它包含了应用程序通常需要的许多widget。[...]

WidgetsBinding
widget层和Flutter引擎之间的粘合剂。

WidgetsBindingObserver
使用Widgets图层绑定注册的类的接口。[...]

WidgetsFlutterBinding
基于Widgets框架的应用程序的具体绑定。这是将框架绑定到Flutter引擎的粘合剂。

WidgetsLocalizations
用于最低级别的Flutter框架的本地化资源值的接口。[...]

WidgetToRenderBoxAdapter
用于在窗口widget树中放置特定RenderBox的适配器。[...]

WillPopScope
注册回调以否决用户尝试解除封闭的 ModalRoute。[...]

包
一个widget，以多个水平或垂直运行方式显示其子项。[...]

常量
kAlwaysCompleteAnimation →const 动画< double >
一个总是完整的动画。[...]

const _AlwaysCompleteAnimation()
kAlwaysDismissedAnimation →const 动画< double >
一个总是被解雇的动画。[...]
const _AlwaysDismissedAnimation()

属性
debugHighlightDeprecatedWidgets ↔ 布尔
显示已弃用的widget的横幅。

读/写
debugPrint ↔ DebugPrintCallback
将消息打印到控制台，您可以使用“flutter”工具的“logs”命令（“flutter logs”）访问该控制台。[...]

读/写
debugPrintBuildScope ↔ 布尔
记录所有来电BuildOwner.buildScope。[...]

读/写
debugPrintGlobalKeyedWidgetLifecycle ↔ 布尔
在取消激活具有全局键的窗口widget时记录，并在重新激活（重新记录）时记录。[...]

读/写
debugPrintRebuildDirtyWidgets ↔ 布尔
记录每帧构建的脏widget。[...]

读/写
debugPrintScheduleBuildForStacks ↔ 布尔
记录将widget标记为需要重建的调用堆栈。[...]

读/写
debugProfileBuildsEnabled ↔ 布尔
Timeline为每个构建的Widget 添加事件。[...]
读/写
imageCache → ImageCache
实现Flutter框架图像缓存的单例。[...]

只读
函数
applyBoxFit（BoxFit fit， Size inputSize， Size outputSize） → FittedSizes
应用BoxFit值。[...]

axisDirectionIsReversed（AxisDirection axisDirection） → bool
返回沿给定轴方向行进是否以数字递减顺序访问沿该轴的坐标。[...]

axisDirectionToAxis（AxisDirection axisDirection） → 轴
返回包含给定AxisDirection的Axis。[...]

createLocalImageConfiguration（BuildContext context，{ Size size }） → ImageConfiguration
基于给定的BuildContext（以及可选的大小） 创建ImageConfiguration。[...]

debugAssertAllWidgetVarsUnset（String reason） → bool
如果未更改任何窗口widget库调试变量，则返回true。[...]

debugCheckHasDirectionality（BuildContext context） → bool
断言给定的上下文具有Directionality祖先。[...]

debugCheckHasMediaQuery（BuildContext context） → bool
断言给定上下文具有MediaQuery祖先。[...]

debugCheckHasTable（BuildContext context） → bool
断言给定上下文具有表祖先。[...]

debugChildrenHaveDuplicateKeys（Widget parent， Iterable < Widget > children） → bool
如果给定子列表包含任何重复的非null键，则置位。[...]

debugDescribeTransform（Matrix4 transform） → List < String >
以对TransformProperty有用的格式返回表示给定转换的字符串列表。[...]

debugDumpApp（） →void
打印当前正在运行的应用程序的字符串表示。

debugDumpLayerTree（） →void
打印整个图层树的文本表示。

debugDumpRenderTree（） →void
打印整个渲染树的文本表示。

debugItemsHaveDuplicateKeys（Iterable < Widget > items） → bool
如果给定的项列表包含任何重复的非空键，则断言。[...]

debugPrintStack（{ String label， int maxFrames }） →void
使用debugPrint和 FlutterError.defaultStackFilter将当前堆栈转储到控制台。[...]

debugWidgetBuilderValue（Widget小 部件， Widget 内置） →void
断言built widget不为空。[...]

decodeImageFromList（Uint8List list） → Future < Image >
从字节列表创建图像。[...]

defaultScrollNotificationPredicate（ScrollNotification notification） → bool
一个ScrollNotificationPredicate，它检查是否 notification.depth == 0，这意味着通知没有通过任何插入的滚动widget。
flipAxis（轴 方向） → 轴
返回给定轴的反面。[...]

flipAxisDirection（AxisDirection axisDirection） → AxisDirection
返回给定AxisDirection的反向。[...]

getAxisDirectionFromAxisReverseAndDirectionality（BuildContext context， Axis axis， bool reverse） → AxisDirection
返回当前Directionality中给定Axis中 的AxisDirection（或反之，如果为true）。[...]

reverse
hashList（Iterable < Object > arguments） → int
将Iterable中任意数量对象 的Object.hashCode值合并为一个值。如果给定null，则此函数将返回相同的值，就像给出一个空列表一样。
hashValues（Object arg01， Object arg02，[ Object arg03 = _hashEnd， Object arg04 = _hashEnd， Object arg05 = _hashEnd， Object arg06 = _hashEnd， Object arg07 = _hashEnd， Object arg08 = _hashEnd， Object arg09 = _hashEnd， Object arg10 = _hashEnd， 对象 arg11 = _hashEnd， 对象 arg12 = _hashEnd， 对象 arg13 = _hashEnd， 对象 arg14 = _hashEnd， 对象 arg15 = _hashEnd， 对象 arg16 = _hashEnd， 对象 arg17 = _hashEnd， 对象 arg18 = _hashEnd， 对象 arg19 = _hashEnd， 对象 arg20 =_hashEnd ]） → int
将最多20个对象的哈希码组合成一个值。[...]

paintBorder（Canvas canvas， Rect rect，{ BorderSide top：BorderSide.none， BorderSide right：BorderSide.none， BorderSide bottom：BorderSide.none， BorderSide left：BorderSide.none }） →void
在画布上绘制给定矩形周围的边框。[...]

paintImage（{ Canvas canvas， Rect rect， Image image， ColorFilter colorFilter， BoxFit fit， Alignment alignment：Alignment.center， Rect centerSlice， ImageRepeat repeat：ImageRepeat.noRepeat， bool flipHorizo​​ntally：false }） →void
将图像绘制到画布上的给定矩形中。[...]

paintZigZag（画布 画布， 油漆 颜料， 偏移 开始， 偏移 结束， int zigs， 双倍 宽度） →void
在两点之间画一条线，在连接两点的线上对角线前后切割。[...]

positionDependentBox（{ Size size， Size childSize， Offset target， bool preferBelow， double verticalOffset：0.0， double margin：10.0 }） → Offset
将子框放在容器框内，位于目标点的上方或下方。[...]

precacheImage（ImageProvider 提供程序， BuildContext 上下文，{ Size size }） → Future < Null >
将图像预取到图像缓存中。[...]

runApp（widget 应用程序） →无效
给给定的widget充气并将其附加到屏幕上。[...]

textDirectionToAxisDirection（TextDirection textDirection） → AxisDirection
返回在给定TextDirection中进行读取的AxisDirection。[...]

枚举
AnimationStatus

动画的状态
AppLifecycleState
申请可以进入的国家。[...]

轴
两个方面的两个基本方向。[...]

AxisDirection
沿水平轴或垂直轴的方向。

BannerLocation
在哪里展示横幅。[...]

混合模式
在画布上绘画时使用的算法。[...]

BlurStyle
用于MaskFilter对象中模糊的样式。

边框
在边框中 为BorderSide绘制的线条样式。

BoxFit
如何将盒子刻在另一个盒子里。[...]

BoxShape
渲染Border或BoxDecoration时使用的形状。[...]

ConnectionState
与异步计算的连接状态。[...]

CrossAxisAlignment
如何将儿童沿横轴放置在柔性布局中。[...]

CrossFadeState
指定要显示的两个子项中的哪一个。请参阅AnimatedCrossFade。[...]

DecorationPosition
在哪里画一个盒子装饰。

DiagnosticLevel
用于过滤显示和省略哪些诊断的各种优先级。[...]

DismissDirection
可以驳回不予受理 的方向。

DragAnchor
凡可拖动应在拖动过程中被锚定。

FadeInImagePhase
FadeInImage经历 的阶段。

FilterQuality
图像过滤器的质量级别。[...]

FLEXFIT
如何将child铭刻在可用空间内。[...]

FlutterLogoStyle
绘制Flutter徽标的可能方法。

字体样式
是否在字体中倾斜字形

GrowthDirection
相对于滚动偏移轴，条子内容的排序方向。[...]

HitTestBehavior
在命中测试期间如何表现。

ImageRepeat
如何绘制未被图像覆盖的框的任何部分。

MainAxisAlignment
如何在柔性布局中沿着主轴放置子项。[...]

MainAxisSize
主轴应占用多少空间。[...]

方向
无论是纵向还是横向。

溢出
是否应该剪掉溢出的child，或者看到他们的溢出。

PaintingStyle
在画布上绘制形状和路径的策略。[...]

PathFillType
确定决定如何计算Path内部的缠绕规则。[...]

RenderComparison
两个对象之间差异的描述，在它将如何影响渲染的上下文中。[...]

RoutePopDisposition
指示是否应弹出当前路由。[...]

SelectionChangedCause
指示触发所选文本更改的内容（包括对光标位置的更改）。

StackFit
如何调整Stack的未定位子项的大小。[...]

StrokeCap
用于行结尾的样式。[...]

StrokeJoin
用于线连接的样式。[...]

TableCellVerticalAlignment
RenderTable对象中 单元格的垂直对齐选项。[...]

上投放
用户交互应适应目标的平台。[...]

TextAffinity
是否TextPosition是视觉上的上游或其偏移的下游。[...]

textAlign设置
是否以及如何水平对齐文本。

TextBaseline
用于对齐文本的水平线。

TextDecorationStyle
绘制文本装饰的样式

TextDirection
文本流动的方向。[...]

TextOverflow
如何处理溢出的文本。

TextSelectionHandleType
要显示哪种类型的选择句柄。[...]

TILEMODE
定义渐变边缘发生的事情。[...]

VertexMode
定义在绘制一组三角形时如何解释点列表。[...]

VerticalDirection
盒子垂直流动的方向。[...]

WrapAlignment
Wrap 如何对齐对象。[...]

WrapCrossAlignment
谁包裹应该在横轴的运行中对齐儿童。

类型定义
AnimatedCrossFadeBuilder（Widget topChild， Key topChildKey， Widget bottomChild， Key bottomChildKey） → Widget
签名AnimatedCrossFade.layoutBuilder回拨。[...]

AnimatedListItemBuilder（BuildContext context， int index， Animation < double > animation） → Widget
使用的构建器回调的签名AnimatedList。

AnimatedListRemovedItemBuilder（BuildContext context， Animation < double > animation） → Widget
使用的构建器回调的签名AnimatedListState.removeItem。

AnimatedSwitcherLayoutBuilder（List < Widget > children） → Widget
用于生成自定义布局的构建器的签名 AnimatedSwitcher。[...]

AnimatedSwitcherTransitionBuilder（Widget child， Animation < double > animation） → Widget
用于生成自定义转换的构建器的签名 AnimatedSwitcher。[...]

AnimationStatusListener（AnimationStatus status） →无效
使用附加的听众签名Animation.addStatusListener。

AsyncWidgetBuilder < T > （BuildContext context， AsyncSnapshot < T > snapshot） → Widget
签名用于基于异步交互构建widget的策略。[...]

CreateRectTween（Rect begin， Rect end） → Tween < Rect >
一个函数的签名，它接受两个Rect实例并返回 RectTween它们之间的转换。[...]

DismissDirectionCallback（DismissDirection direction） →void
使用的签名Dismissible表示已在给定的情况下被解雇direction。[...]

DraggableCanceledCallback（速度 速度， 偏移 偏移） →无效
在Draggable没有被a接受的情况下丢弃a的签名DragTarget。[...]

DragTargetAccept < T > （T 数据） →无效
用于使a DragTarget接受给定数据的签名。[...]

DragTargetBuilder < T > （BuildContext context， List < T > candidateData， List rejectedData） → Widget
建立儿童的签名DragTarget。[...]

DragTargetLeave < T > （T 数据） →无效
Draggable离开 时签名DragTarget。[...]

DragTargetWillAccept < T > （T 数据） → bool
用于确定给定数据是否将被a接受的签名DragTarget。[...]

ElementVisitor（元素 元素） →无效
签名回拨给BuildContext.visitChildElements。[...]

ErrorWidgetBuilder（FlutterErrorDetails 详细信息） → Widget
构建窗口widget时发生错误时调用的构造函数的签名。[...]

FormFieldBuilder < T > （FormFieldState < T > 字段） → Widget
用于构建表示表单字段的窗口widget的签名。[...]

FormFieldSetter < T > （T newValue） →无效
签名，以便在表单字段更改值时收到通知。[...]

FormFieldValidator < T > （T 值） → 字符串
用于验证表单字段的签名。[...]

GenerateAppTitle（BuildContext context） → String
签名WidgetsApp.onGenerateTitle。[...]

GestureDragCancelCallback（） →无效
当先前触发的指针GestureDragDownCallback未完成时的签名 。[...]

GestureDragDownCallback（DragDownDetails 详细信息） →void
当指针接触屏幕并可能开始移动时的签名。[...]

GestureDragEndCallback（DragEndDetails 详细信息） →void
当先前与屏幕接触并且移动的指针不再与屏幕接触时的签名。[...]

GestureDragStartCallback（DragStartDetails 详细信息） →void
指针接触屏幕并开始移动时的签名。[...]

GestureDragUpdateCallback（DragUpdateDetails 详细信息） →void
当与屏幕接触并且移动的指针再次移动时签名。[...]

GestureLongPressCallback（） →无效
当指针长时间保持与同一位置的屏幕保持接触时的签名。

GestureRecognizerFactoryConstructor < T扩展GestureRecognizer > （） →T
签名用于实现的闭包GestureRecognizerFactory.constructor。

GestureRecognizerFactoryInitializer < T扩展GestureRecognizer > （T 实例） →无效
签名用于实现的闭包GestureRecognizerFactory.initializer。

GestureScaleEndCallback（ScaleEndDetails 详细信息） →无效
当指针不再与屏幕接触时的签名。

GestureScaleStartCallback（ScaleStartDetails 详细信息） →无效
当与屏幕接触的指针建立焦点并且初始比例为1.0时的签名。

GestureScaleUpdateCallback（ScaleUpdateDetails 详细信息） →无效
当与屏幕接触的指针指示新的焦点和/或比例时的签名。

GestureTapCallback（） →无效
发生敲击时的签名。

GestureTapCancelCallback（） →无效
当先前触发a的指针GestureTapDownCallback不会导致点击时的签名 。

GestureTapDownCallback（TapDownDetails 详细信息） →无效
当可能导致点击的指针与屏幕接触时的签名。[...]

GestureTapUpCallback（TapUpDetails 详细信息） →无效
当触发敲击的指针停止接触屏幕时的签名。[...]

ImageListener（ImageInfo image， bool synchronousCall） →void
报告图像可用的回调签名。[...]

IndexedWidgetBuilder（BuildContext context， int index） → Widget
用于为给定索引创建窗口widget的函数的签名，例如，在列表中。[...]

InspectorSelectButtonBuilder（BuildContext context， VoidCallback onPressed） → Widget
使用的构建器回调的签名 WidgetInspector.selectButtonBuilder。

InspectorSelectionChangedCallback（） →无效
用于选择的签名更改回调 WidgetInspectorService.selectionChangedCallback。

LayoutWidgetBuilder（BuildContext context， BoxConstraints constraints） → Widget

LayoutBuilder构建器函数 的签名。

LocaleResolutionCallback（Locale locale， Iterable < Locale > supportedLocales） → Locale
签名WidgetsApp.localeResolutionCallback。[...]

NestedScrollViewHeaderSliv​​ersBuilder（BuildContext context， bool innerBoxIsScrolled） → List < Widget >
NestedScrollView用于构建其标题的 签名。[...]

NotificationListenerCallback < T扩展通知 > （T 通知） → bool
Notification听众 签名。[...]

OrientationWidgetBuilder（BuildContext context， Orientation orientation） → Widget
签名用于构建给定的widget的函数Orientation。[...]

PointerCancelEventListener（PointerCancelEvent 事件） →void
用于收听PointerCancelEvent活动的签名。[...]

PointerDownEventListener（PointerDownEvent 事件） →void
用于收听PointerDownEvent活动的签名。[...]

PointerMoveEventListener（PointerMoveEvent 事件） →void
用于收听PointerMoveEvent活动的签名。[...]

PointerUpEventListener（PointerUpEvent 事件） →void
用于收听PointerUpEvent活动的签名。[...]

RouteFactory（RouteSettings 设置） → 路由
为给定的路线设置创建路线。[...]

RoutePageBuilder（BuildContext context， Animation < double > animation， Animation < double > secondaryAnimation） → Widget
用于PageRouteBuilder构建路径主要内容的函数的签名。[...]

RoutePredicate（路线 路线） → 布尔
Navigator.popUntil谓词参数的 签名。

RouteTransitionsBuilder（BuildContext context， Animation < double > animation， Animation < double > secondaryAnimation， Widget child） → Widget
用于PageRouteBuilder构建路径转换的函数的签名。[...]

ScrollNotificationPredicate（ScrollNotification 通知） → bool
谓词ScrollNotification，用于自定义侦听来自其子项的通知的widget。

SelectionChangedCallback（TextSelection selection， SelectionChangedCause cause） →void
用户更改选择（包括光标位置）时报告的回调签名。

SemanticsBuilderCallback（Size size） → List < CustomPainterSemantics >
返回的函数的签名CustomPainter.semanticsBuilder。[...]

ShaderCallback（Rect bounds） → Shader
签名为创建Shader给定的函数Rect。[...]

StatefulWidgetBuilder（BuildContext context， StateSetter setState） → Widget
使用的构建器回调的签名StatefulBuilder。[...]

StateSetter（VoidCallback fn） →无效
State.setState功能 的签名。

TextSelectionOverlayChanged（TextEditingValue value， Rect caretRect） →void
签名报告变更的筛选组件 TextEditingValue为的目的TextSelectionOverlay。该 caretRect参数给出插入符在的坐标空间中的位置RenderBox由给定的TextSelectionOverlay.renderObject。[...]

TransitionBuilder（BuildContext context， Widget child） → Widget
给child建立widget的构建器。[...]

TweenConstructor < T > （T targetValue） → Tween < T >
签名Tween工厂。[...]

TweenVisitor < T > （Tween < T > 补间， T targetValue， TweenConstructor < T > 构造函数） → Tween < T >
传递回调的签名AnimatedWidgetBaseState.forEachTween。

ValueChanged < T > （T 值） →无效
报告基础值已更改的回调签名。[...]

ValueGetter < T > （） →T
用于按需报告值的回调签名。[...]

ValueSetter < T > （T 值） →无效
用于报告已设置值的回调的签名。[...]

ViewportBuilder（BuildContext context， ViewportOffset position） → Widget
用于Scrollable构建视口的签名，通过该视口显示可滚动内容。

VoidCallback（） →无效
没有参数的回调签名并且不返回任何数据。

WidgetBuilder（BuildContext context） → Widget
用于创建窗口widget的函数的签名，例如StatelessWidget.build 或State.build。[...]

WillPopCallback（） → 未来< bool >
签名回拨，验证可以调用Navigator.pop。[...]

异常/错误

FlutterError
用于报告特定于Flutter的断言失败和合同违规的错误类。

TickerCanceled
当股票代码被取消时，TickerFuture.orCancel未来Ticker对象 抛出异常。
