import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RadialMenu extends StatefulWidget {
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

// ignore: must_be_immutable
class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;

  RadialAnimation({Key key, this.controller})
      : scale = Tween<double>(begin: 1.5, end: 0).animate(
            CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)),
        translation = Tween<double>(begin: 0, end: 100).animate(
            CurvedAnimation(parent: controller, curve: Curves.elasticOut)),
        rotation = Tween<double>(begin: 0, end: 360).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.5, curve: Curves.decelerate),
          ),
        ),
        super(key: key);

  List<Map<String, dynamic>> subBottomProps = [
    {
      'angle': 0.0,
      'color': Colors.redAccent,
      'icon': FontAwesomeIcons.shoppingBag,
    },
    {
      'angle': 45.0,
      'color': Colors.deepOrangeAccent,
      'icon': FontAwesomeIcons.batteryQuarter,
    },
    {
      'angle': 90.0,
      'color': Colors.deepOrange,
      'icon': FontAwesomeIcons.batteryHalf,
    },
    {
      'angle': 135.0,
      'color': Colors.amber,
      'icon': FontAwesomeIcons.batteryThreeQuarters,
    },
    {
      'angle': 180.0,
      'color': Colors.amberAccent,
      'icon': FontAwesomeIcons.batteryFull,
    },
    {
      'angle': 225.0,
      'color': Colors.cyanAccent,
      'icon': FontAwesomeIcons.batteryEmpty,
    },
    {
      'angle': 270.0,
      'color': Colors.cyanAccent,
      'icon': FontAwesomeIcons.batteryEmpty,
    },
    {
      'angle': 315.0,
      'color': Colors.tealAccent,
      'icon': Icons.library_add,
    }
  ];

  Widget _buildSubBtn(double angle, {Color color, IconData icon}) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
            (translation.value) * cos(rad), (translation.value) * sin(rad)),
      child: FloatingActionButton(
        child: Icon(icon),
        backgroundColor: color,
        onPressed: _close,
        elevation: 2,
      ),
    );
  }

  List<Widget> btnMap() => subBottomProps
      .map((props) => _buildSubBtn(props['angle'],
          color: props['color'], icon: props['icon']))
      .toList();

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, builder) {
        return Transform.rotate(
          angle: radians(rotation.value),
          child: Container(
            width: 500,
            height: 500,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ...btnMap(),
                Transform.scale(
                  scale: scale.value - 1.5,
                  child: FloatingActionButton(
                    child: Icon(Icons.arrow_forward_ios),
                    onPressed: _close,
                  ),
                ),
                Transform.scale(
                  scale: scale.value,
                  child: FloatingActionButton(
                    child: Icon(Icons.forward),
                    onPressed: _open,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
