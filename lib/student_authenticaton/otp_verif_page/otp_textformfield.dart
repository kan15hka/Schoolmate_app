import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants.dart';

class OtpTextFormField extends StatelessWidget {
  final otpController;
  const OtpTextFormField({super.key, required this.otpController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 45,
      child: TextFormField(
        onChanged: ((value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        }),
        cursorColor: Colors.black,
        controller: otpController,
        style: const TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 37, 36, 36), width: 3.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: kPrimaryColor, width: 3.0)),
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
