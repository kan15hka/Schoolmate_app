import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  const SettingsScreen({super.key, required this.openDrawer});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: widget.openDrawer,
            icon: FaIcon(FontAwesomeIcons.alignLeft)),
      ),
    );
  }
}
