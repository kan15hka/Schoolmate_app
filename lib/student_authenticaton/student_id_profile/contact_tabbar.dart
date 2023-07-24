import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';

class ContactTabBar extends StatefulWidget {
  const ContactTabBar({super.key});

  @override
  State<ContactTabBar> createState() => _ContactTabBarState();
}

class _ContactTabBarState extends State<ContactTabBar>
    with TickerProviderStateMixin {
  //Tab Controllers
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[100],
        ),
        child: Column(children: [
          //TABS FOR CONTACT DETAILS AND ADDRESS
          Container(
            decoration: BoxDecoration(
                color: kGrey300Color,
                borderRadius: BorderRadius.circular(10.0)),
            child: TabBar(
                physics: BouncingScrollPhysics(),
                unselectedLabelColor: Colors.black,
                labelStyle: kBodyBoldTextStyleWhite,
                unselectedLabelStyle: kBodyBoldTextStyle,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kGrey850Color),
                controller: _tabController,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 15.0),
                tabs: [
                  Tab(
                      child: Text(
                    'CONTACT DETAILS',
                    textScaleFactor: 1.0,
                  )),
                  Tab(
                      child: Text(
                    'ADDRESS',
                    textScaleFactor: 1.0,
                  ))
                ]),
          ),
          SizedBox(
            height: 15.0,
          ),
          // //TAB BAR VIEW
          Container(
            height: 250.0,
            child: TabBarView(
              controller: _tabController,
              children: [
                //CONTACT DETAILS
                ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Card(
                          color: kGrey300Color,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 1.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: kGrey300Color,
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Text(
                                  '+91 ' + (index + 9865478956).toString(),
                                  textScaleFactor: 1.0,
                                  style: kBodyBoldTextStyle,
                                ),
                              ),
                              Container(
                                width: 70.0,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: IconButton(
                                  icon: Icon(Icons.phone_in_talk),
                                  onPressed: () {},
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ));
                    }),
                //ADDRESS
                Container(
                  height: 200.0,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: kGrey300Color),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'No 12A,Nilgris Apartment',
                          textScaleFactor: 1.0,
                          style: kBodyBoldTextStyle,
                        ),
                        Text(
                          'Sardar Patel Road',
                          textScaleFactor: 1.0,
                          style: kBodyBoldTextStyle,
                        ),
                        Text(
                          'Guindy',
                          textScaleFactor: 1.0,
                          style: kBodyBoldTextStyle,
                        ),
                        Text(
                          'Chennai - 600025',
                          textScaleFactor: 1.0,
                          style: kBodyBoldTextStyle,
                        ),
                        Text(
                          'Tamil Nadu',
                          textScaleFactor: 1.0,
                          style: kBodyBoldTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ]),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
