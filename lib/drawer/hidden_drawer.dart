import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/drawer/drawer_item.dart';
import 'package:schoolmate/student_screen/profile/id_card_widget.dart';
import 'package:schoolmate/widgets/background_widget.dart';

class HiddenDrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  final DrawerItem selectedItem;

  const HiddenDrawerWidget(
      {super.key, required this.onSelectedItem, required this.selectedItem});

  static const Color hexagonColor = Color.fromARGB(255, 38, 165, 177);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
              height: 120.0,
              top: -60.0,
              width: 120.0,
              right: -40,
              child: HexagonSvg(
                  120.0, 120.0, false, hexagonColor, k3PrimaryColor, 0.5)),
          Positioned(
              height: 150.0,
              bottom: -40.0,
              width: 150.0,
              right: -30,
              child: HexagonSvg(
                  150.0, 150.0, false, hexagonColor, k3PrimaryColor, 0.5)),
          Positioned(
              height: 150.0,
              top: kheight! * 0.55,
              width: 150.0,
              left: -80,
              child: HexagonSvg(
                  150.0, 150.0, false, hexagonColor, k3PrimaryColor, 0.5)),
          Positioned(
              height: 150.0,
              top: -50,
              width: 150.0,
              left: -50,
              child: HexagonSvg(
                  150.0, 150.0, false, hexagonColor, k3PrimaryColor, 0.5)),
          Positioned(
              height: 45.0,
              top: kheight! * 0.17,
              width: 45.0,
              left: kwidth! * 0.4,
              child: HexagonSvg(
                  45.0, 45.0, false, hexagonColor, k3PrimaryColor, 0.2)),
          Positioned(
              height: 25.0,
              top: kheight! * 0.4,
              width: 25.0,
              left: kwidth! * 0.3,
              child: HexagonSvg(
                  25.0, 25.0, false, hexagonColor, k3PrimaryColor, 0.4)),
          Positioned(
              height: 50.0,
              bottom: kheight! * 0.1,
              width: 50.0,
              left: kwidth! * 0.1,
              child: HexagonSvg(
                  50.0, 50.0, false, hexagonColor, k3PrimaryColor, 0.5)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: kheight! * 0.3,
              padding: EdgeInsets.only(
                top: kheight! * 0.08,
              ),
              //color: kSecondaryColor,
              width: kwidth! * 0.6,
              child: Column(children: [
                ProfileImage(100.0, 80.0),
                const SizedBox(height: 10.0),
                Text(
                  "TYLER DURDEN",
                  style: TextStyle(fontSize: 18.0, color: kSecondaryColor),
                ),
              ]),
            ),
            DrawerItemCard("HOME SCREEN", FontAwesomeIcons.house,
                DrawerItems.home, onSelectedItem),
            DrawerItemCard("SETTINGS", FontAwesomeIcons.gear,
                DrawerItems.settings, onSelectedItem),
            DrawerItemCard("SWITCH ACCOUNT", MdiIcons.accountMultiple,
                DrawerItems.switchAccount, onSelectedItem),
            const Spacer(),
            DrawerItemCard("LOGOUT", FontAwesomeIcons.rightFromBracket,
                DrawerItems.logout, onSelectedItem),
            DrawerItemCard("CHECK FOR UPDATES", FontAwesomeIcons.eye,
                DrawerItems.checkUpdates, onSelectedItem),
            const SizedBox(
              height: 30.0,
            )
          ]),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DrawerItemCard(String titleText, IconData icon, DrawerItem item,
      ValueChanged<DrawerItem> onSelectedItem) {
    return GestureDetector(
      onTap: () {
        onSelectedItem(item);
        //item.isSelected = true;
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 15.0, bottom: 15.0, left: (item == selectedItem) ? 0.0 : 15.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: (item == selectedItem) ? 30.0 : 0,
              width: (item == selectedItem) ? 20.0 : 0.0,
              margin:
                  EdgeInsets.only(right: (item == selectedItem) ? 10.0 : 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: kSecondaryColor,
              ),
            ),
            Icon(
              icon,
              size: 20.0,
              color: kSecondaryColor,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              titleText,
              style: TextStyle(fontSize: 16.0, color: kSecondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
