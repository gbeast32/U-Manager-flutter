import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

//  Widget bottomNavigationBar() {
//    return BottomAppBar(
//      shape: CircularNotchedRectangle(),
//      child: Row(
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          FABBottomAppBarItem(iconData: Icons.multiline_chart,text: "12");
//
//        ],
//
//      ),
//
//    );
////    return BottomNavigationBar(
////      items: <BottomNavigationBarItem>[
////        BottomNavigationBarItem(
////            icon: Icon(Icons.calendar_today), title: Text('Home')),
////        BottomNavigationBarItem(
////            icon: Icon(Icons.pin_drop), title: Text('Search')),
////        BottomNavigationBarItem(
////            icon: Icon(Icons.calendar_view_day), title: Text('Calculator')),
////      ],
////      currentIndex: currentIndex,
////      selectedItemColor: Colors.amber[800],
////      onTap: _onItemTapped,
////      unselectedFontSize: 0,
////      selectedFontSize: 15,
////      unselectedIconTheme: IconThemeData(size: 30),
////      selectedIconTheme: IconThemeData(size: 25),
////    );
//  }
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
        onPressed: () {},
        child: Text('hello'),
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBar: FABBottomAppBar(
        selectedColor: Colors.amber[800],
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),],
      ),
    );
  }
}
