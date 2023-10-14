import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';

class PaymentBuilder extends StatefulWidget {
  final List<Map<String, String>> paymentList;
  final String feeAction;
  final String textDesc;
  final IconData feeActionIcon;
  const PaymentBuilder(
      {super.key,
      required this.paymentList,
      required this.textDesc,
      required this.feeAction,
      required this.feeActionIcon});

  @override
  State<PaymentBuilder> createState() => _PaymentBuilderState();
}

class _PaymentBuilderState extends State<PaymentBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.textDesc,
          style: TextStyle(fontSize: 14.0, color: k3GreyColor),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Expanded(
          child: Container(
            color: kLSecondaryColor,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.paymentList.length,
                itemBuilder: (context, index) {
                  String feeTitle = widget.paymentList[index]["feeTitle"]!;
                  String feeAmount = widget.paymentList[index]["feeAmount"]!;
                  String feeDate = widget.paymentList[index]["feeDate"]!;
                  String feeMode = widget.paymentList[index]["feeMode"]!;

                  return Padding(
                    padding: EdgeInsets.only(top: (index == 0) ? 15.0 : 0.0),
                    child: FeePaymentCard(feeTitle, feeAmount, feeDate, feeMode,
                        widget.feeAction, widget.feeActionIcon),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

Widget TextRow(String title, String data) {
  return Center(
    child: Row(
      children: [
        const Spacer(),
        Expanded(
          flex: 6,
          child: Container(
            //color: Colors.red,
            child: Text(
              title,
              style: TextStyle(color: k3GreyColor, fontSize: 15.0),
            ),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Expanded(
          flex: 5,
          child: Container(
            //color: Colors.amber,
            child: Text(
              ": $data",
              style: const TextStyle(fontSize: 15.0),
            ),
          ),
        ),
        const Spacer(),
      ],
    ),
  );
}

Widget FeePaymentCard(String feeTitle, String feeAmount, String feeDate,
    String feeMode, String feeAction, IconData feeActionIcon) {
  return Container(
    margin: EdgeInsets.only(
        left: kwidth! * 0.125, right: kwidth! * 0.125, bottom: 10.0),
    height: 150.0,
    width: kwidth! * 0.75,
    decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: k3GreyColor, width: 1.5)),
    child: Column(children: [
      Container(
        height: 30.0,
        width: kwidth! * 0.75,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: k3GreyColor, width: 1.5))),
        child: Center(child: Text(feeTitle)),
      ),
      Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextRow("AMOUNT", feeAmount),
          TextRow("PAYMENT DATE", feeDate),
          TextRow("PAYMENT MODE", feeMode),
        ],
      )),
      Container(
        height: 30.0,
        width: kwidth! * 0.75,
        decoration: BoxDecoration(
            color: k4GreyColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0))
            // border: Border(
            //   top: BorderSide(color: k3GreyColor, width: 1.5),
            // ),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              feeAction,
              style: TextStyle(color: kWhite, fontSize: 15.0),
            ),
            const SizedBox(
              width: 3.0,
            ),
            Icon(
              feeActionIcon,
              size: 18.0,
              color: kWhite,
            )
          ],
        ),
      ),
    ]),
  );
}
