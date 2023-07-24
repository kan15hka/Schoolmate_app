import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants.dart';

class OtpTextFormField extends StatelessWidget {
  final otpController;
  OtpTextFormField({super.key, required this.otpController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        onChanged: ((value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        }),
        cursorColor: Colors.black,
        controller: otpController,
        style: Theme.of(context).textTheme.titleLarge,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 37, 36, 36), width: 3.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: kAmberColor, width: 3.0)),
          fillColor: Colors.white,
          filled: true,
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
