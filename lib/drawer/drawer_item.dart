import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  //bool isSelected;
  DrawerItem({
    required this.title,
    required this.icon,
  });
}

class DrawerItems {
  static final home =
      DrawerItem(title: "HOME SCREEN", icon: FontAwesomeIcons.house);
  static final settings =
      DrawerItem(title: "SETTINGS", icon: FontAwesomeIcons.gear);
  static final switchAccount =
      DrawerItem(title: "SWITCH ACCOUNT", icon: MdiIcons.accountMultiple);
  static final logout =
      DrawerItem(title: "LOGOUT", icon: FontAwesomeIcons.rightFromBracket);
  static final checkUpdates =
      DrawerItem(title: "CHECK  FOR UPDATES", icon: FontAwesomeIcons.eye);
  static final List<DrawerItem> allDrawerItems = [
    home,
    settings,
    switchAccount,
    logout,
    checkUpdates
  ];
}
