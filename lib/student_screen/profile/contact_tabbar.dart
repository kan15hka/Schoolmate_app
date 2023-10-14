import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';

class ContactTabBar extends StatefulWidget {
  final Map<String, dynamic> studentData;
  const ContactTabBar({super.key, required this.studentData});

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
    //final Map<String, dynamic> data = widget.studentData;
    return Container(
      width: kwidth! * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        //color: Color.fromARGB(255, 245, 248, 248),
      ),
      child: Column(children: [
        const SizedBox(
          height: 10.0,
        ),
        //TABS FOR CONTACT DETAILS AND ADDRESS
        Container(
          height: 35.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(color: kPrimaryColor, width: 1.5)),
          child: TabBar(
              physics: const BouncingScrollPhysics(),
              unselectedLabelColor: kPrimaryColor,
              labelStyle: TextStyle(
                  fontSize: 15.0, color: Colors.white, fontFamily: kFontFamily),
              unselectedLabelStyle: TextStyle(
                  fontSize: 15.0,
                  color: kPrimaryColor,
                  fontFamily: kFontFamily),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: kPrimaryColor),
              controller: _tabController,
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              tabs: [
                Tab(
                    child: Container(
                  width: kwidth! * 0.3,
                  height: 35.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: const Center(
                    child: Text(
                      'PEOPLE',
                      textScaleFactor: 1.0,
                    ),
                  ),
                )),
                Tab(
                    child: SizedBox(
                  width: kwidth! * 0.3,
                  height: 35.0,
                  child: const Center(
                    child: Text(
                      'CONTACT',
                      textScaleFactor: 1.0,
                    ),
                  ),
                ))
              ]),
        ),
        const SizedBox(
          height: 15.0,
        ),
        // //TAB BAR VIEW
        SizedBox(
          height: 200.0,
          width: kwidth! * 0.85,
          //color: Colors.amber,
          child: TabBarView(
            controller: _tabController,
            children: [
              //CONTACT DETAILS
              Column(
                children: [
                  Container(
                    height: 100.0,
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 1.5, color: k3GreyColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextRow("FATHER", "PATRICK BATEMAN"),
                        TextRow("MOTHER", "ANA DE ARMAS"),
                        TextRow("GAURDIAN", "BATMAN"),
                      ],
                    ),
                  ),
                ],
              ),
              //ADDRESS
              Container(
                height: 200.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 1.5, color: k3GreyColor),
                    color: Colors.white),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ContactText("MOBILE", [
                        RichTextCard(Icons.phone, "+91 8072828935"),
                        RichTextCard(Icons.phone, "+91 8072828935")
                      ]),
                      ContactText("EMAIL", [
                        RichTextCard(Icons.mail_outlined, "tyler6969@gmail.com")
                      ]),
                      ContactText("ADDRESS", [
                        const Text(
                          "NO.9, NILGIRIS APARTMENT",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        const Text("SARDAR PATEL ROAD",
                            style: TextStyle(fontSize: 14.0)),
                        const Text("GUIND,CHENNAI-600025",
                            style: TextStyle(fontSize: 14.0)),
                        const Text("TAMIL NADU", style: TextStyle(fontSize: 14.0))
                      ])
                    ]),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

Widget TextRow(String title, String data) {
  return Center(
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            //color: Colors.red,
            child: Text(
              title,
              style: TextStyle(color: k3GreyColor, fontSize: 15.0),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            //color: Colors.amber,
            child: Text(
              ": $data",
              style: const TextStyle(fontSize: 15.0),
            ),
          ),
        )
      ],
    ),
  );
}

Widget ContactText(String title, List<Widget> widgets) {
  return Center(
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(color: k3GreyColor, fontSize: 14.0),
                ),
                const Text(":  "),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            //color: Colors.amber,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgets),
          ),
        )
      ],
    ),
  );
}

Widget RichTextCard(IconData iconData, String text) {
  return Text.rich(
    TextSpan(
      style: TextStyle(fontSize: 14.0, color: kBlack),
      children: [
        WidgetSpan(
          child: Icon(iconData, size: 17.0, color: k5GreyColor),
        ),
        TextSpan(text: " $text"),
      ],
    ),
  );
}
