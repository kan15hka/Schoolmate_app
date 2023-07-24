import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schoolmate/student_authenticaton/otp_verif_page/otp_verif_page.dart';

import 'package:schoolmate/student_authenticaton/student_id_profile/contact_tabbar.dart';
import 'package:schoolmate/student_authenticaton/student_id_profile/school_silverappbar.dart';

import '../../constants.dart';

class StudentIdProfile extends StatefulWidget {
  const StudentIdProfile({super.key});

  @override
  State<StudentIdProfile> createState() => _StudentIdProfileState();
}

class _StudentIdProfileState extends State<StudentIdProfile>
    with TickerProviderStateMixin {
  //Detect Slide
  bool isSlidedUp = false;
  bool isSlidedDown = false;

  // scroll controllers
  ScrollController _controller = ScrollController();
  bool sliverActionsHidden = false;
  // Listening for user scroll on screen.
  void _scrollListener() {
    if ((_controller.position.userScrollDirection == ScrollDirection.forward)) {
      isSlidedUp = true;
    }
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

    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //get the height and width of the device
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kAmberColor,
      body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          slivers: [
            //SCHOOL APP BAR
            SliverAppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              elevation: 0.0,
              pinned: false,
              toolbarHeight: height * 0.125,
              backgroundColor: kAmberColor,
              expandedHeight: (isSlidedUp) ? height * 0.4 : 0.0,
              centerTitle: true,
              title: Text(
                "FIGHTCLUB SCHOOL",
                textScaleFactor: 1.0,
                style: TextStyle(
                    fontFamily: kOutfit,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              //SILVER APP BAR INFO
              flexibleSpace: FlexibleSpaceBar(
                background: SchoolSilverAppBar(),
              ),
            ),

            SliverToBoxAdapter(
                child: Container(
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //ARROW AND SWIPE
                  (sliverActionsHidden == false)
                      ? Column(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_up,
                              size: 40.0,
                            ),
                            Text(
                              'SLIDE UP',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: kSFUIText, color: kGrey500Color),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 40.0,
                            ),
                            Text(
                              'SLIDE DOWN',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: kSFUIText, color: kGrey500Color),
                            )
                          ],
                        ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //STUDENT ID DETAILS
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          //PROFILE IMAGE
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                height: 135.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: kGrey300Color,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  'assets/leo.jpg',
                                  height: 125.0,
                                  width: 110.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //BLOOD GROUP
                          Container(
                            width: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: kGrey300Color,
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.bloodtype,
                                  color: Color.fromARGB(255, 248, 89, 78),
                                ),
                                Text(
                                  'AB -ve',
                                  textScaleFactor: 1.0,
                                  style: kBodyBoldTextStyle,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      //STUDENT INFO
                      Container(
                        height: 135.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'TYLER DURDEN',
                              textScaleFactor: 1.0,
                              style: kBodyBoldTextStyle,
                            ),
                            Text(
                              'XII - A',
                              textScaleFactor: 1.0,
                              style: kBodyBoldTextStyle,
                            ),
                            Text(
                              '14CSLMC21',
                              textScaleFactor: 1.0,
                              style: kBodyLightTextStyle,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  //CONTACT DETAILS AND ADDRESS TAB BAR
                  ContactTabBar(),
                  //ARE YOU A PARENT?
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55.0, vertical: 20.0),
                      child: Text(
                        'ARE YOU A PARENT?',
                        textScaleFactor: 1.0,
                        style: kBodyLightTextStyle,
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => OtpVerificationPage())));
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(width * 0.9, 60.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 40.0),
                          backgroundColor: kAmberColor,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      child: Text(
                        'LOG-IN AS PARENT',
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.center,
                        style: kBodyBoldTextStyle,
                      )),
                  SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            )),
          ]),
    );
  }
}
