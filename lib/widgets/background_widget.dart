import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return CustomScrollView(
      //physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: kPrimaryColor,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark),
          elevation: 0.0,
          pinned: false,
          toolbarHeight: 70.0,
          backgroundColor: kPrimaryColor,
          expandedHeight: 0.0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Container(
            height: 70.0,
            color: kPrimaryColor,
            child: Stack(
              children: [
                Positioned(
                  height: 100.0,
                  bottom: 0.0,
                  width: 100.0,
                  left: kwidth! - 80.0,
                  child: HexagonSvg(
                      100.0, 80.0, true, k2PrimaryColor, k3PrimaryColor, 0.5),
                ),
                Positioned(
                  height: 100.0,
                  top: 10.0,
                  width: 100.0,
                  right: kwidth! - 80.0,
                  child: HexagonSvg(
                      100.0, 80.0, true, k2PrimaryColor, k3PrimaryColor, 0.5),
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
        ),
        SliverToBoxAdapter(
            child: Container(
          width: kwidth,
          constraints: BoxConstraints(minHeight: kheight! - 70.0),
          decoration: BoxDecoration(
              color: kWhite,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: child,
        ))
      ],
    );
  }
}

class PageBackgroundWidget extends StatelessWidget {
  final String text;
  final bool automaticallyImplyLeading;
  // final scrollController;
  final Widget child;

  const PageBackgroundWidget(
      {super.key,
      required this.text,
      required this.automaticallyImplyLeading,
      // this.scrollController = ScrollController(),
      required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: kPrimaryColor,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark),
          elevation: 0.0,
          pinned: false,
          toolbarHeight: 50.0,
          backgroundColor: kPrimaryColor,
          expandedHeight: 0.0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Container(
            height: 50.0,
            color: kPrimaryColor,
            child: Stack(
              children: [
                Positioned(
                  height: 80.0,
                  bottom: 0.0,
                  width: 80.0,
                  left: kwidth! - 70.0,
                  child: HexagonSvg(
                      80.0, 80.0, false, k2PrimaryColor, k3PrimaryColor, 0.5),
                ),
                Positioned(
                  height: 80.0,
                  top: 0.0,
                  width: 80.0,
                  right: kwidth! - 70.0,
                  child: HexagonSvg(
                      80.0, 80.0, false, k2PrimaryColor, k3PrimaryColor, 0.5),
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
        ),
        SliverToBoxAdapter(
            child: Container(
          width: kwidth,
          constraints: BoxConstraints(minHeight: kheight! - 70.0),
          decoration: BoxDecoration(
              color: kWhite,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: child,
        ))
      ],
    );
  }
}

Widget HexagonSvg(double sizeL, double sizeS, bool isSmallHexagonNeeded,
    Color colorL, Color colorS, double rotateAngle) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        child: Transform.rotate(
          angle: rotateAngle,
          child: SvgPicture.asset(
            "assets/hexagon.svg",
            fit: BoxFit.cover,
            height: sizeL,
            width: sizeL,
            colorFilter: ColorFilter.mode(colorL, BlendMode.srcIn),
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
              colorFilter: ColorFilter.mode(colorS, BlendMode.srcIn),
            ),
          ),
        )
    ],
  );
}

PreferredSizeWidget ScreenAppBar(
    String text, bool automaticallyImplyLeading, BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark),
    leadingWidth: 0.0,
    automaticallyImplyLeading: false,
    titleSpacing: 0.0,
    toolbarHeight: 70.0,
    elevation: 0.0,
    title: Container(
      height: 70.0,
      color: kPrimaryColor,
      child: Stack(
        children: [
          Positioned(
            height: 100.0,
            bottom: 0.0,
            width: 100.0,
            left: kwidth! - 80.0,
            child: HexagonSvg(
                100.0, 80.0, true, k2PrimaryColor, k3PrimaryColor, 0.5),
          ),
          Positioned(
            height: 100.0,
            top: 10.0,
            width: 100.0,
            right: kwidth! - 80.0,
            child: HexagonSvg(
                100.0, 80.0, true, k2PrimaryColor, k3PrimaryColor, 0.5),
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
  );
}

PreferredSizeWidget PageAppBar(
    String text, bool automaticallyImplyLeading, BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark),
    leadingWidth: 0.0,
    automaticallyImplyLeading: false,
    titleSpacing: 0.0,
    toolbarHeight: 50.0,
    elevation: 0.0,
    title: Container(
      height: 50.0,
      color: kPrimaryColor,
      child: Stack(
        children: [
          Positioned(
            height: 80.0,
            bottom: 0.0,
            width: 80.0,
            left: kwidth! - 70.0,
            child: HexagonSvg(
                80.0, 80.0, false, k2PrimaryColor, k3PrimaryColor, 0.5),
          ),
          Positioned(
            height: 80.0,
            top: 0.0,
            width: 80.0,
            right: kwidth! - 70.0,
            child: HexagonSvg(
                80.0, 80.0, false, k2PrimaryColor, k3PrimaryColor, 0.5),
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
  );
}
