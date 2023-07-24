import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/student_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    // runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kAmberColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: StudentLogin(),
        home: StudentScreen());
  }
}
