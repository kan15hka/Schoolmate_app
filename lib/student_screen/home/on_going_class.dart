import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/constants.dart';

class OnGoingClassHome extends StatelessWidget {
  const OnGoingClassHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.0,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: 90.0,
              margin:
                  EdgeInsets.only(left: 15.0, right: (index == 2) ? 15.0 : 0.0),
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: k3GreyColor, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0)),
              child: SizedBox(
                width: kwidth! * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichTextCard(MdiIcons.clock, " 04:00 TO 04:30 PM"),
                    const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "CS6104 - DATABASE MANAGEMENT SYSTEM",
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(2.0)),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "ONGOING CLASS",
                          style: TextStyle(color: k3GreyColor, fontSize: 14.0),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

Widget RichTextCard(IconData iconData, String text) {
  return Text.rich(
    TextSpan(
      style: TextStyle(
        fontSize: 13.0,
        color: k3GreyColor,
        overflow: TextOverflow.ellipsis,
      ),
      children: [
        WidgetSpan(
          child: Icon(iconData, size: 17.0, color: k3GreyColor),
        ),
        TextSpan(
          text: text,
        ),
      ],
    ),
  );
}
