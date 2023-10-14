import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';

class DynamicIslandHome extends StatelessWidget {
  const DynamicIslandHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: kPrimaryColor,
            height: 70.0,
          ),
          Container(
            height: 70.0,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
            ),
          ),
          Positioned(
              left: 0.0,
              top: -65.0,
              child: SizedBox(
                height: 125.0,
                width: kwidth,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: 15.0,
                            top: 10.0,
                            bottom: 10.0,
                            right: (index == 2) ? 15.0 : 0.0),
                        height: 100.0,
                        width: kwidth! * 0.8,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 221, 217, 217),
                              blurRadius: 5.0,
                            )
                          ],
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10.0),
                          // border: Border.all(
                          //     color: Color.fromARGB(255, 255, 209, 27),
                          //     width: 1.0),
                        ),
                      );
                    }),
              ))
        ],
      ),
    );
  }
}
