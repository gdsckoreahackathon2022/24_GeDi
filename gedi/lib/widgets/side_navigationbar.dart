import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:gedi/models/global.dart';

import 'package:gedi/screens/setting_screen.dart';

class LeftWidget extends StatefulWidget {
  const LeftWidget({Key? key, required this.callback}) : super(key: key);

  final Function callback;

  @override
  _LeftWidgetState createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> with TickerProviderStateMixin {
  final List<String> _list = ["Dictionary", "My Page", "Videos"];
  // HomePage home = HomePage();
  final List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  int checkIndex = 0;

  Offset checkedPositionOffset = const Offset(0, 0);
  Offset lastCheckOffset = const Offset(0, 0);

  Offset animationOffset = const Offset(0, 0);
  late Animation _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    checkIndex = 1;
    super.initState();

    SchedulerBinding.instance!.endOfFrame.then((value) {
      calcuteCheckOffset();
      // animationOffset =
      //     Offset(checkedPositionOffset.dx, checkedPositionOffset.dy);
      addAnimation();
    });
  }

  void calcuteCheckOffset() {
    lastCheckOffset = checkedPositionOffset;
    RenderBox renderBox =
        _keys[checkIndex].currentContext!.findRenderObject() as RenderBox;
    Offset widgetOffset = renderBox.localToGlobal(const Offset(0, 0));
    Size widgetSise = renderBox.size;
    checkedPositionOffset = Offset(widgetOffset.dx + widgetSise.width,
        widgetOffset.dy + widgetSise.height);
  }

  List<Widget> _buildList(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(const Padding(
        padding: EdgeInsets.only(
      top: 100,
    )));
    for (int i = 0; i < _list.length; i++) {
      widgetList.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              indexChecked(i);
            },
            child: VerticalText(
              _list[i],
              _keys[i],
              checkIndex == i &&
                  (_animationController != null &&
                      _animationController!.isCompleted),
            ),
          ),
        ),
      );
    }
    widgetList.add(
      const Padding(
        padding: EdgeInsets.only(
          top: 50,
        ),
      ),
    );
    widgetList.add(
      Padding(
        padding: EdgeInsets.only(
          top: 50,
          bottom: 50,
        ),
        child: IconButton(
          icon: Icon(
            Icons.settings,
            color: Color(0xffd8d8d8),
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Setting()));
          },
        ),
      ),
    );
    return widgetList;
  }

  // static Future<int> nowPage(int i) async {
  //   return i;
  // }

  void indexChecked(int i) {
    if (checkIndex == i) return;

    setState(() {
      pageIndex = i;
      widget.callback(i);
      checkIndex = i;
      calcuteCheckOffset();
      addAnimation();
      //home.createState().build(context);
    });
  }

  void addAnimation() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this)
      ..addListener(() {
        setState(() {
          animationOffset = Offset(checkedPositionOffset.dx, _animation.value);
        });
      });

    _animation = Tween(begin: lastCheckOffset.dy, end: checkedPositionOffset.dy)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.easeInOutBack));
    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 55,
          decoration: BoxDecoration(
            color: const Color(0xff6667AB),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: _buildList(context),
          ),
        ),
        Positioned(
          top: animationOffset.dy,
          left: animationOffset.dx,
          child: CustomPaint(
            painter: CheckPointPainter(const Offset(10, -20)),
          ),
        ),
      ],
    );
  }
}

class CheckPointPainter extends CustomPainter {
  double pointRadius = 5;
  double radius = 30;

  Offset offset;

  CheckPointPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;
    Path path = Path();

    double startAngle = -math.pi / 2;
    double sweepAngle = math.pi;

    paint.color = const Color(0xff6667AB);

    // canvas.drawRect(
    //     Rect.fromCenter(center: Offset(offset.dx, offset.dy), width: 60, height: 60),
    //     paint);
    canvas.drawArc(
      Rect.fromCenter(
          center: Offset(offset.dx, offset.dy), width: 60, height: 80),
      //Rect.fromCircle(center: Offset(offset.dx, offset.dy), radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    paint.color = Colors.white;

    canvas.drawCircle(
        Offset(offset.dx - pointRadius / 2, offset.dy - pointRadius / 2),
        pointRadius,
        paint);
    var center =
        Offset(offset.dx - pointRadius / 2, offset.dy - pointRadius / 2);
    path.addOval(Rect.fromCircle(center: center, radius: pointRadius));
    canvas.drawShadow(path, const Color.fromARGB(255, 0, 0, 0), 1.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class VerticalText extends StatelessWidget {
  final String name;
  final bool checked;
  final GlobalKey globalKey;

  const VerticalText(this.name, this.globalKey, this.checked, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      key: globalKey,
      quarterTurns: 3,
      child: Text(
        name,
        style: TextStyle(
          shadows: const <Shadow>[
            Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0))
          ],
          color: checked ? Colors.white : const Color(0xffd8d8d8),
          fontSize: 16,
        ),
      ),
    );
  }
}
