import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:u_manager_flutter/Screen/Widget/NavigationBarItem.dart';
import 'package:u_manager_flutter/Screen/Widget/animatedFloatBtn.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final Widget homeIcon = SvgPicture.asset(
    'assets/calendar.svg',
    semanticsLabel: 'Acme Logo',
    color: Colors.red,
  );

  void _selectedTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return RadialMenu();
              });
        },
        child: Text('HELLO'),
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBar: FABBottomAppBar(
        selectedColor: Colors.amber[800],
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.calendar_today, text: 'HOME'),
          FABBottomAppBarItem(iconData: Icons.pin_drop, text: 'Search'),
          FABBottomAppBarItem(
              iconData: FontAwesomeIcons.bitcoin, text: 'Accounting'),
          FABBottomAppBarItem(
              iconData: Icons.calendar_view_day, text: 'Calculator'),
        ],
      ),
    );
  }
}
