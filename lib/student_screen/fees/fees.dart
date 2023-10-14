import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/fees/payment_builder.dart';
import 'package:schoolmate/widgets/background_widget.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> with TickerProviderStateMixin {
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

  List<Map<String, String>> paymentDue = [
    {
      "feeTitle": "SEMESTER I",
      "feeAmount": "50000",
      "feeDate": "12-18-2003",
      "feeMode": "OFFLINE"
    },
    {
      "feeTitle": "SEMESTER II",
      "feeAmount": "50000",
      "feeDate": "12-18-2003",
      "feeMode": "OFFLINE"
    },
    {
      "feeTitle": "SEMESTER III",
      "feeAmount": "50000",
      "feeDate": "12-18-2003",
      "feeMode": "OFFLINE"
    },
    {
      "feeTitle": "SEMESTER IV",
      "feeAmount": "50000",
      "feeDate": "12-18-2003",
      "feeMode": "OFFLINE"
    }
  ];
  List<Map<String, String>> paymentHistory = [
    {
      "feeTitle": "SEMESTER III",
      "feeAmount": "50000",
      "feeDate": "12-18-2003",
      "feeMode": "OFFLINE"
    },
    {
      "feeTitle": "SEMESTER IV",
      "feeAmount": "50000",
      "feeDate": "12-18-2003",
      "feeMode": "OFFLINE"
    },
    {
      "feeTitle": "SEMESTER III",
      "feeAmount": "50000",
      "feeDate": "12-18-2003",
      "feeMode": "OFFLINE"
    },
    {
      "feeTitle": "SEMESTER IV",
      "feeAmount": "50000",
      "feeDate": "12-18-2003",
      "feeMode": "OFFLINE"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: ScreenAppBar("FEES", false, context),
      body: Container(
        width: kwidth,
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0))),
        child: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
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
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: kFontFamily),
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
                          'PAYMENT',
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
                          'HISTORY',
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ))
                  ]),
            ),
            const SizedBox(
              height: 20.0,
            ),

            // //TAB BAR VIEW
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  //PAYMENT
                  PaymentBuilder(
                      paymentList: paymentDue,
                      textDesc: "FEES YET TO BE PAID",
                      feeAction: "PAY NOW",
                      feeActionIcon: Icons.arrow_forward),
                  //HISTORY
                  PaymentBuilder(
                      paymentList: paymentHistory,
                      textDesc: "PAYMENT HISTROY AND RECIPT",
                      feeAction: "DOWNLOAD",
                      feeActionIcon: Icons.arrow_downward)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
