import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:schoolmate/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundWidget extends StatelessWidget {
  final String text;
  final bool automaticallyImplyLeading;
  final Widget child;

  const BackgroundWidget(
      {super.key,
      required this.text,
      required this.automaticallyImplyLeading,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SafeArea(
            child: Column(
      children: [
        Container(
          height: 70.0,
          color: kPrimaryColor,
          child: Stack(
            children: [
              Positioned(
                height: 100.0,
                bottom: 0.0,
                width: 100.0,
                left: kwidth! - 80.0,
                child: HexagonSvg(100.0, 80.0, true),
              ),
              Positioned(
                height: 100.0,
                top: 10.0,
                width: 100.0,
                right: kwidth! - 80.0,
                child: HexagonSvg(100.0, 80.0, true),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 50.0,
                        height: 40.0,
                        child: (automaticallyImplyLeading)
                            ? IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: kWhite,
                                  size: 20.0,
                                ),
                              )
                            : Container()),
                    const Spacer(),
                    Text(
                      text,
                      style: TextStyle(fontSize: 24.0, color: kWhite),
                    ),
                    const Spacer(),
                    const SizedBox(
                      width: 50.0,
                      height: 40.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
              width: kwidth,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              child: child),
        ),
      ],
    )));
  }
}

class PageBackgroundWidget extends StatelessWidget {
  final String text;
  final bool automaticallyImplyLeading;
  final Widget child;

  const PageBackgroundWidget(
      {super.key,
      required this.text,
      required this.automaticallyImplyLeading,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          height: 50.0,
          color: kPrimaryColor,
          child: Stack(
            children: [
              Positioned(
                height: 80.0,
                bottom: 0.0,
                width: 80.0,
                left: kwidth! - 70.0,
                child: HexagonSvg(80.0, 80.0, false),
              ),
              Positioned(
                height: 80.0,
                top: 0.0,
                width: 80.0,
                right: kwidth! - 70.0,
                child: HexagonSvg(80.0, 80.0, false),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 50.0,
                        height: 40.0,
                        child: (automaticallyImplyLeading)
                            ? IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: kWhite,
                                  size: 20.0,
                                ),
                              )
                            : Container()),
                    const Spacer(),
                    Text(
                      text,
                      style: TextStyle(fontSize: 24.0, color: kWhite),
                    ),
                    const Spacer(),
                    const SizedBox(
                      width: 50.0,
                      height: 40.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
              width: kwidth,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              child: child),
        ),
      ],
    ));
  }
}

Widget HexagonSvg(double sizeL, double sizeS, bool isSmallHexagonNeeded) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        child: Transform.rotate(
          angle: 0.5,
          child: SvgPicture.asset(
            "assets/hexagon.svg",
            fit: BoxFit.cover,
            height: sizeL,
            width: sizeL,
            colorFilter: ColorFilter.mode(k2PrimaryColor, BlendMode.srcIn),
          ),
        ),
      ),
      if (isSmallHexagonNeeded)
        Container(
          child: Transform.rotate(
            angle: 0.5,
            child: SvgPicture.asset(
              "assets/hexagon.svg",
              fit: BoxFit.cover,
              height: sizeS,
              width: sizeS,
              colorFilter: ColorFilter.mode(k3PrimaryColor, BlendMode.srcIn),
            ),
          ),
        )
    ],
  );
}
