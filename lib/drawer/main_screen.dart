import 'package:flutter/material.dart';

import 'package:schoolmate/constants.dart';
import 'package:schoolmate/drawer/dialog_popup.dart';
import 'package:schoolmate/drawer/drawer_item.dart';
import 'package:schoolmate/drawer/hidden_drawer.dart';
import 'package:schoolmate/drawer/settings.dart';
import 'package:schoolmate/student_screen/student_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItems.home;
  bool isDragging = false;
  bool exitApp = true;
  @override
  void initState() {
    super.initState();
    closeDrawer();
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  void openDrawer() {
    setState(() {
      xOffset = kwidth! * 0.6;
      yOffset = kheight! * 0.15;
      scaleFactor = 0.7;
      isDrawerOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: k3PrimaryColor,
      body: Stack(
        children: [
          buildDrawer(),
          buildPage(),
        ],
      ),
    );
  }

  Widget buildDrawer() {
    return HiddenDrawerWidget(
      onSelectedItem: (item) {
        if (item == DrawerItems.logout) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "LOGGED OUT SUCCESSFULLY",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: kFontFamily),
            ),
            elevation: 0.0,
            backgroundColor: kPrimaryColor,
          ));
          closeDrawer();
          return;
        } else if (item == DrawerItems.checkUpdates) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "UPDATES CHECKED",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: kFontFamily),
            ),
            elevation: 0.0,
            backgroundColor: kPrimaryColor,
          ));
          closeDrawer();
          return;
        } else if (item == DrawerItems.home) {
          setState(() {
            this.item = item;
            closeDrawer();
          });
        } else {
          setState(() {
            this.item = item;
            closeDrawer();
          });
        }
      },
      selectedItem: item,
    );
  }

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          ExitDialog().showExitDialog(context);
          return true;
        }
      },
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          isDragging = true;
        },
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;
          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
          isDragging = false;
        },
        onTap: closeDrawer,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            child: AbsorbPointer(
              absorbing: isDrawerOpen,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isDrawerOpen ? 20.0 : 0.0),
                child: Container(
                  //color: isDrawerOpen ? kWhite : kPrimaryColor,
                  child: getDrawerPage(),
                ),
              ),
            )),
      ),
    );
  }

  Widget getDrawerPage() {
    if (item == DrawerItems.home) {
      return StudentScreen(
        openDrawer: openDrawer,
      );
    }
    if (item == DrawerItems.settings) {
      return SettingsScreen(
        openDrawer: openDrawer,
      );
    }
    if (item == DrawerItems.switchAccount) {
      return SettingsScreen(
        openDrawer: openDrawer,
      );
    }
    return StudentScreen(
      openDrawer: openDrawer,
    );
  }
}
