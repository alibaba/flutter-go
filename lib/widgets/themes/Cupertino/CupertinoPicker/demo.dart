/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/20
 * Time: 上午11:34
 * email: zhu.yan@alibaba-inc.com
 * tartget: CupertinoPageScaffold 的示例
 */

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

//import '../../gallery/demo.dart';
//import 'cupertino_navigation_demo.dart' show coolColorNames;

const double _kPickerSheetHeight = 216.0;
const double _kPickerItemHeight = 32.0;

const List<String> coolColorNames = <String>[
  'Sarcoline', 'Coquelicot', 'Smaragdine', 'Mikado', 'Glaucous', 'Wenge',
  'Fulvous', 'Xanadu', 'Falu', 'Eburnean', 'Amaranth', 'Australien',
  'Banan', 'Falu', 'Gingerline', 'Incarnadine', 'Labrador', 'Nattier',
  'Pervenche', 'Sinoper', 'Verditer', 'Watchet', 'Zaffre',
];

class CupertinoPickerDemo extends StatefulWidget {
  static const String routeName = '/cupertino/picker';

  @override
  _CupertinoPickerDemoState createState() => _CupertinoPickerDemoState();
}

class _CupertinoPickerDemoState extends State<CupertinoPickerDemo> {
  int _selectedColorIndex = 0;

  Duration timer = const Duration();

  // Value that is shown in the date picker in date mode.
  DateTime date = DateTime.now();

  // Value that is shown in the date picker in time mode.
  DateTime time = DateTime.now();

  // Value that is shown in the date picker in dateAndTime mode.
  DateTime dateTime = DateTime.now();

  Widget _buildMenu(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color:CupertinoColors.inactiveGray,
        border: const Border(
          top: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
          bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
        ),
      ),
      height: 44.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  Widget _buildColorPicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
    FixedExtentScrollController(initialItem: _selectedColorIndex);

    return GestureDetector(
      onTap: () async {
        await showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoPicker(
                  magnification:1.0, // 整体放大率
                  //offAxisFraction:10.0,// 球面效果的透视系数,消失点位置
                  scrollController: scrollController,// 用于读取和控制当前项的FixedxtentScrollController
                  itemExtent: _kPickerItemHeight,// 所以子节点 统一高度
                  backgroundColor: CupertinoColors.white,// 所有子节点下面的背景颜色
                  useMagnifier:true,// 是否使用放大效果
                  onSelectedItemChanged: (int index) { // 当正中间选项改变时的回调
                    if (mounted) {
                      setState(() => _selectedColorIndex = index);
                    }
                  },
                  children: List<Widget>.generate(coolColorNames.length, (int index) {
                return Center(child:
                Text(coolColorNames[index]),
                );
              }),
            ),
            );
          },
        );
      },
      child: _buildMenu(
        <Widget>[
          const Text('Favorite Color'),
          Text(
            coolColorNames[_selectedColorIndex],
            style: const TextStyle(
                color: CupertinoColors.inactiveGray
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownTimerPicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoTimerPicker(
                initialTimerDuration: timer,
                onTimerDurationChanged: (Duration newTimer) {
                  if (mounted) {
                    setState(() => timer = newTimer);
                  }
                },
              ),
            );
          },
        );
      },
      child: _buildMenu(
        <Widget>[
          const Text('Countdown Timer'),
          Text(
            '${timer.inHours}:'
                '${(timer.inMinutes % 60).toString().padLeft(2,'0')}:'
                '${(timer.inSeconds % 60).toString().padLeft(2,'0')}',
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: date,
                onDateTimeChanged: (DateTime newDateTime) {
                  if (mounted) {
                    setState(() => date = newDateTime);
                  }
                },
              ),
            );
          },
        );
      },
      child: _buildMenu(
          <Widget>[
            const Text('Date'),
            Text(
              DateFormat.yMMMMd().format(date),
              style: const TextStyle(color: CupertinoColors.inactiveGray),
            ),
          ]
      ),
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: time,
                onDateTimeChanged: (DateTime newDateTime) {
                  if (mounted) {
                    setState(() => time = newDateTime);
                  }
                },
              ),
            );
          },
        );
      },
      child: _buildMenu(
        <Widget>[
          const Text('Time'),
          Text(
            DateFormat.jm().format(time),
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ],
      ),
    );
  }

  Widget _buildDateAndTimePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: dateTime,
                onDateTimeChanged: (DateTime newDateTime) {
                  if (mounted) {
                    setState(() => dateTime = newDateTime);
                  }
                },
              ),
            );
          },
        );
      },
      child: _buildMenu(
        <Widget>[
          const Text('Date and Time'),
          Text(
            DateFormat.yMMMd().add_jm().format(dateTime),
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:MediaQuery.of(context).size.height,
        child:CupertinoPageScaffold(
//        navigationBar: CupertinoNavigationBar(
//          middle: const Text('Picker'),
//          previousPageTitle: 'Cupertino'
//          ),
          child: DefaultTextStyle(
          style: TextStyle(),
          child: DecoratedBox(
          decoration: BoxDecoration(
          color: CupertinoColors.inactiveGray
          ),
          child: ListView(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 32.0)),
              _buildColorPicker(context),
              _buildCountdownTimerPicker(context),
              _buildDatePicker(context),
              _buildTimePicker(context),
              _buildDateAndTimePicker(context),
              ],
            ),
          ),
        ),
      )
    );

  }
}
