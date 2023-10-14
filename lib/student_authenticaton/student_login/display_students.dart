import 'package:flutter/material.dart';
import 'package:schoolmate/student_authenticaton/otp_verif_page/otp_verif_page.dart';
import '../../constants.dart';
import '../../widgets/background_widget.dart';

class DisplayStudents extends StatefulWidget {
  final List<Map<String, dynamic>> studentData;
  const DisplayStudents({super.key, required this.studentData});

  @override
  State<DisplayStudents> createState() => _DisplayStudentsState();
}

class _DisplayStudentsState extends State<DisplayStudents> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: BackgroundWidget(
          text: brandName,
          automaticallyImplyLeading: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              //STUDENTS REGISTERED
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'STUDENTS USING ',
                    style: kBodyLightTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: '+91 ' + widget.studentData[0]['phone_no_1'],
                        style: kBodyBoldTextStyle,
                      ),
                      const TextSpan(text: ' ARE'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'SELECT A STUDENT',
                textScaleFactor: 1.0,
                style: kBodyBoldTextStyle,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: kheight! * 0.45,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.studentData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            elevation: 0.0,
                            child: Container(
                              padding: const EdgeInsets.only(left: 25.0),
                              height: 90.0,
                              decoration: BoxDecoration(
                                  color: (index == selectedIndex)
                                      ? const Color.fromARGB(255, 200, 200, 200)
                                      : const Color.fromARGB(255, 241, 241, 241),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 189, 189, 189)),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      'assets/leo.jpg',
                                      height: 60.0,
                                      width: 60.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.studentData[index]['s_name']
                                              .toString()
                                              .toUpperCase(),
                                          style: kBodyBoldTextStyle,
                                          textScaleFactor: 1.0,
                                        ),
                                        Text(
                                          'XII - A',
                                          style: kBodyLightTextStyle,
                                          textScaleFactor: 1.0,
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Radio(
                                      focusColor:
                                          const Color.fromARGB(255, 44, 44, 44),
                                      activeColor:
                                          const Color.fromARGB(255, 44, 44, 44),
                                      // fillColor: MaterialStateProperty.all(
                                      //     Colors.black),
                                      value: index,
                                      groupValue: selectedIndex,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedIndex = value!;
                                        });
                                        print(value);
                                      })
                                ],
                              ),
                            )),
                      );
                    }),
              ),

              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtpVerificationPage(
                              phoneNumber: widget.studentData[0]
                                  ["phone_no_1"])),
                    );
                  },
                  style: kSecondaryButton,
                  child: Text(
                    'PROCEED',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.0,
                    style: kBodyBoldTextStyle,
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
