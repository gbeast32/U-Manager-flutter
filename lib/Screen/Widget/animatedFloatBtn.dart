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
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//      return GestureDetector(behavior:
//      child: RadialAnimation(controller: controller),
//    );
    return RadialAnimation(controller: controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({Key key, this.controller})
      : scale = Tween<double>(begin: 1.5, end: 0).animate(
            CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)),
        translation = Tween<double>(begin: 0, end: 100).animate(
            CurvedAnimation(parent: controller, curve: Curves.elasticOut)),
        rotation = Tween<double>(begin: 0, end: 360).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.9, curve: Curves.decelerate)
//        curve: Curves.easeInBack
            )),
        super(key: key);
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;
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
                _buildSubBtn(
                  0,
                  color: Colors.redAccent,
                  icon: FontAwesomeIcons.shoppingBag,
                ),
                _buildSubBtn(
                  45,
                  color: Colors.deepOrangeAccent,
                  icon: FontAwesomeIcons.batteryQuarter,
                ),
                _buildSubBtn(
                  90,
                  color: Colors.deepOrange,
                  icon: FontAwesomeIcons.batteryHalf,
                ),
                _buildSubBtn(
                  135,
                  color: Colors.amber,
                  icon: FontAwesomeIcons.batteryThreeQuarters,
                ),
                _buildSubBtn(
                  180,
                  color: Colors.amberAccent,
                  icon: FontAwesomeIcons.batteryFull,
                ),
                _buildSubBtn(
                  225,
                  color: Colors.cyanAccent,
                  icon: FontAwesomeIcons.batteryEmpty,
                ),
                _buildSubBtn(
                  270,
                  color: Colors.blueAccent,
                  icon: Icons.lightbulb_outline,
                ),
                _buildSubBtn(
                  315,
                  color: Colors.tealAccent,
                  icon: Icons.library_add,
                ),
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

  _buildSubBtn(double angle, {Color color, IconData icon}) {
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

  _open() {
    controller.forward();
    print('open');
  }

  _close() {
    controller.reverse();
    print('close');
  }
}
