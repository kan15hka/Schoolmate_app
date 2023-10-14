import 'package:flutter/material.dart';
import 'package:schoolmate/services.dart';
import 'package:schoolmate/student_authenticaton/student_login/display_students.dart';
import 'package:schoolmate/student_authenticaton/student_login/student_qr1.dart';
import 'package:schoolmate/widgets/background_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../constants.dart';

class StudentPhone extends StatefulWidget {
  const StudentPhone({super.key});

  @override
  State<StudentPhone> createState() => _StudentPhoneState();
}

class _StudentPhoneState extends State<StudentPhone> {
  //student Id Text editing controller
  final TextEditingController _studentPhoneController = TextEditingController();

  final _form = GlobalKey<FormState>();
  String _studentPhone = '';
  final bool _isLoading = false;
  String _errorText = '';
  bool? isValid;

  @override
  void dispose() {
    _studentPhoneController.dispose();
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
    super.dispose();
  }

  void _findStudent() async {
    isValid = _form.currentState!.validate();

    if (!isValid!) {
      setState(() {
        _form.currentState!.reset();
        isValid = true;
        _studentPhoneController.clear();
        _studentPhone = '';
      });
      return;
    }

    _form.currentState!.save();

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      showSnackbar('NO INTERNET!! CONNECT TO THE INTERNET TO PROCEED');
      return;
    }
    //IMPORTANT
    // setState(() {
    //   _isLoading = true;
    // });

    // final responseBody = await ApiServices()
    //     .post('phone', {"phone": _studentPhone}).catchError((error) {
    //   print(error);
    // });

    // setState(() {
    //   _isLoading = false;
    // });
    // print(responseBody);
    // print(responseBody.runtimeType);
    // if (responseBody == 'null') {
    //   showSnackbar('INVALID PHONE NUMBER');
    //   return;
    // }

    // final List<Map<String, dynamic>> studentData =
    //     (jsonDecode(responseBody) as List)
    //         .map((dynamic e) => e as Map<String, dynamic>)
    //         .toList();
    // print(studentData);
    List<Map<String, dynamic>> studentData = [];
    if (_studentPhone == ApiServices().studentData[0]['phone_no_1']) {
      studentData = ApiServices().studentData;
    } else {
      showSnackbar('INVALID PHONE NUMBER!');
      return;
    }
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayStudents(
          studentData: studentData,
        ),
      ),
    );
  }

  void showSnackbar(String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: k14BoldTextStyle,
      ),
      margin: const EdgeInsets.only(bottom: 30.0, left: 20.0, right: 20.0),
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      backgroundColor: kPrimaryColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    //get the height and width of the device
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: BackgroundWidget(
          text: brandName,
          automaticallyImplyLeading: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              //PROCEED WITH STUDENT ID
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 20.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'PROCEED WITH ',
                    style: kBodyLightTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'STUDENT PHONE NUMBER',
                        style: kBodyBoldTextStyle,
                      ),
                    ],
                  ),
                ),
              ),

              //STUDENT ID TEXT FIELD
              Form(
                key: _form,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    height: (_errorText != '') ? 80.0 : 60.0,
                    width: width * 0.8,
                    child: TextFormField(
                      enableSuggestions: false,
                      onChanged: (value) {
                        // if (isValid != null && isValid == false) {
                        //   setState(() {
                        //     _form.currentState!.reset();
                        //     isValid = true;
                        //   });
                        // }
                        if (value.isEmpty) {
                          setState(() {
                            _errorText = 'Phone Number cannot be Empty!';
                          });
                        } else if (value.trim().length != 10) {
                          setState(() {
                            _errorText =
                                'Phone Number must be 10 digits longs!';
                          });
                        } else {
                          setState(() {
                            _errorText = '';
                          });
                        }
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length != 10) {
                          return 'Please Enter Valid Phone Number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _studentPhone = value!;
                      },
                      //textAlign: TextAlign.center,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.black, fontSize: 20.0),
                      controller: _studentPhoneController,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 7.0, horizontal: 15.0),
                        prefix: SizedBox(
                          width: width * 0.22,
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              const Text('+91')
                            ],
                          ),
                        ),
                        errorText: (_errorText == '') ? null : _errorText,
                        errorStyle:
                            const TextStyle(fontSize: 12.0, color: Colors.red),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: 'STUDENT PHONE NO',
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              //FIND STUDENT BUTTON
              ElevatedButton(
                  onPressed: _findStudent,
                  // onPressed: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: ((context) =>
                  //               StudentIdProfile(studentData: {}))));
                  // },
                  style: kSecondaryButton,
                  child: (_isLoading)
                      ? const Center(
                          child: SizedBox(
                            height: 25.0,
                            width: 25.0,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 3.0,
                            ),
                          ),
                        )
                      : Text(
                          'VERIFY NUMBER',
                          textScaleFactor: 1.0,
                          style: kBodyBoldTextStyle,
                        )),
              SizedBox(
                height: (height < 600) ? height * 0.05 : height * 0.1,
              ),
              //OR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: k3GreyColor,
                        thickness: 2.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR',
                        textScaleFactor: 1.0,
                        style: TextStyle(fontSize: 16.0, color: k3GreyColor),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: k3GreyColor,
                        thickness: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              //HAVING A QR CODE?
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 55.0, vertical: 20.0),
                  child: Text(
                    'HAVING A QR CODE?',
                    textScaleFactor: 1.0,
                    style: kBodyLightTextStyle,
                  )),
              ElevatedButton(
                  onPressed: () {
                    // FocusScope.of(context).unfocus();
                    // Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const StudentQR1()));
                  },
                  style: kSecondaryOutlinedButton,
                  child: Text(
                    'SCAN THE QR CODE',
                    textScaleFactor: 1.0,
                    style: kBodyBoldTextStyleWhite,
                  )),
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
        ));
  }
}
