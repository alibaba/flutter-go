/*
 * @Author: 一凨 
 * @Date: 2018-11-16 15:09:12 
 * @Last Modified by:   一凨 
 * @Last Modified time: 2018-11-16 15:09:12 
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './assetImage_demo.dart';

const contentText0 = '''
### **简介**
> 从AssetBundle中获取图像，根据上下文来确定使用确切的图像

根据给定的一些资源，AssetImage 可以根据你给定的配置，然后根据设备的像素比率和大小，然后选择合适的资源文件
''';

const contentText1 = '''
### **基本用法**
> 从AssetBundle中获取图像，根据上下文来确定使用确切的图像

#### 使用命名资源文件去匹配不同像素的设备

以'Nx'的形式命名图片资源文件，其中N标识改资源文件的标称设备像素比率

假如某一个应用程序使用命名为 heart.png 的图标，此图标的表示为1.0（主图标），以及 1.5和2.0像素比。然后我们在资源包中应如下命名：

  ```
  heart.png
  1.5x/heart.png
  2.0x/heart.png
  ```
在具有1.0设备像素比的设备上，所选择的图片是 heart.png ，在具有1.3设备的像素比的设备上，所选择图片是 1.5x/heart.png.
只要变量命名处于同一个目录层级，资源文件的目录层级就无关紧要。如下也是有效的目录结构。

```
  icons/heart.png
  icons/1.5x/heart.png
  icons/2.0x/heart.png
```

#### 获取资源文件
需要从package中获取资源文件，需要提供package的参数。我们需要在项目中的 pubspec.yaml 文件里加上具体的asset文件：

```
flutter:
  assets:
    - icons/heart/.png
```
然后可以如下使用
```
AssetImage('icons/heart.png');
```
#### 在package中的资源
如果需要从package中获取资源文件，必须提供package参数。加入下面的结构位于一个名为 my_icons 的包中，然后获取图像：
```
AssetImage('icons/heart.png', package: 'my_icons')
```
如果在package的pubspec.yaml中指定了所需资源，则会自动将其与应用程序捆绑在一起。 特别是，package本身使用的资产必须在pubspec.yaml中指定。

package 还可以选择在其'lib /'文件夹中具有未在其pubspec.yaml中指定的资源。 在这种情况下，对于要捆绑的图像，应用程序必须指定要包含的图像。 例如，名为fancy_backgrounds的包可能具有
```
lib/backgrounds/background1.png
lib/backgrounds/background2.png
lib/backgrounds/background3.png
```
比如说第一张图片，应用程序的pubspec.yaml应该在资源部分指定它：
```
assets:
   - packages/fancy_backgrounds/backgrounds/background1.png
```
lib /是隐含的，因此它不应包含在 assets 路径中。


> 一下demo分别作为背景图片和配合Image使用
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Image/AssetImage';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        contentText0,
        contentText1,
        AssetImageDemo(),
      ],
      title: 'AssetImage',
      docUrl: 'https://docs.flutter.io/flutter/painting/AssetImage-class.html',
      codeUrl: 'elements/Media/Image/AssetImage/assetImage_demo.dart',
    );
  }
}
