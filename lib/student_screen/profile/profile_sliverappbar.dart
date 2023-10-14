import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/widgets/background_widget.dart';

class ProfileSliverAppBar extends StatelessWidget {
  final bool isSlided;
  final bool isSlidedUp;
  const ProfileSliverAppBar(
      {super.key, required this.isSlided, required this.isSlidedUp});

  @override
  Widget build(BuildContext context) {
    //get the height and width of the device
    //final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(
      //     bottom: Radius.circular(30),
      //   ),
      // ),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: kPrimaryColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark),
      pinned: false,
      toolbarHeight: 70.0,
      backgroundColor: kPrimaryColor,
      expandedHeight: (isSlidedUp) ? 300.0 : 0.0,
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
                  const SizedBox(
                    width: 50.0,
                    height: 40.0,
                  ),
                  const Spacer(),
                  Text(
                    "PROFILE",
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
      //SILVER APP BAR INFO
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: kPrimaryColor,
          child: (!isSlided)
              ? Container()
              : Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    color: k2PrimaryColor,
                    height: 115.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "TYLER DURDEN MATRICULATION AND HIGHER SECONDRY SCHOOL ",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kBlack,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSliverAppBar("NO 12A ,NILGIRIS APARTMENT "),
                        TextSliverAppBar("SARDAR PATEL ROAD"),
                        TextSliverAppBar("GUINDY, CHENNAI- 600025"),
                        TextSliverAppBar("TAMIL NADU"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Divider(
                            color: k3PrimaryColor,
                            thickness: 2.0,
                          ),
                        ),
                        TextSliverAppBar('+91 9485854848'),
                        TextSliverAppBar('velammalcbseguindy@gmail.com'),
                        const SizedBox(height: 10.0)
                      ],
                    ),
                  ),
                  Container(
                    color: k2PrimaryColor,
                    height: 8.0,
                  ),
                ]),
        ),
      ),
      //flexibleSpace: ProfileSliverAppBar(),
    );
  }
}

Widget TextSliverAppBar(String text) {
  return Text(
    text,
    textScaleFactor: 1.0,
    textAlign: TextAlign.center,
    style: TextStyle(color: kBlack, fontSize: 15.0),
  );
}
