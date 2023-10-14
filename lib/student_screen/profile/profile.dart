import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schoolmate/student_screen/profile/contact_tabbar.dart';
import 'package:schoolmate/student_screen/profile/id_card_widget.dart';
import 'package:schoolmate/student_screen/profile/profile_sliverappbar.dart';

import '../../constants.dart';

class ProfileWidget extends StatefulWidget {
  final List<Map<String, dynamic>> studentData;
  final int studentIndex;
  const ProfileWidget(
      {super.key, required this.studentData, required this.studentIndex});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with TickerProviderStateMixin {
  //Detect Slide
  bool isSlidedUp = false;
  bool isSlidedDown = false;
  bool showAppBarContents = false;
  // scroll controllers
  ScrollController _controller = ScrollController();
  bool sliverActionsHidden = false;

  // Listening for user scroll on screen.
  void _scrollListener() {
    if ((_controller.position.userScrollDirection == ScrollDirection.forward)) {
      isSlidedUp = true;
      showAppBarContents = true;
    }
    // if ((_controller.position.userScrollDirection == ScrollDirection.reverse)) {
    //   showAppBarContents = true;
    // }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        sliverActionsHidden = false;
      });
    } else {
      setState(() {
        sliverActionsHidden = true;
      });
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    showAppBarContents = false;
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //get the height and width of the device

    final List<Map<String, dynamic>> data = widget.studentData;
    final int sindex = widget.studentIndex;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          slivers: [
            //PROFILE SLIVER APP BAR
            ProfileSliverAppBar(
                isSlided: showAppBarContents, isSlidedUp: isSlidedUp),
            //PROFILE CONTENT
            SliverToBoxAdapter(
                child: Container(
              width: kwidth,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //ARROW AND SWIPE
                  (sliverActionsHidden == false)
                      ? Column(
                          children: [
                            const Icon(
                              Icons.keyboard_arrow_up,
                              size: 30.0,
                            ),
                            Text(
                              'SLIDE UP',
                              textScaleFactor: 1.0,
                              style:
                                  TextStyle(color: k3GreyColor, fontSize: 13.0),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            const Icon(
                              Icons.keyboard_arrow_down,
                              size: 30.0,
                            ),
                            Text(
                              'SLIDE DOWN',
                              textScaleFactor: 1.0,
                              style:
                                  TextStyle(color: k3GreyColor, fontSize: 13.0),
                            )
                          ],
                        ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    color: kLSecondaryColor,
                    height: 55.0,
                    width: kwidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ACADEMIC YEAR",
                          style: TextStyle(fontSize: 15.0, color: k3GreyColor),
                        ),
                        const Text("2023-2024")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  //STUDENT ID DETAILS
                  const IdCardWidget(),

                  const SizedBox(
                    height: 20.0,
                  ),

                  //CONTACT DETAILS AND ADDRESS TAB BAR
                  Container(
                      height: kheight! * 0.6,
                      width: kwidth,
                      color: kLSecondaryColor,
                      child: ContactTabBar(studentData: data[sindex])),
                ],
              ),
            )),
          ]),
    );
  }
}
