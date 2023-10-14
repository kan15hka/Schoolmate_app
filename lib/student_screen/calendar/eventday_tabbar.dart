import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/constants.dart';

class EventDayTabBar extends StatefulWidget {
  final List<Map<String, String>> importantDayEventsList;
  final List<Map<String, String>> holidayDayEventsList;
  final List<Map<String, String>> occasionDayEventsList;
  const EventDayTabBar({
    super.key,
    required this.importantDayEventsList,
    required this.holidayDayEventsList,
    required this.occasionDayEventsList,
  });

  @override
  State<EventDayTabBar> createState() => _EventDayTabBarState();
}

class _EventDayTabBarState extends State<EventDayTabBar>
    with TickerProviderStateMixin {
  //Tab Controllers
  late TabController _tabController;
  int tabBarIndex = 0;
  Color importantColor = const Color.fromARGB(255, 255, 117, 117);
  Color holidayColor = const Color.fromARGB(255, 120, 131, 192);
  Color occasionColor = const Color.fromARGB(255, 255, 227, 142);

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
    return Column(children: [
      //TABS FOR EVENTDAY
      Container(
        height: 35.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(color: kPrimaryColor, width: 1.5)),
        child: TabBar(
            onTap: ((value) {
              setState(() {
                tabBarIndex = value;
              });
            }),
            physics: const BouncingScrollPhysics(),
            unselectedLabelColor: kPrimaryColor,
            labelStyle: TextStyle(
              fontSize: 12.0,
              color: Colors.white,
              fontFamily: kFontFamily,
            ),
            unselectedLabelStyle: TextStyle(
                fontSize: 12.0, color: kPrimaryColor, fontFamily: kFontFamily),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: (tabBarIndex == 0)
                    ? importantColor
                    : (tabBarIndex == 1)
                        ? holidayColor
                        : occasionColor),
            controller: _tabController,
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
            tabs: [
              Tab(
                  child: SizedBox(
                width: kwidth! * 0.25,
                height: 35.0,
                child: const Center(
                  child: Text(
                    'IMPORTANT',
                    textScaleFactor: 1.0,
                  ),
                ),
              )),
              Tab(
                  child: SizedBox(
                width: kwidth! * 0.25,
                height: 35.0,
                child: const Center(
                  child: Text(
                    'HOLIDAY',
                    textScaleFactor: 1.0,
                  ),
                ),
              )),
              Tab(
                  child: SizedBox(
                width: kwidth! * 0.25,
                height: 35.0,
                child: const Center(
                  child: Text(
                    'OCCASION',
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
        height: 300.0,
        width: kwidth! * 0.85,
        //color: Colors.amber,
        child: TabBarView(
          controller: _tabController,
          children: [
            //IMPORTANT DAY EVENTS
            EventDayBuilder(widget.importantDayEventsList, context),
            //HOLIDAY EVENTS
            EventDayBuilder(widget.holidayDayEventsList, context),
            //OCCASSION DAY EVENTS
            EventDayBuilder(widget.occasionDayEventsList, context)
          ],
        ),
      ),
    ]);
  }
}

Widget RichTextCard(IconData iconData, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Text.rich(
      TextSpan(
        style: TextStyle(fontSize: 12.0, color: k3GreyColor),
        children: [
          WidgetSpan(
            child: Icon(iconData, size: 17.0, color: k3GreyColor),
          ),
          TextSpan(text: " $text"),
        ],
      ),
    ),
  );
}

Widget EventDayBuilder(List<Map<String, String>> List, BuildContext context) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: List.length,
      itemBuilder: ((context, index) {
        String eventTitle = List[index]["eventTitle"]!;
        String eventDesc = List[index]["eventDesc"]!;
        String eventDate = List[index]["eventDate"]!;
        String eventDay = List[index]["eventDay"]!;
        return Container(
          margin: const EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
          decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1.5, color: k3GreyColor)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(children: [
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: Text(eventTitle),
                  ),
                  RichTextCard(FontAwesomeIcons.calendarDays, eventDate),
                  RichTextCard(MdiIcons.clock, eventDay.toUpperCase())
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  eventDesc,
                  style: TextStyle(color: k3GreyColor, fontSize: 14.0),
                ),
              ),
              const SizedBox(height: 5.0),
            ],
          ),
        );
      }),
    ),
  );
}
