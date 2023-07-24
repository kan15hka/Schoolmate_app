import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:schoolmate/student_screen/subjects/subjects.dart';
import '../../../constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  // PERSISTENT CONTROLLER
  final _controller = PersistentTabController(initialIndex: 0);

  //NAV BAR ITEMS
  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.black,
        icon: Icon(
          MdiIcons.bookMultiple,
        ),
        title: 'Subjects',
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.black,
        icon: Icon(
          MdiIcons.speedometer,
        ),
        title: 'Performance',
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.black,
        icon: Icon(
          Icons.auto_graph,
        ),
        title: 'Activity',
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.black,
        icon: Icon(
          FontAwesomeIcons.user,
        ),
        title: 'Profile',
      ),
    ];
  }

  //NAV BAR WIDGETS
  List<Widget> _buildScreens() {
    return [
      SubjectsWidget(),
      Container(
        color: Colors.indigo,
        height: 800,
      ),
      Container(
        color: Colors.orange,
        height: 800,
      ),
      Container(
        color: Colors.green,
        height: 800,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    //get the height and width of the device
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      navBarStyle: NavBarStyle.style3,
    );
  }
}
