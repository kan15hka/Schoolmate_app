import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';

class IdCardWidget extends StatefulWidget {
  const IdCardWidget({super.key});

  @override
  State<IdCardWidget> createState() => _IdCardWidgetState();
}

class _IdCardWidgetState extends State<IdCardWidget> {
  //id Card Tapped
  bool isIdCardTapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isIdCardTapped = !isIdCardTapped;
        });
      },
      child: Column(
        children: [
          Container(
            //duration: Duration(milliseconds: 250),
            height: (isIdCardTapped) ? 40.0 : 0.0,
          ),
          AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: (isIdCardTapped) ? 200.0 : 120,
              width: (isIdCardTapped) ? kwidth! * 0.75 + 20.0 : kwidth! * 0.75,
              // padding: EdgeInsets.only(
              //     left: 10.0, bottom: 10.0, top: 10.0, right: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(color: k3GreyColor, width: 1.5),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              child: (isIdCardTapped)
                  ? Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            top: -50.0,
                            left: kwidth! * 0.375 - 30.0,
                            // child: AnimatedCrossFade(
                            //   firstChild: Container(
                            //     height: 100.0,
                            //     width: 80.0,
                            //     color: kBlack,
                            //   ),
                            //   secondChild:
                            //       ,
                            //   duration:
                            //       Duration(milliseconds: 2000),
                            //   crossFadeState: (isIdCardTapped)
                            //       ? CrossFadeState.showFirst
                            //       : CrossFadeState.showSecond,
                            // )),
                            child: ProfileImage(100.0, 80.0)),
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 60.0,
                                ),
                                TextRow("NAME", "TYLER DURDEN"),
                                TextRow("ROLL NO", "ABC1234"),
                                TextRow("CLASS", "XII"),
                                TextRow("SECTION", "A"),
                                TextRow("DOB", "12-08-03"),
                                TextRow("BLOOD", "O+"),
                                const SizedBox(
                                  height: 15.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileImage(100.0, 80.0),

                        //STUDENT INFO
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "TYLER DURDEN",
                              textScaleFactor: 1.0,
                              style: kBodyLightTextStyle,
                            ),
                            Text(
                              '14CSLMC21',
                              textScaleFactor: 1.0,
                              style:
                                  TextStyle(fontSize: 15.0, color: k4GreyColor),
                            ),
                            Text(
                              'XII - A',
                              textScaleFactor: 1.0,
                              style:
                                  TextStyle(fontSize: 15.0, color: k4GreyColor),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        )
                      ],
                    )),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 20.0,
            width: (isIdCardTapped) ? kwidth! * 0.75 + 20.0 : kwidth! * 0.75,
            decoration: BoxDecoration(
                color: k4GreyColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0))),
            child: Center(
              child: (isIdCardTapped)
                  ? Text(
                      "TAP TO DISCLOSE",
                      style: TextStyle(fontSize: 12.0, color: kWhite),
                    )
                  : Text(
                      "TAP TO REVEAL",
                      style: TextStyle(fontSize: 12.0, color: kWhite),
                    ),
            ),
          )
        ],
      ),
    );
  }
}

Widget ProfileImage(double height, double width) {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: k3PrimaryColor,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.asset(
          'assets/leo.jpg',
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}

Widget TextRow(String title, String data) {
  return Center(
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            //color: Colors.red,
            child: Text(
              title,
              style: TextStyle(color: k4GreyColor),
            ),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Expanded(
          flex: 7,
          child: Container(
            //color: Colors.amber,
            child: Text(": $data"),
          ),
        )
      ],
    ),
  );
}
